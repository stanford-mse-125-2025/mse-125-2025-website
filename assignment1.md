---
layout: page
title: Assignment 1
description: Details for Assignment 1. 
nav_exclude: true
---

# Assignment 1: Exploring and visualizing data with `dplyr` and `ggplot2`

Unless otherwise stated, assignments are to be done individually.
You are welcome to work with others to master the principles and approaches used to
solve the homework problems, but the work you turn in should be your own.
Under no circumstance should you seek out or look at solutions to assignments given in previous years.

Please install [R](http://cran.rstudio.com/) and [RStudio](http://www.rstudio.com/) before working on this assignment.
[Section 1.4](https://r4ds.had.co.nz/introduction.html#prerequisites) of R for Data Science has some tips for installation.
If you're having trouble with the installation, be sure to post on Ed or come to office hours.

If you need help with any problem on this assignment and would like to post on Ed, be sure to follow the [Ed posting norms](ed_tips.md).

## Warm up (Optional)

<!-- Read Chapters 1 through 5 of [R for Data Science](https://r4ds.had.co.nz/). You are strongly encouraged to work through the examples in an [R Notebook](https://bookdown.org/yihui/rmarkdown/notebook.html) as you read. 

Complete problem 6 of the [3.6.1 Exercises](https://r4ds.had.co.nz/data-visualisation.html#exercises-3) and problem 5 of the [5.6.7 Exercises](https://r4ds.had.co.nz/transform.html#exercises-12).

We'll be the first to admit that solutions to these problems are freely available online. However, we also want to stress that understanding these five chapters will make future assignments substantially easier. -->

Complete all of the [exercises](https://colab.research.google.com/github/stanford-policylab/mse125/blob/main/week_1/intro-to-dplyr-ggplot2-exercises.ipynb) in the notebook for the first discussion section.
Fully understanding these exercises will make this assignment, and future assignments, substantially easier.

If you have any questions about the exercises, we encourage you to make a public Ed post so that others can benefit from the answer.
Please make sure to follow the [Ed posting and debugging guidelines](ed_tips.md), and feel free to post anonymously if you'd prefer.

You can find the answers to the exercises [here](https://colab.research.google.com/github/stanford-policylab/mse125/blob/main/week_1/intro-to-dplyr-ggplot2-answers.ipynb).

<!-- Completing the warm up will contribute positively to your participation grade.  -->


## Overview

For the rest of this assignment, you'll explore the baby name popularity data provided by the [Social Security Administration (SSA)](http://www.ssa.gov/oact/babynames/limits.html).
You'll make extensive use of the R libraries [ggplot2](https://ggplot2.tidyverse.org/) and [dplyr](http://dplyr.tidyverse.org/).
In particular, we will be examining relationships between names and sex assigned at birth, which we note is distinct
from one's gender identity.

## Problem 1

Download the [female](assets/hw1/female_names.tsv) and [male](assets/hw1/male_names.tsv) baby name popularity data, which
gives the number of times each name was registered in the United States,
annually, from 1880 to 2013.
Join the two datasets into a single dataset with the following header:

`name | year | female | male`

For each row, the "female" and "male" columns should indicate the number of children born that year with that name. 
Note that not all names have positive female and male counts, and so
be careful not to inadvertently drop any names when doing the join.	

Choose two names and plot the popularity of each over time. 
Specifically, for each name, plot the number of male and female babies given that name
as two separate lines in a single plot, where the x-axis is the years 1880 to 2013,
and the y-axis is the popularity.
Some notable names are Luke,
Lea, Bruce, Clark, Hillary, and Elsa,
but feel free to explore others.
Briefly comment on any interesting findings or insights.	

## Problem 2

Aggregate the counts for each name, separately by sex, 
over all the years in the data. 
Further augment the data with the proportion of females and males that were
given each name. That is, for each name, compute the proportion of babies receiving that name 
that were female, and the proportion that were male.	
The final result should be a data frame with one row per name, and the following columns:

`name | female | male | proportion_female | proportion_male`

Explore the augmented data using the methods introduced in class 
(e.g., descriptive summary statistics and plots).
Briefly comment on your methods and findings.

## Problem 3

Examine the distribution of letter frequencies in the names of males and females with four separate histogram plots that show, respectively:

- Among females, the distribution of the first letter of their names
- Among males, the distribution of the first letter of their names
- Among females, the distribution of the last letter of their names
- Among males, the distribution of the last letter of their names

To make it easier to compare the results, normalize the
y-axis of the four histograms to be a proportion (not a raw count).
For example, from your plots you should be able to easily see what proportion of
women have first names that start with "a".

Briefly comment on your methods and findings.

Note that you can extract the first and last letters from a string in `R` using the [stringr](http://cran.r-project.org/web/packages/stringr/) package. For example,

```
library(stringr)
str_sub("Hello, world",end=1)
[1] "H" 
str_sub("Hello, world",start=-1)
[1] "d"`
```

## Submission

Prepare a short report detailing your results. The report should include
the plots you generated and a brief discussion of your findings.

Be sure to read [these report tips](report_tips.md) before preparing your submission. 
Reports that are difficult to parse may lose credit. 

Please submit the following:
1. your report as a single PDF file
2. a single, fully functional R script or R markdown file that we can run to reproduce all the numerical results and plots in your report.

We will put the original data files (`female_names.tsv` and `male_names.tsv`) into 
the same directory as your script before running it, 
so your script should load the data from the local directory using relative path names.
<!-- Your code should import and unzip the gzipped TSV files.
If you're using Safari, be sure to right click on the data links to save the data as a zipped TSV file (Safari unzips linked files by default). -->

Please submit your work on Canvas.

