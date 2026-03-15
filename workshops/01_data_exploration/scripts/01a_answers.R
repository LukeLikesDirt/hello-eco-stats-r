
# Answers - Introduction to R

# Task 1: Run `x <- 5` and then `y <- x + 3`.
#         What value does `y` hold?
x <- 5
y <- x + 3
y
# y holds the value 8


# Task 2: Check the data type of `x` and `y`. Are they numeric or character?
class(x)
class(y)
# `x` and `y` are numeric


# Task 3: Call the `filter()` function from the `dplyr` package without loading
#         the package first.
dplyr::filter(banksia_data, treatment == "control") # replace with your own arguments

# Task 4: Load the `tidyverse` package.
library(tidyverse)

# Task 5: Read in the `./data/banksia_data.csv` file using the `read_csv`
#         function and store the data in an object called `banksia_data`
banksia_data <- read_csv("./data/banksia_data.csv")

# Task 6: Pipe `banksia_data` into the `mutate()` function to recompute
#         height_change_cm as the difference between height_2016_cm and
#         height_2013_cm.
#         Hint: height_change_cm = height_2016_cm - height_2013_cm
banksia_data %>% 
  mutate(height_change_cm = height_2016_cm - height_2013_cm)

# Task 7: Use the `geom_bar()` function to make a bar chart of `height_2013_cm` 
#         and height_2016_cm.
#         Hint: `aes(x = height_2013_cm, y = height_2016_cm, group = treatment)`
ggplot(
  data = banksia_data,
  aes(x = height_2013_cm, y = height_2016_cm, group = treatment)
  ) +
  geom_col()