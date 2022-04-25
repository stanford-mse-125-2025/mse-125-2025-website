---
layout: page
title: Assignment 4
description: Details for Assignment 4.
nav_exclude: true
---
<head>
	<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
</head>

# Assignment 4

Unless otherwise stated, assignments are to be done individually.
You are welcome to work with others to master the principles and approaches used to
solve the homework problems, but the work you turn in should be your own.
Under no circumstance should you seek out or look at solutions to assignments given in previous years.

If you need help with any problem, be sure to follow the [Ed posting norms](../ed_tips).

## Overview

In this assignment you'll explore correlation, simple regression, multiple regression, and confidence intervals.
<!-- and prediction intervals. -->

## Problem 1

<p>
    Note that you do not need to do any computations for this problem,
    but should provide clear justification for your answers.
</p>

### Problem 1, Part A

Give an example, in words, of two random variables that have strong positive
correlation and two random variables that have strong negative correlation.
Do the same for pairs of random variables that are weakly positively / negatively correlated.
(In total, you should have four examples.)

### Problem 1, Part B

Give one example of when two random variables are correlated and
causally related.
Provide justification as to why you think the relationship is causal.
Give one example of when two random variables are correlated but not
causally related. Clearly justify why there is a correlation, and
show that the relationship is not causal by identifying a confounder.


## Problem 2

<p>
    In this problem and the next, we'll use
    <a href="../assets/hw5/used_cars_clean.tsv">data</a> of used cars listed for
    sale at <a href="http://www.edmunds.com/" target="_blank">
    Edmunds.com</a> to build regression models for predicting used car prices.
</p>

### Problem 2, Part A

<p>
Read the <a href="../assets/hw5/used_cars_clean.tsv">used car listing data</a>
into R.
Extract all the listings for a used Honda Accord. Using the extracted
data, build a regression to predict the price of a used Honda Accord
(\(y_{price}\)) based on its mileage (\(x_{mileage}\)). That is, fit the
model 
</p>

<p align="center">
    \(y_{price} = \beta_0 + \beta_1 x_{mileage} + \epsilon \)
</p>

<p>
on the Accord data.
What is the value of each coefficient \(\beta_0, \beta_1\)? Comment on
your interpretation of these values. How well does the model fit the
data (i.e., what is the \(R^2\) and RMSE)?
</p>

### Problem 2, Part B

Given a used Honda Accord with an odometer reading of 50,000 miles,
compute the model estimated mean price and confidence
interval for that mean
<!-- and the prediction interval of the price  -->
(You can use the
<a href="https://stat.ethz.ch/R-manual/R-patched/library/stats/html/predict.lm.html" class="code">
    predict.lm</a> function in <span class="code">R</span>).
Compute the model estimated mean price for a Honda Accord with an
odometer reading of <strong>300,000</strong> miles.
Based on the results, what is a critical issue in your
current regression model?

### Problem 2, Part C

How would you address the critical issue identified in the previous
section? Update your regression model by implementing your
recommendation.

### Problem 2, Part D

Graphically present your regression models from part (a) and part (c). Specifically, plot the data with
a scatter plot, and include two regression lines (with the corresponding confidence bands), one
for each of the models above.
Note that this can be easily achieved in R using
<a href="http://ggplot2.org/">`ggplot2`</a> with
<a href="http://docs.ggplot2.org/0.9.3.1/geom_smooth.html">`geom_smooth`</a>.
For example, the model from part (a) can be plotted with the following:

```
ggplot(data, aes(x=mileage, y=price)) +  
    geom_point() + 
    geom_smooth(method="lm", formula = y ~ x)
```

## Problem 3

<p>
    Continuing from the previous problem, we will further investigate the
    regression model for predicting used car prices.
</p>

### Problem 3, Part A

<p>
Refine your regression model from Problem 2-c to include the model year as a predictor (still
using only the Honda Accord data).
Compare the \(R^2\) and RMSE of the revised regression model to your original one (i.e., the one in 2-c).
</p>

### Problem 3, Part B

<p>
Now, fit your model from above (Problem 3-a) on
the entire dataset, instead of just on the extracted Accord data.
Compare the \(R^2\) and RMSE between the two models. What is the major issue in
the new model?
</p>

### Problem 3, Part C

<p>
Update the model from Problem 3-b to address the major issue discovered.
Compute the \(R^2\) and RMSE of the updated model.
Briefly discuss your findings.
</p>

## Submission

Prepare a short report detailing your results. The report should include
your analytical answers and a brief summary of your numerical results, along
with the plots generated.

Be sure to read [these report tips](report_tips.md) before preparing your submission. 
Reports that are difficult to parse may lose credit. 

Please submit the following:
1. your report as a single PDF file
2. a single, fully functional `R` script or markdown file that we can run to reproduce all the numerical results and plots in your report.

We will put the necessary data file (`used_cars_clean.tsv`) into the same directory as your script before running it.

Please submit your work on Canvas.

