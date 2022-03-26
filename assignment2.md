---
layout: page
title: Assignment 2
description: Details for Assignment 2. 
nav_exclude: true
---
<head>
	<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
</head>

# Assignment 2

Unless otherwise stated, assignments are to be done individually.
You are welcome to work with others to master the principles and approaches used to
solve the homework problems, but the work you turn in should be your own.
Under no circumstance should you seek out or look at solutions to assignments given in previous years.

If you need help with any problem, be sure to follow the [Ed posting norms](ed_tips.md).

## Overview

In this assignment you'll solve questions related to sampling distributions, point estimation,
and confidence intervals, both analytically and numerically with simulations in `R`.

<!--
<p>
    <strong>Problem 1.</strong>
    Let \(X_1, \dots, X_n \sim \) Poisson \( (\lambda) \) and let
    \(~\hat{\lambda} = n^{-1}\sum_{i=1}^n X_i\).
</p>

<ol type="a">
    <li>
    Given the <span class="code">pmf</span>, \( P(X=x~|~\lambda ) =  \frac{e^{
    -\lambda}\lambda^x}{x!}\), find the
        <span class="code">bias</span>, <span class="code">se</span>, and
        <span class="code">MSE</span> of this estimator.
    </li>

    <li>
        Simulate 10,000 samples of 500 observations (\(n=500\)) in
        <span class="code">R</span>, with \( \lambda = 80 \). <br />
        <i>Hint</i>: Use <span class="code">rpois(n=500, lambda=80)</span> in
        <span class="code">R</span>  to generate a single sample of 500
        observations from a Poisson distribution with \( \lambda = 80 \).
    </li>

    <li>
        Compute the estimate \(\hat{\lambda}\) for each of the 10,000 samples.
        Plot a histogram of the 10,000 estimates.
    </li>
</ol>
-->

## Problem 1

<p> Let \(X_1, \dots, X_n \sim \) Uniform\( (0, \theta) \). </p>

### Problem 1, Part A

<p>Let \(~\tilde{\theta} = 2\bar{X}_n\) where \(\bar{X}_n \) is the sample mean; i.e., \(\bar{X}_n = \frac{1}{n}\sum_{i=1}^nX_i\).</p>

Find the `bias`, `se`, and `MSE` of this estimator.

### Problem 1, Part B

<p>Let \(~\hat{\theta} = \text{max}\{X_1, \dots, X_n\} \).</p>

Find the `bias`, `se`, and `MSE` of this estimator.

<p>Hint: First compute the CDF of \(~\hat{\theta}\), and then differentiate to
find its density.</p>

### Problem 1, Part C

<p>Simulate 10,000 samples of 500 observations (\(n=500\)) from a
Uniform\((0, 1)\) distribution (\( \theta = 1 \)).</p>

* Note that you can use `runif(n=500, min=0, max=1)` in `R` to generate a single sample of 500
observations from a standard uniform distribution.

<p>Compute the estimates \(\hat{\theta}\) and \(\tilde{\theta}\) for each
sample.</p> 

* One way to do this is by storing the data in a 10,000 x 500 dimensional matrix and then using the [`apply`](https://www.rdocumentation.org/packages/base/versions/3.5.2/topics/apply) function. 

<p>Now, plot the distributions of \(\hat{\theta}\) and \(\tilde{\theta}\).</p> 

Finally, compare the numerical approximations of `bias`, `se`, and
`MSE` (based on the 10,000 samples) for each of the two estimators to their analytic values that you derived above.

## Problem 2

Now we'll construct some confidence intervals, and simulate samples to investigate the true coverage of the intervals.	

### Problem 2, Part A

Download the [data](../assets/hw2/X.txt).

* <p>The data consists of \(X_1, X_2, \dots, X_{100}\), which are 100 draws from a Uniform\( (0, \theta)\) distribution, with unknown \(\theta\).</p>

* Use the `R` function [`scan`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/scan.html) to read the data file as a single vector.

<p>Find the point estimate for the unknown parameter,
\(\tilde{\theta} = 2\bar{X}_n \). 

Compute both the 95% and 80% confidence
intervals for the estimate \(\tilde{\theta}\).</p>

### Problem 2, Part B

<p>Simulate 10,000 samples of 50 observations (\(n=50\)) from a
Uniform\((0, 10)\) distribution (\(\theta = 10\)).
Compute both the 95% and 80% confidence intervals for the estimate
\(\tilde{\theta}\) in each sample. </p>

* As a result, you should have 10,000 95% confidence intervals and 10,000 80% confidence intervals.

<p>Investigate the true coverage
of your confidence intervals by computing, separately for the 95% and 80% intervals,
the proportion of the 10,000 intervals that actually contain the true value \(\theta = 10\).</p>

## Problem 3

(Adapted from <i>All of Statistics</i>, Section 7.4, Problem 9.)

100 people are given a new antibiotic to treat an infection, and another
100 are given the standard treatment. In the first group, 90 people recover; in the
second group, 83 people recover. 

<p>Let \(p_1\) be the probability of recovery
under the new treatment and let \(p_2\) be the probability of recovery
under the standard treatment. We are interested in estimating \(\theta = p_1 - p_2\).</p>

<p>Provide an estimate, standard error, and a 95% confidence
interval. What can you conclude about the efficacy of the new treatment relative to
the standard one?
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

We will put the data file (`X.txt`) into the same directory as your script before running it, so your script should load the data from the local directory using relative path names.


Please submit your work on Canvas.

