---
layout: page
title: Assignment 3
description: Details for Assignment 3. 
nav_exclude: true
---
<head>
	<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
</head>

# Assignment 3

Unless otherwise stated, assignments are to be done individually.
You are welcome to work with others to master the principles and approaches used to
solve the homework problems, but the work you turn in should be your own.
Under no circumstance should you seek out or look at solutions to assignments given in previous years.

If you need help with any problem, be sure to follow the [Ed posting norms](../ed_tips).

## Overview

In this assignment you'll experiment with different bootstrap confidence
interval methods, compute MLEs, and use the method of moments for estimating
parameters.

## Problem 1

<p>
    <a href="http://en.wikipedia.org/wiki/Skewness">Skewness</a> is a measure of
    the asymmetry of the probability distribution of a
    real-valued random variable about its mean.
    The skewness of a random variable \(X\) is defined as the expected value of
    the cube of the standardized values of \(X\), i.e.,
</p>
<p align="center">
    \(\gamma_1 = \mathbb{E}\left[
        \left( \frac{X - \mathbb{E}[X]}{\sigma} \right)^3
    \right] \)
</p>

<p>
    Given data \(X_1, \ldots, X_n \), the <i>plug-in</i> estimate of the
    skewness is
    </p>
<p align="center">
    \(\hat{\gamma}_1 = \frac{1}{n}\sum_{i=1}^{n}\left(
    \frac{X_i-\bar{X}}{\hat{\sigma}}\right)^3\)
</p>

### Problem 1, Part A

<p>
Download the <a href="../assets/hw3/X.txt">data</a> \( X_1, \ldots, X_{50} \),
        and construct two bootstrap 95 percent confidence intervals, normal and pivotal,
        for \( \gamma_1 \).
</p>

To do so, write two functions, `skewess_normal_ci()` and `skewness_pivotal_ci()`,
that take as input a vector of data values and return, respectively, the
normal and pivotal 95 percent confidence intervals.


### Problem 1, Part B

<p>
The data in part A were generated from a \(N(0,1)\) distribution, and
          because the normal distribution is symmetric, its true skewness is identically \(0\).
        We will now estimate the true coverage of normal and pivotal confidence intervals for the
          skewness of data genererated from a \(N(0,1)\) distribution.
          To do this,
        <ol>
            <li>Let \(n=50\) and use <span class="code">R</span>  to sample
                \(X_1, \ldots, X_n \sim N(0, 1) \).
            </li>
            <li>Use the procedures you wrote in part (a) to construct
                    normal and pivotal bootstrap 95 percent intervals for the sample you generated.
            </li>
            <li>
                Repeat steps 1 and 2 1,000 times, generating a new sample
                \(X_1, \dots, X_n\) each time. This should result in 1,000 intervals for each
                of the two methods.
            </li>
            <li>
                Compute the proportion of each of the 1,000 intervals that contain the
                true skewness value (which is \(0\) in this case).
            </li>
        </ol>
</p>

### Problem 1, Part C

<p>
  Given observations \(Z_1, \ldots, Z_n\) from a Uniform(0, \(\theta\))
  distribution, in Assignment 2 we investigated the estimator
  \(\hat{\theta} = \text{max}\{Z_1, \dots, Z_n\}\).
  Now we'll examine the coverage of various confidence intervals
  based on \(\hat{\theta}\) with \(n = 50\) and \(\theta = 10\).
</p>

<p>
    Compute the true coverage of the three types of 95% confidence intervals we
    have discussed so far: (1) theoretical normal; (2) normal bootstrap; and (3)
    pivotal bootstrap.
    To do so, first generate 1,000 synthetic datasets and then compute the three
    types of confidence intervals for each dataset.
    (Note: Recall that the theoretical normal confidence interval is computed as
    \(\hat{\theta} \pm 2\cdot\hat{\mathtt{se}}\), using the analytically derived
    expression for \(\mathtt{se}\) from Assignment 2, Problem 1.
</p>

### Problem 1, Part D

<p>
    The width of a single confidence interval \((a, b)\) is \(b - a\).
    Estimate the average width of each of the three types of confidence
    intervals computed in Part C.
</p>

### Problem 1, Part E

<p>
    Comment on your findings from parts C and D. Why do you see what you see?
    (Hint: think about the shape of the distribution of \(\hat{\theta}\).)
</p>


## Problem 2

<p>
    Bigbucks coffee company, a coffee chain serving affordable caffeine
    beverages to university students, has collected
    <a href="../assets/hw3/bigbucks.txt">500 records of service time</a> (in minutes)
    in an effort to improve customer satisfaction. Given that each record
    \(X_i\) is the time it takes to serve one customer, Bigbucks models
    \(X_1, X_2, \ldots, X_{500} \) as draws from an
    <a href="http://en.wikipedia.org/wiki/Exponential_distribution">exponential
        distribution</a>. That is, service times are assumed to come from a distribution
        with density function
</p>

<p align="center">
    \( f(x; \theta) = \theta e^{-\theta x}\)
</p>

<p>
    where \(\theta\) is the mean <i>service rate</i> (i.e., the average number of
    customers served per minute). Consequently, \(\mathbb{E}X_i = \mu\), where \(\mu=1/\theta\) is the mean
    <i>service time</i>. For example, if 2 customers are served every minute (\(\theta
    = 2\)), then the mean time spent serving one customer is 0.5 minutes
    (\(\mu=0.5\)).
</p>

### Problem 2, Part A

<p>
    Analytically compute the log-likelihood function for \(\theta\), and derive an
        expression for \( \hat{\theta} \),
        the <span class="code">MLE</span> of \(\theta\).
</p>

### Problem 2, Part B

<p>
    Using the <a href="../assets/hw3/bigbucks.txt">data</a> provided from
        Bigbucks, numerically compute the value of \(\hat{\theta}\).
</p>

### Problem 2, Part C

<p>
    Graphically confirm that the log-likelihood is indeed maximized at this
        value by plotting the log-likelihood of the data for a range of values
        near \(\hat{\theta}\).
</p>

### Problem 2, Part D

<p>
    Derive an expression for \(\hat{\mu}\), the MLE of the
        mean service time \(\mu\). Based on the <a href="../assets/hw3/bigbucks.txt">data</a>,
        numerically estimate this quantity.
        (Hint: If \(\hat{\theta}\) is the MLE of \(\theta\), then \(g(\hat{\theta})\) is the MLE of
        \(g(\theta)\). See Theorem 9.14 of <i>All of Statistics</i>.)
</p>

### Problem 2, Part E

<p>
    Determine whether or not \(\hat{\theta}\) and \(\hat{\mu}\) are biased.
    (Hint: By <a href="http://en.wikipedia.org/wiki/Jensen%27s_inequality">Jensen's inequality</a>,
    for a random variable \(X\), \(\mathbb{E}[1/X] \neq  1/\mathbb{E}[X]\), unless \(X\) is constant.)
</p>

## Problem 3

<p>
    Let \(X_1, X_2, \ldots, X_n \) be a random sample from a uniform distribution
    on the interval \([a, b]\). Obtain method of moment estimators for \(a\)
    and \(b\).
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

We will put the necessary data files (`X.txt` and `bigbucks.txt`) into the same directory as your script before running it.

Please submit your work on Canvas.

