# _smoke_test.R
# Smoke test for swirl lessons — validates YAML, initLesson, and simulates answers.

cat("============================================================\n")
cat("SMOKE TEST: Intro Ecological Statistics in R\n")
cat("============================================================\n\n")

errors_found <- 0

# ---------------------------------------------------------------------------
# 1. YAML parsing & field validation
# ---------------------------------------------------------------------------
cat("--- 1. YAML parsing & field validation ---\n\n")

library(yaml)

check_lesson_yaml <- function(path, name) {
  cat("  ", name, ":", path, "\n")
  entries <- tryCatch(yaml::read_yaml(path), error = function(e) {
    cat("    FAIL: YAML parse error:", conditionMessage(e), "\n")
    return(NULL)
  })
  if (is.null(entries)) return(1)

  classes <- sapply(entries, function(e) e$Class)
  cat("    Parsed OK:", length(entries), "entries\n")
  cat("    Classes:", paste(table(classes), names(table(classes)), sep="x ", collapse = ", "), "\n")

  errs <- c()
  for (i in seq_along(entries)) {
    e <- entries[[i]]
    cl <- e$Class
    if (cl == "meta") next
    if (cl == "text" && is.null(e$Output))
      errs <- c(errs, paste0("  Entry ", i, ": text missing Output"))
    if (cl == "cmd_question") {
      for (f in c("Output", "CorrectAnswer", "AnswerTests", "Hint")) {
        if (is.null(e[[f]])) errs <- c(errs, paste0("  Entry ", i, ": cmd_question missing ", f))
      }
    }
    if (cl == "mult_question") {
      for (f in c("Output", "AnswerChoices", "CorrectAnswer", "AnswerTests", "Hint")) {
        if (is.null(e[[f]])) errs <- c(errs, paste0("  Entry ", i, ": mult_question missing ", f))
      }
    }
  }

  if (length(errs) == 0) {
    cat("    All entries valid.\n\n")
    return(0)
  } else {
    cat("    ERRORS:\n")
    cat(paste0("      ", errs, "\n"), sep = "")
    cat("\n")
    return(length(errs))
  }
}

errors_found <- errors_found + check_lesson_yaml(
  "swirl_courses/Intro_Ecological_Statistics_in_R/01_introduction_to_r_programming/lesson.yaml",
  "Lesson 01"
)
errors_found <- errors_found + check_lesson_yaml(
  "swirl_courses/Intro_Ecological_Statistics_in_R/02_data_wrangling_and_exploratory_ecological_analysis/lesson.yaml",
  "Lesson 02"
)

# ---------------------------------------------------------------------------
# 2. initLesson.R execution
# ---------------------------------------------------------------------------
cat("--- 2. initLesson.R scripts ---\n\n")

test_init <- function(path, name) {
  cat("  ", name, ":", path, "\n")
  result <- tryCatch({
    env <- new.env(parent = globalenv())
    source(path, local = env)
    cat("    Sourced OK. Objects:", paste(ls(env), collapse = ", "), "\n\n")
    0
  }, error = function(e) {
    cat("    FAIL:", conditionMessage(e), "\n\n")
    1
  })
  result
}

errors_found <- errors_found + test_init(
  "swirl_courses/Intro_Ecological_Statistics_in_R/01_introduction_to_r_programming/initLesson.R",
  "Lesson 01 init"
)
errors_found <- errors_found + test_init(
  "swirl_courses/Intro_Ecological_Statistics_in_R/02_data_wrangling_and_exploratory_ecological_analysis/initLesson.R",
  "Lesson 02 init"
)

# ---------------------------------------------------------------------------
# 3. Check eco_survey.csv was created by Lesson 01 init
# ---------------------------------------------------------------------------
cat("--- 3. eco_survey.csv creation check ---\n\n")

if (file.exists("eco_survey.csv")) {
  df <- read.csv("eco_survey.csv")
  cat("   eco_survey.csv: ", nrow(df), "rows x", ncol(df), "cols\n")
  cat("   Columns:", paste(names(df), collapse = ", "), "\n\n")
  file.remove("eco_survey.csv")  # cleanup
} else {
  cat("   FAIL: eco_survey.csv was not created by initLesson.R\n\n")
  errors_found <- errors_found + 1
}

# ---------------------------------------------------------------------------
# 4. Swirl course install
# ---------------------------------------------------------------------------
cat("--- 4. Swirl course install ---\n\n")

library(swirl)
course_name <- "Intro_Ecological_Statistics_in_R"
course_dir  <- file.path(getwd(), "swirl_courses", course_name)
suppressWarnings(try(uninstall_course(course_name), silent = TRUE))
tryCatch({
  install_course_directory(course_dir)
  cat("   Course installed OK.\n\n")
}, error = function(e) {
  cat("   FAIL:", conditionMessage(e), "\n\n")
  errors_found <<- errors_found + 1
})

# ---------------------------------------------------------------------------
# 5. Dry-run Lesson 1 correct answers
# ---------------------------------------------------------------------------
cat("--- 5. Dry-run Lesson 1 correct answers ---\n\n")

lesson1 <- yaml::read_yaml("swirl_courses/Intro_Ecological_Statistics_in_R/01_introduction_to_r_programming/lesson.yaml")
env1 <- new.env(parent = globalenv())
source("swirl_courses/Intro_Ecological_Statistics_in_R/01_introduction_to_r_programming/initLesson.R", local = env1)
library(tidyverse, warn.conflicts = FALSE)

cmd_entries_1 <- Filter(function(e) e$Class == "cmd_question", lesson1)
for (i in seq_along(cmd_entries_1)) {
  e <- cmd_entries_1[[i]]
  expr_str <- e$CorrectAnswer
  q_label <- sub("^(Q[0-9]+:).*", "\\1", e$Output)
  if (q_label == e$Output) q_label <- paste0("cmd_", i)
  
  result <- tryCatch({
    eval(parse(text = expr_str), envir = env1)
    "OK"
  }, error = function(err) {
    paste("FAIL:", conditionMessage(err))
  })
  status <- if (result == "OK") "PASS" else result
  cat("   ", q_label, expr_str, "->", status, "\n")
  if (status != "PASS") errors_found <- errors_found + 1
}
cat("\n")

# ---------------------------------------------------------------------------
# 6. Dry-run Lesson 2 correct answers
# ---------------------------------------------------------------------------
cat("--- 6. Dry-run Lesson 2 correct answers ---\n\n")

lesson2 <- yaml::read_yaml(
  "swirl_courses/Intro_Ecological_Statistics_in_R/02_data_wrangling_and_exploratory_ecological_analysis/lesson.yaml"
)
env2 <- new.env(parent = globalenv())
source(
  "swirl_courses/Intro_Ecological_Statistics_in_R/02_data_wrangling_and_exploratory_ecological_analysis/initLesson.R",
  local = env2
)

cmd_entries_2 <- Filter(function(e) e$Class == "cmd_question", lesson2)
for (i in seq_along(cmd_entries_2)) {
  e <- cmd_entries_2[[i]]
  expr_str <- e$CorrectAnswer
  q_label <- sub("^(Q[0-9]+:).*", "\\1", e$Output)
  if (q_label == e$Output) q_label <- paste0("cmd_", i)

  result <- tryCatch({
    eval(parse(text = expr_str), envir = env2)
    "OK"
  }, error = function(err) {
    paste("FAIL:", conditionMessage(err))
  })
  status <- if (result == "OK") "PASS" else result
  cat("   ", q_label, expr_str, "->", status, "\n")
  if (status != "PASS") errors_found <- errors_found + 1
}
cat("\n")

# Cleanup generated files
suppressWarnings(file.remove("species_summary.csv"))
suppressWarnings(file.remove("model_ready_ecology.csv"))
suppressWarnings(file.remove("eco_survey.csv"))

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
cat("============================================================\n")
if (errors_found == 0) {
  cat("ALL TESTS PASSED.\n")
} else {
  cat("ERRORS FOUND:", errors_found, "\n")
}
cat("============================================================\n")
quit(status = errors_found, save = "no")
