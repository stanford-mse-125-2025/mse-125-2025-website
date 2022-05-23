---
layout: page
title: Assignment 7
description: Details for Assignment 7.
nav_exclude: true
---
<head>
	<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
</head>

# Assignment 7

Unless otherwise stated, assignments are to be done individually.
You are welcome to work with others to master the principles and approaches used to
solve the homework problems, but the work you turn in should be your own.
Under no circumstance should you seek out or look at solutions to assignments given in previous years.

If you need help with any problem, be sure to follow the [Ed posting norms](../ed_tips).

## Problem 1

Describe a plausible strategy for estimating a causal effect of your choice
from observational data (i.e., without using a randomized experiment). You do not need to carry out any data analysis, but the strategy you describe should be realistic.
That is, it should be possible in theory to carry out your proposal.

* What are the assumptions your approach relies on?

* What are the advantages and limitations of your proposal?

### Problem 2

(Adapted from
<a href="http://www.cambridge.org/us/academic/subjects/politics-international-relations/research-methods-politics/natural-experiments-social-sciences-design-based-approach">
Natural Experiments in the Social Sciences</a>, Chapter 5, Problem 5.2)

In the 1960s, the Health Insurance Plan of Greater New York clinical trial
studied the effects of screening for breast cancer. 

* Researchers invited
about 31,000 women between the ages of 40 and 64 for annual clinical visits
and mammographies, which are X-rays designed to detect breast cancer. 

* About 20,200 women or two-thirds of these women accepted the invitation to be
screened, while one-third refused. 

* In the control group, 31,000 women
received the status quo health care. (None of them received mammographies of
their own initiative; screening for breast cancer was rare in the 1960s.)

* Among the 62,000 women in the study group, the invitation for screening was
issued at random. 

The table below shows numbers of deaths and death rates
from breast cancer five years after the start of the trial. It also shows
deaths from other causes, among women in the treatment group who accepted
the invitation for screening and those who refused.

<div class="datatable-begin"></div>

| | Group size | Deaths from breast cancer | Death rate from breast cancer, per 1,000 women | Deaths from other causes | Death rate from other causes, per 1,000 women |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| **Assigned to treatment** |  |  |  |  |  |
| Accepted screening | 20,200 | 23 | 1.14 | 428 | 21.19 |
| Refused screening | 10,800 | 16 | 1.48 | 409 | 37.87 |
| Total | 31,000 | 39 | 1.26 | 837 | 27.00 |
| **Assigned to control** |  |  |  |  |  |
| Would have accepted screening | N/A | N/A | N/A | N/A | N/A |
| Would have refused screening | N/A | N/A | N/A | N/A | N/A |
| Total | 31,000 | 63 | 2.03 | 879 | 28.25 |

<div class="datatable-end"></div>

### Problem 2, Part A

It might seem natural to compare women who were screened with women who
were not screened. 

* Why, in general, is this a bad idea? 

* Is there any
specific evidence in the table that suggests this is in fact a bad idea?

### Problem 2, Part B

* What is intention-to-treat analysis in this context? 

* Calculate the
intention-to-treat estimate. 

* What is a potential limitation of
intention-to-treat analysis?

### Problem 2, Part C

In the first column of the table, the number of women who would have
accepted screening and the number who would have refused, among women
who were assigned to the control group, is unobserved. 

* Why are these quantities unobserved? 

* Find an unbiased
estimate for each of these two quantities and fill in the corresponding
cells of the table with these estimates. 

* What is the rationale for your
estimates (i.e., why are they unbiased)?

### Problem 2, Part D

What is the proportion of always-treats, never-treats, and compliers in
the study group?

### Problem 2, Part E

What is the death rate from breast cancer among compliers in the assigned-to-treatment
group? (The death rate per 1,000 women is simply the number of deaths
divided by the group size, times 1,000.)

### Problem 2, Part F

Now, estimate the death rate from breast cancer among compliers and,
separately,
among never-treats in the control group. How to do this:

* First, estimate the number of never-treats in the control group
who died from breast cancer. Why is this quantity unobserved?
What is the rationale for your estimate?

* Now, use this information to estimate the number of deaths from
breast cancer among compliers in the control group. 

* Finally,
estimate the death rate per 1,000 women among compliers in the
control group,
and also estimate the death rate per 1,000 women among
never-treats in the control group.

### Problem 2, Part G

Estimate the effect of treatment on compliers in terms of death rates,
using the information computed above.

### Problem 2, Part H

Using several of the quantities you derived above, find the average
treatment effect for
compliers by directly applying the instrumental-variables estimator:

$$\frac{[\text{mean outcome in treatment group}] - [\text{mean outcome
in control group}]}{[\text{fraction treated in treatment group}] - [\text{fraction treated
in control group}]}.$$

This should be identical to your answer in (g). 

## Submission

Prepare a short report detailing your results.

Please submit the following:
1. your report as a single PDF file that shows all work needed to derive your numerical answers. 

There is no need to submit a .Rmd or .R file. 

Be sure to read [these report tips](report_tips.md) before preparing your submission. 
Reports that are difficult to parse may lose credit. 

Please submit your work on Canvas.

