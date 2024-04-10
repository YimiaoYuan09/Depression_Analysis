#### Preamble ####
# Purpose: Tests the cleaned pet owners and non-pet owners data
# Author: Yimiao Yuan
# Date: 09 April 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: run 01-download_data.R and 02-data_cleaning.R first to get
# the raw data and cleaned analysis data


#### Workspace setup ####
library(tidyverse)
library(arrow)


#### Test data ####
# read in cleaned analysis data
cleaned_pet_data <- read_parquet("data/analysis_data/clean_pet_data.parquet")


# check column class: pet_group, age_group, gender, bmi_status
# depression_status, pet_type
class(cleaned_pet_data$pet_group) == "character"
class(cleaned_pet_data$age_group) == "character"
class(cleaned_pet_data$gender) == "character"
class(cleaned_pet_data$bmi_status) == "character"
class(cleaned_pet_data$depression_status) == "character"
class(cleaned_pet_data$pet_type) == "character"


# check range of data
# pet_group
correct_pet_group <- c("non-pet owners", "pet owners")

if (all(cleaned_pet_data$pet_group |>
        unique() %in% correct_pet_group)) 
{
  "The cleaned pet_group match the expected pet_group"
} else {
  "Not all of the pet_group have been cleaned completely"
}


# age_group
correct_age_group <- 
  c(
    "less than 15 years",
    "15-25 years",
    "26-35 years",
    "36-45 years",
    "46-55 years",
    "greater than 56 years"
    )

if (all(cleaned_pet_data$age_group |>
        unique() %in% correct_age_group)) 
{
  "The cleaned age_group match the expected age_group"
} else {
  "Not all of the age_group have been cleaned completely"
}


# gender
correct_gender <- c("male", "female")

if (all(cleaned_pet_data$gender |>
        unique() %in% correct_gender)) 
{
  "The cleaned gender match the expected gender"
} else {
  "Not all of the gender have been cleaned completely"
}


# bmi_status
correct_bmi_status <- 
  c(
    "under weight",
    "normal weight",
    "over weight",
    "obese"
  )

if (all(cleaned_pet_data$bmi_status |>
        unique() %in% correct_bmi_status)) 
{
  "The cleaned bmi_status match the expected bmi_status"
} else {
  "Not all of the bmi_status have been cleaned completely"
}


# depression_status
correct_depression_status <- c("depressed", "non-depressed")

if (all(cleaned_pet_data$depression_status |>
        unique() %in% correct_depression_status)) 
{
  "The cleaned depression_status match the expected depression_status"
} else {
  "Not all of the depression_status have been cleaned completely"
}


# pet_type
# NA for non pet owners
# no respondents has cat+rabbit or others as type of pets
correct_pet_type <- 
  c(
    "dog",
    "cat",
    "bird",
    "rabbit",
    "dog, cat",
    "dog, bird",
    "dog, cat, bird, rabbit",
    "cat, bird",
    "cat, bird, rabbit",
    NA
  )

if (all(cleaned_pet_data$pet_type |>
        unique() %in% correct_pet_type)) 
{
  "The cleaned pet_type match the expected pet_type"
} else {
  "Not all of the pet_type have been cleaned completely"
}