#### Preamble ####
# Purpose: Downloads and saves the raw data from Mendeley Data on the
# effects of pets on depression
# Author: Yimiao Yuan
# Date: 08 April 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: --
# The raw dataset is available at: https://data.mendeley.com/datasets/bvrzf2s9j7/6


#### Workspace setup ####
library(tidyverse)
library(haven)


#### Download data ####
# the raw data is downloaded from the website and
# saved in the /data/raw_data folder
raw_pet_data <- read_sav("data/raw_data/raw_data.sav")


#### Save data ####
write_csv(raw_pet_data, "data/raw_data/raw_pet_data.csv")

         
