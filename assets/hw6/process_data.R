#!/usr/bin/env Rscript
# Clean up data for HW6 revisions
library(tidyverse)


clean_polldata <- function (d) {
  # Clean up poll data to be abstract
  d %>%
    mutate(vote = recode(vote_2008,
                         `barack obama` = "A", `john mcCain` = "B")) %>%
    select(-state_contestedness, -party, -vote_2008)
}

set.seed(125)

d <- read_tsv("poll_data.tsv") %>%
  clean_polldata() %>%
  mutate(fold = sample(c(rep("survey", 9000), rep("target", 1000))))

d %>%
  filter(fold == "survey") %>%
  select(-fold) %>%
  write_tsv("survey.tsv")

d %>%
  filter(fold == "target") %>%
  transmute(id = 1:n(), state, sex, race, age, education, ideology) %>%
  write_tsv("target.tsv")

read_tsv("poll_data_full.tsv") %>%
  clean_polldata() %>%
  write_tsv("full_survey.tsv")
