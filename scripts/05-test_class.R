#### Preamble ####
# Purpose: Tests the class of observations before pass into the model
# Author: Yimiao Yuan
# Date: 11 April 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# Pre-requisites: --


# Check the class of observations are as expected
test_that("Check class", {
  expect_type(analysis_data$depression_status_binary, "double")
  expect_type(analysis_data$pet_group, "character")
  expect_type(analysis_data$age_group, "character")
  expect_type(analysis_data$bmi_status, "character")
})