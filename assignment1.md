---
layout: page
title: Assignment 1
description: Details for Assignment 1. 
---

# Assignment 1: Exploring and visualizing data with `dplyr` and `ggplot2`

**Due Date: XX, XX, 2022, XXpm PT**

Unless otherwise stated, assignments are to be done individually.
You are welcome to work with others to master the principles and approaches used to
solve the homework problems, but the work you turn in should be your own.
Under no circumstance should you seek out or look at solutions to assignments given in previous years.

Please install [R](http://cran.rstudio.com/) and [RStudio](http://www.rstudio.com/) before working on this assignment.
If you're having trouble with the installation, be sure to post on Ed or come to office hours.

If you need help with any problem, be sure to follow the [Ed posting norms](../ed_tips).

## Overview

In this assignment you'll explore the baby name popularity data provided by the [Social Security Administration (SSA)](http://www.ssa.gov/oact/babynames/limits.html).
You'll make extensive use of the R libraries [ggplot2](https://ggplot2.tidyverse.org/) and [dplyr](http://dplyr.tidyverse.org/).
In particular, we will be examining relationships between names and sex assigned at birth, which we note is distinct
from one's gender identity.

## Problem 1

Download the [female](assets/hw1/female_names.tsv.gz) and [male](assets/hw1/male_names.tsv.gz) baby name popularity data, which
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
(e.g., descriptive summary statistics and scatterplots).
Briefly comment on your methods and findings.

## Problem 3

Examine the distribution of letter frequencies in the names of males and females with four histograms that show:

- Among females, the distribution of the first letter of their names
- Among males, the distribution of the first letter of their names
- Among females, the distribution of the last letter of their names
- Among males, the distribution of the last letter of their names

To make it easier to compare the results, normalize the
y-axis of the histograms to be a proportion (not a raw count).
For example, from your plots you should be able to easily see what proportion of
women have first names that start with "a".

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
Please submit the following:
(1) your report as a single PDF file; and (2) a single, fully functional R
script or R markdown file that we can run to reproduce all the numerical results and plots in your report.
We will put the original data files (`female_names.tsv.gz` and `male_names.tsv.gz`) into 
the same directory as your script before running it, 
so your script should load the data from the local directory using relative path names.

Please submit your work on Canvas.

