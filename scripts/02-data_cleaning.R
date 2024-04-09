#### Preamble ####
# Purpose: Cleans the raw pet owners and non-pet onwers data
# Author: Yimiao Yuan
# Date: 08 April 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: run 01-download_data.R first to get the raw data
# The codebook of raw data is available at: Value Numbering.docx
# https://data.mendeley.com/datasets/bvrzf2s9j7/6/files/8c6cf6a9-ff1d-4aab-a534-dd94dcfb38ab

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(arrow)

#### Clean data ####
# read in raw data
raw_pet_data <- read_csv("data/raw_data/raw_pet_data.csv")

# explore: pet group, pet type, gender, age, BMI, depression
clean_pet_data <-
  raw_pet_data |>
  clean_names() |>
  rename(
    pet_group = group,
    age_group = agegroup,
    depression_status = depressionstatus,
    pet_type = typeofpet
  ) |>
  mutate(
    pet_group = if_else(pet_group == 0, "pet owners", "non-pet owners"),
    age_group = case_when(
      age_group == 0 ~ "less than 15 years",
      age_group == 1 ~ "15-25 years",
      age_group == 2 ~ "26-35 years",
      age_group == 3 ~ "36-45 years",
      age_group == 4 ~ "greater than 46 years"
    ),
    gender = if_else(gender == 0, "male", "female"),
    bmi_status = case_when(
      bmi_status == 0 ~ "under weight",
      bmi_status == 1 ~ "normal weight",
      bmi_status == 2 ~ "over weight",
      bmi_status == 3 ~ "obese"
    ),
    depression_status = if_else(depression_status == 0, "depressed", "non-depressed"),
    pet_type = case_when(
      pet_type == 0 ~ "dog",
      pet_type == 1 ~ "cat",
      pet_type == 2 ~ "bird",
      pet_type == 3 ~ "rabbit",
      pet_type == 4 ~ "dog, cat",
      pet_type == 5 ~ "dog, bird",
      pet_type == 6 ~ "dog, cat, bird, rabbit",
      pet_type == 7 ~ "cat, bird",
      pet_type == 8 ~ "cat, bird, rabbit"
    )
  ) |>
  select(pet_group, age_group, gender, bmi_status, depression_status, pet_type)


#### Save data ####
write_parquet(clean_pet_data, "data/analysis_data/clean_pet_data.parquet")
