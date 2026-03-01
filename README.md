# An introduction to ecological statistics in R

This repository holds the practical workshop materials from the Quantitative
Research Methods (ENV3QRM) course at La Trobe University.

Each week has an **R Markdown worksheet** with background context and numbered
questions, plus a companion **swirl** lesson that students work through
interactively. Students open the worksheet in their browser, copy each question
into the R source pane, and answer it using the swirl infrastructure.

**[View all worksheets online](https://lukelikesdirt.github.io/hello-stats-in-r/)**

## Getting started

1. Clone or download this repository.
2. Open R or RStudio with the repository as your working directory (use the
   `.Rproj` file).
3. Source the launcher script to install packages, load the local swirl course,
   and start swirl:

   ```r
   source("01_introduction_to_r_programming.R")
   ```

4. In swirl, choose **Intro_Ecological_Statistics_in_R** and select the lesson
   for the current week.
5. Open the corresponding worksheet (links below) in your browser and follow
   along.

The launcher script installs `swirl` and `tidyverse` if needed, refreshes the
local course, and starts swirl.

## Repository structure

```
hello-eco-stats-r/
├── README.md
├── 01_introduction_to_r_programming.R    # Launcher script (all weeks)
├── _render.R                             # Knit all Rmds → docs/
├── _smoke_test.R                         # Validate lessons
├── weeks/
│   ├── week_01/
│   │   └── week_01_introduction_to_r_programming.Rmd
│   └── week_02/
│       └── week_02_data_wrangling_and_exploratory_ecological_analysis.Rmd
├── docs/                                 # Rendered HTML (GitHub Pages)
│   ├── index.html
│   ├── week_01_introduction_to_r_programming.html
│   └── week_02_data_wrangling_and_exploratory_ecological_analysis.html
├── swirl_courses/                        # Interactive swirl lessons
│   └── Intro_Ecological_Statistics_in_R/
│       ├── 01_introduction_to_r_programming/
│       └── 02_data_wrangling_and_exploratory_ecological_analysis/
```

---

## Week 1: Introduction to R Programming

**[Open worksheet](https://lukelikesdirt.github.io/hello-stats-in-r/week_01_introduction_to_r_programming.html)**
· [Source Rmd](weeks/week_01/week_01_introduction_to_r_programming.Rmd)

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

### Run it

1. Source `01_introduction_to_r_programming.R`.
2. In swirl, choose **01_introduction_to_r_programming**.
3. Follow along with the
   [worksheet](https://lukelikesdirt.github.io/hello-stats-in-r/week_01_introduction_to_r_programming.html).

---

## Week 2: Data Wrangling & Exploratory Ecological Analysis

**[Open worksheet](https://lukelikesdirt.github.io/hello-stats-in-r/week_02_data_wrangling_and_exploratory_ecological_analysis.html)**
· [Source Rmd](weeks/week_02/week_02_data_wrangling_and_exploratory_ecological_analysis.Rmd)

Building on Week 1, this lesson uses a larger ecological monitoring dataset to
practise real-world data wrangling and exploratory analysis.

### Topics

- Selecting columns and filtering rows
- Effort standardisation (abundance per survey hour)
- Grouped summaries across habitats and time periods
- Scatter plots, boxplots and line graphs with `ggplot2`
- Preparing and exporting modelling-ready datasets

### Run it

1. Source `01_introduction_to_r_programming.R`.
2. In swirl, choose **02_data_wrangling_and_exploratory_ecological_analysis**.
3. Follow along with the
   [worksheet](https://lukelikesdirt.github.io/hello-stats-in-r/week_02_data_wrangling_and_exploratory_ecological_analysis.html).

---

## Re-rendering worksheets

If you edit any `.Rmd` file, regenerate the HTML with:

```r
source("_render.R")
```

## Enabling GitHub Pages

To serve the worksheets online:

1. Go to **Settings → Pages** in the GitHub repository.
2. Set **Source** to **Deploy from a branch**.
3. Set **Branch** to `main` and **Folder** to `/docs`.
4. Save — the site will be live at
   `https://lukelikesdirt.github.io/hello-stats-in-r/`.
