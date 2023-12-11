# Invasion hologenomics
This is the repository of the Invasion Hologenomics project. The project is partially funded by the European Union under the Marie Skłodowska Curie Actions program (Project: 101066225 — InvasOME — HORIZON-MSCA-2021-PF-01). <br> 
**Aim:** investigating whether metagenomic plasticity plays a role in biological invasions, i.e., whether invasive species may be able to quickly adapt to their new environment and oust native species thanks to a higher diversity and/or dynamism of their gut microbial community. <br>
**Study system & design:** we generated microbiome data from native Eurasian red squirrels (*Sciurus vulgaris*) and invasive North American Eastern grey squirrels (*S. carolinensis*), and will explore their variation along a natural-urban gradient and across seasons. Grey squirrels have been introduced to Italy from the 20th century and their presence leads to the local extinction of native red squirrels mainly through exploitation competition for food. The species is currently subjected to mandatory control under the EU and national law. <br>
**Methods overview:** squirrels were live-trapped in twelve different sites located in northern Italy: two urban populations, two seminatural populations and two natural populations per species. Squirrels were individually marked and trapping was carried out three times per site: a spring-summer session (March-June), an autumn session (September-November) and a winter session (December-February), to gather longitudinal data at the individual level. At each sampling occasion, event data (i.e., location and date) and squirrel data (i.e., ID, sex, age class, weight, reproductive conditions) were recorded and faecal samples were collected to generate microbiome data through shotgun metagenomics. The bioinformatics workflow used to generate metagenome-assembled genomes (MAGs) from raw sequencing data is described [here](https://www.earthhologenome.org/bioinformatics/). Faecal samples are also used to generate diet and parasite data, and squirrels have been subjected to on-field behavioural tests (i.e., Open Field test and Mirror Image Stimulation) to gather individual personality data.

## Input data
The datasets used for the microbiome analyses, and included in the data folder, are: <br>
the **samples metadata** (squirrels_metadata.csv), including squirrels ID and species, type of area (i.e., natural, seminatural or urban) and season of trapping (i.e., spring-summer, autumn or winter) <br>
the **MAGs catalogue** (squirrels_mag_info.tsv) with information about each MAG's taxonomy, completeness, contamination and size <br>
the **MAGs phylogenetic tree** (squirrels.tree) <br>
the **MAGs functional annotation**, either KEGG-based (squirrels_merged_kegg.tsv) or based on [distillR](https://github.com/anttonalberdi/distillR) (squirrels_distillr.tsv) <br>
the **MAGs counts and coverage** in each sample (squirrels_counts.tsv and squirrels_coverage.tsv) 

## Analysis steps
Describe analysis steps here

### Step 1 - Data Summary
The R code in 01.data_summary.Rmd, after uploading the required R libraries and data files, produces a summary of the sample (in terms of size, geographical location and squirrels sampled by species, area-type and season) and an overview of the generated metagenomic data (amount of raw sequencing data, origin of the different DNA fractions and number of obtained MAGs). 

### Step 2 - MAGs Summary
Description and link to RmD 2.

### Step 3 - Diversity Analyses
