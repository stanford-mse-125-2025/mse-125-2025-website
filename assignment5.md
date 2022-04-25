---
layout: page
title: Assignment 5
description: Details for Assignment 5.
nav_exclude: true
---
<head>
	<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
</head>

# Assignment 5

Unless otherwise stated, assignments are to be done individually.
You are welcome to work with others to master the principles and approaches used to
solve the homework problems, but the work you turn in should be your own.
Under no circumstance should you seek out or look at solutions to assignments given in previous years.

If you need help with any problem, be sure to follow the [Ed posting norms](../ed_tips).

## Overview

You have been recruited as a data scientist on the campaign
team of a presidential candidate; let's call this candidate A.
The team is about to launch a new nationwide effort to encourage registered
voters to come out and actually vote.
Of course, as a member of candidate A's campain team, you'd prefer to encourage
voters who are more likely to vote for candidate A.
Your job as the data scientist is to decide whom to target for this new
program.

## Problem 1


The survey team has collected a dataset of responses from 9,000
registered voters who were deemed unlikley to actually vote.
The data include some demographic information, as well as an indication of
who each individual is likely to vote for, if they do indeed vote.

### Problem 1, Part A

Download and explore the <a href="../assets/hw6/survey.tsv">survey data</a>, and
build a logistic regression model to estimate each individual's probability of
voting for candidate A using all the features in the dataset.

* List the fitted coefficients for each age group and gender.
Why doesn't your fitted model contain coefficients for every age group and
gender?
What is your interpretation of the coefficient values?

* Based on these results, what advice can you give to the campaign team?

### Problem 1, Part B

To the original survey data, we will now add two columns.

First, we will add a column containing the model-estimated probability that
each individual will vote for candidate A.

* Note that, by default, `predict()` will generate
predictions on the logit scale for logistic regression models.
To compute probability predictions, you must specify `type
  = "response"`. See `?predict.glm` for
details.

Next, add another column that converts the probabilistic predictions
for each individual to binary predictions based on the candidate they are
more likely to vote for.

* In this example, we would like to treat the case in which an individual
votes for candidate A as the positive case.

### Problem 1, Part C

Compute accuracy, precision, and recall for your binary predictions, where
voting for candidate A is the positive case.

* Please complete this exercise manually (i.e., without the use of any
package that automatically computes these values).

## Problem 2

Now we will use the fitted model from Problem 1 to decide which individuals to
encourage to vote.
The field team has compiled a list of 1,000 individuals who were deemed
good targets for the new program.
These are potential voters who are most likely to come out and actually vote
if encouraged, but will likely not vote otherwise.

### Problem 2, Part A

Download the <a href="../assets/hw6/target.tsv">target data</a>.

As with the survey data, add a column to the target data containing the
model-predicted probability that each individual will vote for candidate A.

### Problem 2, Part B

Due to budget constraints, your team can only reach out to 300 individuals
on the list.

Create a data frame of 300 rows, named `shortlist`,
which contains the 300 potential voters you would recommend that your team
reach out to. Explain why you choose those 300 people.

### Problem 2, Part C

If your team were to reach out to the 300 potential voters you recommended
above, how many of them do you expect to vote for candidate A? Why?

* You can assume that anyone in your list who has been encouraged to vote will
vote.

## Problem 3

Please provide a brief (1-2 paragraph) status update on your project, including your specific contributions thus far and your plans for the upcoming week.

## Submission

Prepare a short report detailing your results.

Please submit the following:
1. your report as a single PDF file
2. a single, fully functional `R` script or markdown file that we can run to reproduce all the numerical results and plots in your report.

We will put the necessary data files (`survey.tsv` and `target.tsv`) into the same directory as your script before running it.

Be sure to read [these report tips](report_tips.md) before preparing your submission. 
Reports that are difficult to parse may lose credit. 

Please submit your work on Canvas.

