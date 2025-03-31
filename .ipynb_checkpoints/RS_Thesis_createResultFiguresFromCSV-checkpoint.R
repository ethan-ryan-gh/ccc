###############
# Load In Data
###############

setwd("/Users/ethanryan/Documents/Thesis_Results")
# Use read.table() since your file is whitespace-delimited
data <- read.table("tr_001_002.csv", header = FALSE, sep = "")

# Convert columns V1 and V2 to numeric and assign more meaningful names
data$energy <- as.numeric(data$V1)
data$cross_section <- as.numeric(data$V2)

# Check the structure and preview the data
str(data)
head(data)

library(ggplot2)


###############
# Create Graph
###############

p <- ggplot(data, aes(x = energy, y = cross_section, color = "DBSR-50")) +
  geom_line() +
  labs(title = "State 5s.1  -> State 5p-.1",
       x = "Energy (eV)",
       y = expression("Cross Section ("*10^-16*" cm"^2*")"),
       color = NULL) +  # Remove legend title if desired
  scale_color_manual(values = c("DBSR-50" = "blue")) +
  scale_x_continuous(breaks = seq(floor(min(data$energy-1, na.rm = TRUE)),
                                  ceiling(max(data$energy, na.rm = TRUE)), by = 10)) +
  scale_y_continuous(breaks = seq(floor(min(data$cross_section, na.rm = TRUE)),
                                  ceiling(max(data$cross_section, na.rm = TRUE)), by = 1)) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))  # Center the title


# Save Plot
ggsave("energy_vs_cross_section_5s_to_5p-.png", plot = p, width = 8, height = 6, dpi = 300, bg = "white")
