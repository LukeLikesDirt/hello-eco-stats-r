# Code in this file runs each time the lesson starts.

options(stringsAsFactors = FALSE)

set.seed(42)

# Create ecological survey data and write to CSV for students to read in.
eco_survey_data <- data.frame(
  site = c(
    "Wetland_A", "Wetland_A", "Wetland_B", "Wetland_B",
    "Forest_C", "Forest_C", "Forest_C",
    "Grass_D", "Grass_D", "Wetland_A", "Grass_D", "Forest_C"
  ),
  habitat = c(
    "wetland", "wetland", "wetland", "wetland",
    "forest", "forest", "forest",
    "grassland", "grassland", "wetland", "grassland", "forest"
  ),
  species = c(
    "frog", "dragonfly", "frog", "heron",
    "owl", "beetle", "owl",
    "bee", "beetle", "frog", "bee", "beetle"
  ),
  count = c(8, 15, 12, 2, 3, 24, 1, 31, 18, 10, 27, 21),
  temp_c = c(18.5, 21.3, 19.2, 20.1, 16.4, 17.2, 15.9, 22.5, 23.0, 19.0, 24.1, 16.8),
  rainfall_mm = c(12.1, 12.1, 8.4, 8.4, 22.3, 22.3, 22.3, 5.7, 5.7, 12.1, 5.7, 22.3),
  observer = c("Ari", "Ari", "Bo", "Bo", "Chen", "Chen", "Chen", "Drew", "Drew", "Ari", "Drew", "Chen")
)

write.csv(eco_survey_data, "eco_survey.csv", row.names = FALSE)
rm(eco_survey_data)
