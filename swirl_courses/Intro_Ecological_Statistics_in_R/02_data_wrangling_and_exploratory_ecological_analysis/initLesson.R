# Code in this file runs each time the lesson starts.

options(stringsAsFactors = FALSE)
set.seed(123)

eco_monitor <- data.frame(
  month = c("Jan", "Jan", "Jan", "Feb", "Feb", "Feb", "Mar", "Mar", "Mar", "Apr", "Apr", "Apr"),
  site = c("Wetland_A", "Forest_C", "Grass_D", "Wetland_A", "Forest_C", "Grass_D", "Wetland_A", "Forest_C", "Grass_D", "Wetland_A", "Forest_C", "Grass_D"),
  habitat = c("wetland", "forest", "grassland", "wetland", "forest", "grassland", "wetland", "forest", "grassland", "wetland", "forest", "grassland"),
  species_richness = c(14, 11, 9, 16, 12, 10, 18, 13, 11, 17, 14, 12),
  abundance = c(112, 79, 95, 134, 85, 101, 151, 91, 109, 143, 96, 117),
  temp_c = c(22.1, 18.2, 24.7, 23.4, 18.9, 25.2, 24.6, 19.8, 26.1, 23.9, 20.2, 26.4),
  rainfall_mm = c(121, 144, 62, 109, 157, 54, 98, 133, 47, 87, 126, 39),
  effort_hours = c(6, 5, 6, 6, 5, 6, 7, 5, 6, 7, 6, 6)
)

if (requireNamespace("tibble", quietly = TRUE)) {
  eco_monitor <- tibble::as_tibble(eco_monitor)
}
