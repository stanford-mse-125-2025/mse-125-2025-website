---
layout: page
title: Report tips
description: How to write a good report.
nav_exclude: true
---

# Tips for formatting reports and code

Keep in mind that there is no single correct format for writing a good report.
Some students choose to use an R script and paste their results into Microsoft Word or Google Docs, while others choose to use an R Markdown file that can contain your code and written answers all in one place.
Please reach out to the teaching team if you have any concerns about report formatting.

## Report tips

*  **A longer answer does not always mean a better answer.** Keep your responses meaningful and concise. Do not include extraneous results or findings in your report. Make it easy for the teaching team to follow your line of thinking.

*	**Make sure plots convey insightful findings.** A simple plot with a clear insight is a lot more valuable than a complex plot that does not convey a clear insight.

*   **Make it easy for us to read your report.** Bullet points and concise comments are encouraged. Rather than hide results in long, single-spaced paragraphs, present them in a table with clear labels. Make sure your handwritten results are legible and easy to follow. If you paste images into your PDF, make them BIG. We should not need to zoom in too far to see your work.

* **Avoid using screenshots where possible**, as they typically have low resolution. Instead, when possible, use `ggsave()` to save images of your plots. When using `ggsave()`, you should use the minimum image resolution needed to easily understand your plot. 

*	**All results should be printed and clearly marked in your report PDF.** **We should not have to refer to your code to find your results.** If you decide to store a result in a variable, print the value of the variable in your code AND in the report PDF. Consider underlining, boxing, bolding, and/or highlighting your key results. 

*   **Three decimals places of accuracy is typically all that's needed.** Convert answers from scientific notation (3.5e-2) to standard notation (0.035). You can write the following at the top of your R code to do this automatically:

```
options(scipen = 999)
options(digits = 3)
```

*  **Keep file sizes small.** Your submitted report should generally be less than 5MB, though there may be rare exceptions. 

*  **Before submitting, make sure to review your report PDF**. The report should be structured, clear, and concise, and all problems should be addressed. Make sure that all relevant results are included in the report (and not buried in your code!). 

*   **Submit a single report PDF.** Your submissions should only contain two files: your report PDF and your code. There are many free tools available for combining PDFs into a single PDF.

## Code tips

* In your code, do your best to **follow the [tidyverse style conventions](https://style.tidyverse.org/)**. Note that we will not dock points for code that runs correctly but isn't formatted nicely. However, you will find that your code is a lot easier to debug when it's formatted nicely.

*  **Do not include `install.packages(),` `View()`, or `ggsave()` in your submitted script.** You are welcome to leave these functions in your code so long as you `#comment them out`. Note that if you run `install.packages("tidyverse")` once on your machine, you (generally) never need to run it again.

*  **Clear your environment and re-run your code before submitting**. Many simple bugs can be avoided by simply re-running code and catching typos. 

*  **Make your code easy to read.** Organize your code into logical chunks, add space between chunks, and add comments to explain what each chunk is doing.  Don't let code go past the vertical line in the RStudio scripting pane (though a few extra spaces here and there is fine). This vertical line typically denotes somewhere between 70 and 80 characters from the left side of the page.  

*   **Use the original file names for imported data, and import the data locally.** For example, HW2 code should import **`X.txt`**, not `hw2-data.txt` or `MS&E-125-data.txt`. Importing locally with the original name makes it a lot easier to re-run your code. 

