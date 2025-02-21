# Invasion hologenomics
This is the repository of the Invasion Hologenomics project. The project is partially funded by the European Union under the Marie Skłodowska Curie Actions program (Project: 101066225 — InvasOME — HORIZON-MSCA-2021-PF-01) and is carried out within the [Earth Hologenome Initiative](https://www.earthhologenome.org/) framework. <br> 
<br> 
**Project aim:** investigating whether metagenomic plasticity plays a role in biological invasions, i.e., whether invasive species may be able to quickly adapt to their new environment and oust native species thanks to a higher diversity and/or dynamism of their gut microbial community. <br>
<br> 
**Study system & design:** we generated microbiome data from native Eurasian red squirrels (*Sciurus vulgaris*) and invasive North American Eastern grey squirrels (*S. carolinensis*), and will explore their variation along natural-urban gradients and across seasons. Grey squirrels have been introduced to Italy from the 20th century and their presence leads to the local extinction of native red squirrels mainly through exploitation competition for food. The species is currently subjected to mandatory control under the EU and national law. <br>
<br> 
**Methods overview:** squirrels were live-trapped in different sites located in northern Italy and characterized by varying level of urbanization. For each trapping grid, an urbanization index (0-1) was derived using Corine Land Cover data. Squirrels were individually marked and trapping was carried out three times per site: a spring-summer session (March-June), an autumn session (September-November) and a winter session (December-February), to gather longitudinal data at the individual level. At each sampling occasion, event data (i.e., location and date) and squirrel data (i.e., ID, sex, age class, weight, reproductive conditions) were recorded. Faecal samples were collected to generate microbiome data through shotgun metagenomics. The bioinformatics workflow used to generate metagenome-assembled genomes (MAGs) from raw sequencing data is described [here](https://www.earthhologenome.org/bioinformatics/). 

## Input data
The main datasets used for the microbiome analyses, and included in the data folder, are: <br>
the **samples metadata** (squirrels_metadata.csv), including squirrels ID and species, type of area (i.e., rural, suburban or urban), urbanization index (index500) and season of trapping (i.e., spring-summer, autumn or winter) <br>
the **reads counts and coverage** obtained for each sample (squirrels_counts.csv and squirrels_coverage.csv) <br>
the **MAGs catalogue** (squirrels_mag_info.csv) with information about each MAG's taxonomy, completeness, contamination and size <br>
the **MAGs phylogenetic tree** (squirrels.tree) <br>
the **MAGs functional annotation**, either KEGG-based (squirrels_merged_kegg.csv) or based on [distillR](https://github.com/anttonalberdi/distillR) (squirrels_distillr.csv) <br>

## Analysis steps

#### Step 0 - Data Preparation
The code in 00-data_preparation.Rmd loads the input data files, produces a filtered and normalized genome count table for further quantitative analyses and groups all the required dataframes and the customised colour palettes in an R object (squirrels_data.Rdata) for downstream analyses.

#### Step 1 - Data Summary
The R code in 01-data_summary.Rmd, after uploading the required R libraries and data files, produces a summary of the sample and an overview of the generated metagenomic data. 

#### Step 2 - MAGs Overview
The code in 02-MAGs_overview.Rmd gives a visual overview of MAGs phylogeny, quality and functional ordination.  

#### Step 3 - Community composition
03-community_composition.Rmd generates plots illustrating the taxonomic and functional microbial composition of samples, as well as the distribution and relative abundance of the different taxa in the two squirrel species.

#### Step 4 - Functional analysis
The code in 04-functional analysis.Rmd provides an overview of genome-inferred functional traits (GIFTs) profiles of MAGs and samples.

#### Step 5 - Diversity analysis
05-diversity_analysis.Rmd contains the code for producing α and β diversity metrics, and for running bayesian regressions and PERMANOVAs investigating their variation.

#### Step 6 - Differential abundance analysis
The code in 06-diff_abundance.Rmd identifies the microbial taxa that are differentially abundant in the two squirrel species.

#### Step 7 - Joint Species Distribution Modelling - model setup
07-hmsc_setup.Rmd provides the code for setting up JSDMs under the bayesian framework HMSC.

#### Step 8 - Joint Species Distribution Modelling - output analysis
08-hmsc_analysis.Rmd provides the code for analysing the HMSCs output, including predictions on differential microbiota composition and functionality in the two squirrel species.

## Analysis output

The **bookdown-rendered webbook** containing all the above code and its output is available at:

[alberdilab.github.io/invasion_hologenomics](https://alberdilab.github.io/invasion_hologenomics)

While the webbook provides a user-friendly overview of the procedures, analyses can be directly reproduced using the **.Rmd** files stored in the root directory of this repository. Note that some code chunks that require heavy computation might have been turned off using 'eval=FALSE' or cached using 'cache=TRUE'. To re-render the webbook, you can use the following code:

```r
library(bookdown)
library(htmlwidgets)
library(webshot)

render_book(input = ".", output_format = "bookdown::gitbook", output_dir = "docs")
```

