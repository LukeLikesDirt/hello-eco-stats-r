# _render.R
# Knit all weekly R Markdown worksheets to HTML in docs/ for GitHub Pages.
#
# Usage:
#   Rscript _render.R
#
# Prerequisites:
#   install.packages("rmarkdown")

# Use RStudio's bundled pandoc if pandoc is not on PATH
if (!rmarkdown::pandoc_available()) {
  rstudio_pandoc <- "/Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools"
  if (dir.exists(rstudio_pandoc)) {
    Sys.setenv(RSTUDIO_PANDOC = rstudio_pandoc)
  }
}

library(rmarkdown)

# Locate all weekly Rmd files
rmd_files <- sort(Sys.glob("weeks/week_*//*.Rmd"))

if (length(rmd_files) == 0) {
  stop("No .Rmd files found in weeks/week_*/ folders.")
}

# Ensure docs/ directory exists
dir.create("docs", showWarnings = FALSE)

# Render each Rmd to self-contained HTML in docs/
for (rmd in rmd_files) {
  message("Rendering: ", rmd)
  rmarkdown::render(
    input       = rmd,
    output_dir  = "docs",
    output_format = rmarkdown::html_document(
      theme           = "flatly",
      highlight       = "tango",
      toc             = TRUE,
      toc_float       = TRUE,
      number_sections = TRUE,
      self_contained  = TRUE
    ),
    quiet = FALSE
  )
}

message("\nDone. Rendered HTML files are in docs/.")
