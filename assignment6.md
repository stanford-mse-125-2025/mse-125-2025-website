---
layout: page
title: Assignment 6
description: Details for Assignment 6.
nav_exclude: true
---
<head>
	<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
</head>

# Assignment 6

Unless otherwise stated, assignments are to be done individually.
You are welcome to work with others to master the principles and approaches used to
solve the homework problems, but the work you turn in should be your own.
Under no circumstance should you seek out or look at solutions to assignments given in previous years.

If you need help with any problem, be sure to follow the [Ed posting norms](../ed_tips).

## Overview

Continuing our example from Assignment 5, we will
use survey data to investigate bias-variance trade-offs, over-fitting,
under-fitting, cross-validation, and regularization.

## Problem 1

Download and explore a <a href="../assets/hw7/survey_small.tsv">small
dataset</a> that includes a subset of 400 responses, similar to the
survey data introduced in Assignment 5, but now
with a few more features.

* Throughout this problem set we will be predicting the likelihood that an
individual will vote for candidate A, so for convenience you may wish
to create a binary (TRUE / FALSE) variable,
`candidate_A` that records whether or not
each individual indicated support for candidate A.

* Also, you may find it useful to compute AUC via the `ROCR` package, where necessary.
Be sure to reference discussion notes for
how to define your own `compute_auc()`
function.

### Problem 1, Part A

Using all the available features, fit a logistic regression model on the
small dataset of 400 rows to predict the probability that an
individual will vote for candidate A.
Evaluate the performance of the model by computing AUC on the
same data that you fit the model on.

### Problem 1, Part B

Download a <a href="../assets/hw7/survey_test.tsv">test set</a> of 400
new responses.
Using the model you fit in 1a, predict votes for these new
individuals.

* Note that you should <strong>not</strong> re-train your model on
this test set; rather, use the model you fit on the initial set of
data in 1a to simply generate predictions on this new test set.

Evaluate the performance of the model on the test set by computing the AUC. 
Compare the performance of the model on the two datasets, and briefly
comment on any differences you observe.

### Problem 1, Part C

Re-train the model using a
<a href="../assets/hw7/survey_complete.tsv">larger dataset</a>
with 9,500 observations (which includes the 400 responses from 1a, but
not the 400 observations from the test set in 1b).

For the newly fitted model, evaluate its performance on both this
larger dataset and the test set from 1b.
Briefly comment on what you find.

## Problem 2

<p>
	Now we explore the idea of model selection using cross-validation and
  \(L^p\) regularization, to improve our model from Problem 1.
</p>

For this problem, use the same
<a href="../assets/hw7/survey_small.tsv">small dataset</a> of 400
observations, and the <a href="../assets/hw7/survey_test.tsv">test
set</a> that we've been using in Problem 1.
Do <strong>not</strong> use the larger dataset of 9,500 rows.

### Problem 2, Part A

Start with the <a href="../assets/hw7/survey_small.tsv">400
  observations</a> from part 1a, and divide the dataset into two
components: a training set consisting of the first 300 observations, and
a validation set with the remaining 100 observations.
Do <i>not</i> shuffle the dataset before splitting.

Fit L1- and L2-regularized models on the training set
with 10 values of the regularization parameter
`lambda`.

* To implement L1 and L2 regularization in `R`,
we use the `glmnet` package.
The `glmnet` package makes fitting
regularized models simple, but it requires a model matrix instead of
a formula.
Reading the documentation
for `glmnet` is highly recommended.

* The number of `lambda` values to fit can be
specified with the `nlambda` parameter.
For example, to train an L1-regularized model on a data frame named
`train_data`, using 10 values of
`lambda`with a response variable in
the `candidate_A` column, and just
`age` as a covariate, you can use this code:

```
  x <- model.matrix(candidate_A ~ age, train_data)[, -1]
  y <- train_data$candidate_A
  model <- glmnet(x, y, alpha = 1, nlambda = 10, family="binomial")
```

* We use `alpha = 1` for
L1-regularization, and `alpha = 0` for
L2-regularization.

* You'll need to adapt the above code to train a model that uses all the available features.

* Once a model is fit, the actual values of `lambda`
used can be extracted from the model with
`model$lambda`.

### Problem 2, Part B

For each of the 20 resulting models
(10 values of `lambda` for each of the L1 and
L2-regularized models),
compute AUC on the training set (300 rows) and validation set (100 rows).

* Using `predict()` with `glmnet` will generate a matrix of predictions for
all values of `lambda` that were used to fit
your model.

* For example, to generate predictions from the fitted model on a
data frame of 100 rows named `d`, you can adapt this code:

```
  new_x <- model.matrix(candidate_A ~ age, d)[, -1]
  p <- predict(model, newx = new_x, type = "response")
```

* This will result in a matrix of 100 rows (corresponding to the rows
of `d`) and 10 columns (corresponding to the
values of `model$lambda`).

Plot two lines that show how AUC on the training and validation sets
change as a function of the regularization parameter
`lambda`,
for each of the L1 and L2-regularized models.

* In other words, plot the value of `lambda` on the x-axis, and the
value of AUC achieved on the training and validation set on the
y-axis.

* For this plot, use a log10-scale for the x-axis (see `scale_x_log10` in `ggplot`).


### Problem 2, Part C

i. For each of the L1 and L2-regularized models,
select the value of `lambda` that achieved
highest AUC on the validation set. 

* As a result, you should have two
models, one L1 and one L2-regularized model.

ii. Report the value of AUC on the validation set achieved for each of
the two selected models.

iii. Plot coefficient values for the selected L1 and L2-regularized
models. Briefly comment on what you observe.

* You can extract the model coefficients with the `coef`
command.

* To specifically extract the coefficients for a model that uses
`lambda = l`, set the `s`
parameter to `l`, e.g., `coef(model, s = l)`.

iv. Finally, of the two models, select the single model that acheived
the highest validation AUC. Compute the AUC for this model on the
test set.

* To generate predictions from the fitted model on a
data frame named `d`, using
a specific value of `lambda`, you can write:

```
    new_x <- model.matrix(candidate_A ~ age, d)[, -1]
    p <- predict(model, newx = new_x, type = "response", s = l)
```

* In the code above, `l` is the value of
`lambda` you would like to use for
generating the predictions.

## Problem 3

Please provide a brief (1-2 paragraph) status update on your project, including your specific contributions thus far and your plans for the upcoming week.

## Submission

Prepare a short report detailing your results.

Please submit the following:
1. your report as a single PDF file
2. a single, fully functional `R` script or markdown file that we can run to reproduce all the numerical results and plots in your report.

We will put the necessary data files into the same directory as your script before running it.

Be sure to read [these report tips](report_tips.md) before preparing your submission. 
Reports that are difficult to parse may lose credit. 

Please submit your work on Canvas.

