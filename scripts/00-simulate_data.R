#### Preamble ####
# Purpose: Simulates the pet owners and non-pet owners data and their
# depression scale
# Author: Yimiao Yuan
# Date: 08 April 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: --


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(820)

num_obs <- 280

# health level: bigger number healtheir
simulate_pet_data <-
  tibble(
    pet_group = sample(0:1, num_obs, replace = TRUE),
    pet = if_else(pet_group == 1, sample(0:3, num_obs, replace = TRUE), NA),
    age = sample(15:65, num_obs, replace = TRUE),
    gender = sample(0:1, num_obs, replace = TRUE),
    income = rnorm(num_obs, mean= 60000, sd = 20000),
    health_level = rnorm(num_obs, mean = 7, sd = 3) |> floor(),
    depression_score = sample(0:27, num_obs, replace = TRUE)
  )

simulate_pet_data <-
  simulate_pet_data |>
  mutate(
    pet_group = if_else(pet_group == 0, "no pets", "have pets"),
    pet = case_when(
      pet == 0 ~ "dog",
      pet == 1 ~ "cat",
      pet == 2 ~ "bird",
      pet == 3 ~ "hamster",
      TRUE ~ NA
    ),
    age = case_when(
      age < 25 ~ "less than 25 years",
      age <= 35 ~ "25-35 years",
      age <= 45 ~ "35-45 years",
      age <= 55 ~ "45-55 years",
      TRUE ~ "greater than 55 years"
    ),
    gender = if_else(gender == 0, "male", "female"),
    income = case_when(
      income < 40000 ~ "below 40k",
      income <= 50000 ~ "40k - 50k",
      income <= 60000 ~ "50k - 60k",
      income > 60000 ~ "above 60k"
    ),
    depression_level = case_when(
      depression_score < 10 ~ "not depressed",
      depression_score < 20 ~ "Mildly depressed",
      depression_score >= 20 ~ "Severely depressed"
    )
  )


