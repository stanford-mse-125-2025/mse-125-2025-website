#!/usr/bin/env Rscript
# Pre-process data for HW7
library(tidyverse)
library(ROCR)

clean_polldata <- function (d) {
  # Clean up poll data to be abstract
  d %>%
    mutate(state_contestedness = recode(state_contestedness,
                                        `solid romney` = "solid B",
                                        `solid obama` = "solid A"),
           party = recode(party, democrat = "A", republican = "B"),
           vote = recode(vote_2008,
                         `barack obama` = "A", `john mcCain` = "B")) %>%
    select(-vote_2008)
}

set.seed(125)

read_tsv("poll_train_small.tsv") %>%
  clean_polldata() %>%
  write_tsv("survey_small.tsv")

read_tsv("poll_train_complete.tsv") %>%
  clean_polldata() %>%
  write_tsv("survey_complete.tsv")

read_tsv("poll_test.tsv") %>%
  clean_polldata() %>%
  write_tsv("survey_test.tsv")

# Test code ---------------------------------------------------------------
# Code to test that the assignment works out
compute_auc <- function(p, labels) {
  pred <- prediction(p, labels)
  auc <- performance(pred, 'auc')
  auc <- unlist(slot(auc, 'y.values'))
  auc
}

train_small <- read_tsv("survey_small.tsv") %>%
  mutate(candidate_A = vote == "A")

m_1a <- glm(candidate_A ~ state + sex + race + age + education + ideology,
            data = train_small,
            family = binomial)

train_small %>%
  summarize(auc = compute_auc(predict(m_1a, type = "response"), candidate_A))

test_df <- read_tsv("survey_test.tsv") %>%
  mutate(candidate_A = vote == "A")

test_df %>%
  summarize(auc = compute_auc(predict(m_1a, test_df, type = "response"),
                              candidate_A))

train_full <- read_tsv("survey_complete.tsv") %>%
  mutate(candidate_A = vote == "A")

m_1c <- glm(candidate_A ~ state + sex + race + age + education + ideology,
            data = train_full,
            family = binomial)

train_full %>%
  summarize(auc = compute_auc(predict(m_1c, type = "response"), candidate_A))

test_df %>%
  summarize(auc = compute_auc(predict(m_1c, test_df, type = "response"),
                              candidate_A))
