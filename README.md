# Invasion hologenomics
This is the repository of the Invasion Hologenomics project. The project is partially funded by the European Union under the Marie Skłodowska Curie Actions program (Project: 101066225 — InvasOME — HORIZON-MSCA-2021-PF-01). <br> 
**Aim:** investigating whether metagenomic plasticity plays a role in biological invasions, i.e., whether invasive species may be able to quickly adapt to their new environment and oust native species thanks to a higher diversity and/or dynamism of their gut microbial community. <br>
**Study system & design:** we generated microbiome data from native Eurasian red squirrels (*Sciurus vulgaris*) and invasive North American Eastern grey squirrels (*S. carolinensis*), and will explore their variation along natural-urban gradients and across seasons. Grey squirrels have been introduced to Italy from the 20th century and their presence leads to the local extinction of native red squirrels mainly through exploitation competition for food. The species is currently subjected to mandatory control under the EU and national law. <br>
**Methods overview:** squirrels were live-trapped in twelve different sites located in northern Italy: two urban populations, two seminatural populations and two natural populations per species. Squirrels were individually marked and trapping was carried out three times per site: a spring-summer session (March-June), an autumn session (September-November) and a winter session (December-February), to gather longitudinal data at the individual level. At each sampling occasion, event data (i.e., location and date) and squirrel data (i.e., ID, sex, age class, weight, reproductive conditions) were recorded. Faecal samples were collected to generate microbiome data through shotgun metagenomics. The bioinformatics workflow used to generate metagenome-assembled genomes (MAGs) from raw sequencing data is described [here](https://www.earthhologenome.org/bioinformatics/). Faecal samples are also used to generate diet and parasite data, and squirrels were subjected to on-field behavioural tests (i.e., Open Field test and Mirror Image Stimulation) to gather individual personality data.

## Input data
The datasets used for the microbiome analyses, and included in the data folder, are: <br>
the **samples metadata** (squirrels_metadata.csv), including squirrels ID and species, type of area (i.e., natural, seminatural or urban) and season of trapping (i.e., spring-summer, autumn or winter) <br>
the **reads counts and coverage** obtained for each sample (squirrels_counts.tsv and squirrels_coverage.tsv) <br>
the **MAGs catalogue** (squirrels_mag_info.tsv) with information about each MAG's taxonomy, completeness, contamination and size <br>
the **MAGs phylogenetic tree** (squirrels.tree) <br>
the **MAGs functional annotation**, either KEGG-based (squirrels_merged_kegg.tsv) or based on [distillR](https://github.com/anttonalberdi/distillR) (squirrels_distillr.tsv) <br>
 

## Analysis steps

### Step 0 - Data Preparation
The code in 00-data_preparation.Rmd loads the input data files and groups them in an R object (squirrels_data.Rdata).


### Step 1 - Data Summary
The R code in 01-data_summary.Rmd, after uploading the required R libraries and data files, produces a summary of the sample and an overview of the generated metagenomic data. 

### Step 2 - MAGs Summary
The code in 02-MAGs_summary.Rmd gives a visual overview of MAGs phylogeny, quality and functional ordination. It also produces a filtered and normalized count table for further quantitative analyses and figures illustrating the taxonomic and functional composition of samples. 

### Step 3 - Diversity analysis
03-Diversity_analysis.Rmd contains the code for producing α and β diversity metrics at neutral, phylogenetic and functional level, and for initial comparisons between groups by means of boxplots and NMDS.

### Step 4 - Functional analysis
The code in 04-Functional analysis.Rmd provides an overview of genome-inferred functional trait (GIFT) profiles of MAGs and samples.

### Step 5 - Diversity models
04-Diversity_models.Rmd contains the code for running linear mixed models investigating the factors affecting variation in α diversity among samples.

### Step 6 - DA analysis
