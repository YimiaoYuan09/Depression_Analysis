#### Preamble ####
# Purpose: Tests the number of observations of the model
# Author: Yimiao Yuan
# Date: 11 April 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# Pre-requisites: --


# Check the number of observations are as expected
test_that("Check number of observations is correct", {
  expect_equal(nrow(analysis_data), 280,
               info = "The number of observations is 280"
  )
})