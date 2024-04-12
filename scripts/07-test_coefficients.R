#### Preamble ####
# Purpose: Tests the coefficients of the model
# Author: Yimiao Yuan
# Date: 11 April 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# Pre-requisites: run 04-model.R first to get the model


# Checks of the coefficients
test_that("Check coefficients", {
  expect_gt(depression_model$coefficients[3], -3)
  expect_lt(depression_model$coefficients[3], 25)
})