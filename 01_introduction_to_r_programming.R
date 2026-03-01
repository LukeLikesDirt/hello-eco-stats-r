# 01_introduction_to_r_programming.R
# Launcher script — installs dependencies and starts swirl.
#
# Usage:
#   1. Open R or RStudio with this repository as your working directory.
#   2. Source this file:  source("01_introduction_to_r_programming.R")
#   3. In swirl, choose the lesson you want to complete.

# Set working directory --------------------------------------------------------
# If you opened the .Rproj file the working directory is already correct.
# Otherwise, set it manually:
# setwd("<path/to/hello-eco-stats-r>")
getwd()

# Install required packages (if missing) --------------------------------------

required_packages <- c("swirl", "tidyverse")

packages_to_install <- required_packages[
  !vapply(required_packages, requireNamespace,
          FUN.VALUE = logical(1), quietly = TRUE)
]

if (length(packages_to_install) > 0) {
  install.packages(packages_to_install)
}

# Install / refresh the local swirl course -------------------------------------

library(swirl)

course_name <- "Intro_Ecological_Statistics_in_R"
course_dir  <- file.path(getwd(), "swirl_courses")

# Remove previous version (if any) then re-install from local files
suppressWarnings(uninstall_course(course_name))
install_course_directory(course_dir, course_name = course_name)

# Start swirl ------------------------------------------------------------------
swirl()
