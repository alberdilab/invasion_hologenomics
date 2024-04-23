#!/bin/bash
#SBATCH --job-name=hmsc_model.2a_250_1                   # Job name
#SBATCH --nodes=1
#SBATCH --ntasks=4                      # Run on 4 CPUs
#SBATCH --mail-user=antton.alberdi@sund.ku.dk
#SBATCH --mem=200gb                     # Job memory request
#SBATCH --time=1265                       # In minutes

# Activate conda environment
module load mamba/1.3.1
if ! conda info --envs | grep -q hmsc; then
  mamba create -p ./hmsc/hmsc_env -y r-essentials r-base r-tidyverse r-Hmsc
fi

# Activate conda environment
source activate ./hmsc/hmsc_env

# Run R script
Rscript -e '
library(tidyverse)
library(Hmsc)
# Load formulas and data
load("hmsc/hmsc.Rdata")

# Declare placeholders
modelname = "model.2a"
model = model_list$model.2a
fitname = "hmsc/fit_model.2a_250_1.Rdata"
convname = "hmsc/conv_model.2a_250_1.Rdata"
sample = 250
thin = 1
nchains = 4

# Run model fitting
m = sampleMcmc(hM = model,
         samples = sample,
         thin = thin,
         adaptNf=rep(ceiling(0.4*sample*thin),model$nr),
         transient = ceiling(0.5*sample*thin),
         nChains = nchains,
         nParallel = nchains)

# Assess chain convergence
mpost = convertToCodaObject(m,
      spNamesNumbers = c(T,F),
      covNamesNumbers = c(T,F),
      Beta = TRUE,
      Gamma = TRUE,
      V = FALSE,
      Sigma = FALSE,
      Rho = TRUE,
      Eta = FALSE,
      Lambda = FALSE,
      Alpha = FALSE,
      Omega = FALSE,
      Psi = FALSE,
      Delta = FALSE) # Convert to CODA object

# Fixed effects
assign(paste0("psrf.beta.", modelname,"_",sample,"_",thin), gelman.diag(mpost$Beta,multivariate=FALSE)$psrf)

# Traits
assign(paste0("psrf.gamma.", modelname,"_",sample,"_",thin), gelman.diag(mpost$Gamma,multivariate=FALSE)$psrf)

# Phylogeny
assign(paste0("psrf.rho.", modelname,"_",sample,"_",thin), gelman.diag(mpost$Rho,multivariate=FALSE)$psrf)

# Write convergence data
save(psrf.beta.model.2a_250_1, psrf.gamma.model.2a_250_1, psrf.rho.model.2a_250_1, file=convname)

# Save model fit object
save(m, file=fitname)
'

