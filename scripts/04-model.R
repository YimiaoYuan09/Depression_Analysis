#### Preamble ####
# Purpose: Models
# Author: Yimiao Yuan
# Date: 11 April 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: run 01-download_data.R and 02-data_cleaning.R first to
# get the cleaned dataset


#### Workspace setup ####
library(tidyverse)
library(arrow)
library(rstanarm)
library(testthat)

#### Read data ####
analysis_data <- read_parquet("data/analysis_data/clean_pet_data.parquet")

# Convert variables to factors
analysis_data$pet_group <- factor(analysis_data$pet_group)
analysis_data$age_group <- factor(analysis_data$age_group)
analysis_data$bmi_status <- factor(analysis_data$bmi_status)

# Create depression_status variable in binary form
analysis_data$depression_status_binary <- ifelse(analysis_data$depression_status == "depressed", 0, 1)

# Check the class and number of observations are as expected
test_file("scripts/05-test_class.R")
test_file("scripts/06-test_observations.R")

### Model data ####
set.seed(820)

depression_model <-
  stan_glm(
    depression_status_binary ~ pet_group + age_group + bmi_status,
    data = analysis_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 820
  )

# Check coefficients of the model
test_file("scripts/07-test_coefficients.R")


#### Save model ####
saveRDS(
  depression_model,
  file = "models/depression_model.rds"
)
