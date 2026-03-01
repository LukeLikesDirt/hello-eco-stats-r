# An introduction to ecological statistics in R

This repository holds the practical workshop materials from the Quantitative
Research Methods (ENV3QRM) course at La Trobe University.

Each week has an **R Markdown worksheet** (`.Rmd`) containing background context
and numbered questions, plus a companion **swirl** lesson that students work
through interactively. Students read the worksheet alongside swirl, copying
questions into the R source pane and answering them in the console.

## Getting started

1. Open R or RStudio with this repository as your working directory (use the
   `.Rproj` file).
2. Source the launcher script to install packages, load the local swirl course,
   and start swirl:

   ```r
   source("01_introduction_to_r_programming.R")
   ```

3. In swirl, choose **Intro_Ecological_Statistics_in_R** and then select the
   lesson for the current week.

The launcher script installs `swirl` and `tidyverse` if needed, refreshes the
local course, and starts swirl.

---

## Week 1: Introduction to R Programming

### Overview

A crash course for absolute beginners covering core R skills needed for
ecological data analysis.

### Topics

- R objects, assignment and vectors
- Reading ecological survey data from CSV
- Inspecting data frames (`head()`, `str()`)
- Basic calculations and base R subsetting
- Introduction to the tidyverse and the pipe operator (`%>%`)
- Filtering, selecting, mutating and summarising with `dplyr`
- Exploratory boxplots with `ggplot2`
- Exporting results to CSV
- Reproducibility with `sessionInfo()`

### Materials

| File | Description |
|------|-------------|
| `week_01_introduction_to_r_programming.Rmd` | Workshop worksheet (background + questions) |
| `swirl_courses/01_introduction_to_r_programming/` | Interactive swirl lesson |
| `01_introduction_to_r_programming.R` | Launcher script |

### Run it

1. Source `01_introduction_to_r_programming.R`.
2. In swirl, choose **01_introduction_to_r_programming**.
3. Follow along with the worksheet in `week_01_introduction_to_r_programming.Rmd`.

---

## Week 2: Data Wrangling & Exploratory Ecological Analysis

### Overview

Building on Week 1, this lesson uses a larger ecological monitoring dataset to
practise real-world data wrangling and exploratory analysis.

### Topics

- Selecting columns and filtering rows
- Effort standardisation (abundance per survey hour)
- Grouped summaries across habitats and time periods
- Scatter plots, boxplots and line graphs with `ggplot2`
- Preparing and exporting modelling-ready datasets

### Materials

| File | Description |
|------|-------------|
| `week_02_data_wrangling_and_exploratory_ecological_analysis.Rmd` | Workshop worksheet (background + questions) |
| `swirl_courses/02_data_wrangling_and_exploratory_ecological_analysis/` | Interactive swirl lesson |
| `01_introduction_to_r_programming.R` | Launcher script (same for all weeks) |

### Run it

1. Source `01_introduction_to_r_programming.R`.
2. In swirl, choose **02_data_wrangling_and_exploratory_ecological_analysis**.
3. Follow along with the worksheet in
   `week_02_data_wrangling_and_exploratory_ecological_analysis.Rmd`.
