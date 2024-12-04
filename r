# Set seed for reproducibility
set.seed(123)
# Generate a synthetic time series data
date_sequence <- seq(as.Date("2022-01-01"), by = "days", length.out = 365)
time_series_data <- data.frame(
Date = date_sequence,
Value = cumsum(rnorm(365)) # Cumulative sum of random normal values
)
# Plot the time series
plot(
time_series_data$Date, time_series_data$Value, type = "l",
xlab = "Date", ylab = "Value",
main = "Synthetic Time Series"
)
# Convert the time series data to a ts object
time_series <- ts(time_series_data$Value, frequency = 365)
# Decompose the time series into trend, seasonality, and remainder components
decomposition <- decompose(time_series)
# Plot the decomposed components
par(mfrow = c(3, 1)) # Arrange plots in a 3-row layout
plot(decomposition$seasonal, main = "Seasonal Component", ylab = "Seasonality")
plot(decomposition$trend, main = "Trend Component", ylab = "Trend")
plot(decomposition$random, main = "Residual Component", ylab = "Random Noise")
# Reset plot layout to default
par(mfrow = c(1, 1))
# Autocorrelation plot
acf(time_series, main = "Autocorrelation Plot")
# Partial autocorrelation plot
pacf(time_series, main = "Partial Autocorrelation Plot")



# Install and load necessary libraries
if (!requireNamespace("ggplot2", quietly = TRUE)) {
install.packages("ggplot2")
}
library(ggplot2)
# Sample data generation
set.seed(123)
sample_data <- data.frame(
ID = 1:100,
Age = sample(18:60, 100, replace = TRUE),
Gender = sample(c("Male", "Female"), 100, replace = TRUE),
Income = rnorm(100, mean = 50000, sd = 10000),
Score = rnorm(100, mean = 70, sd = 10)
)
# Display summary of the sample data
cat("Summary of Sample Data:\n")
print(summary(sample_data))
# Variable filter: Selecting specific columns
selected_columns <- sample_data[, c("ID", "Age", "Income")]
# Row filter: Filtering rows based on a condition (e.g., Age greater than 30)
filtered_data <- subset(sample_data, Age > 30)
# Data visualization using ggplot2
# Scatter plot of Age vs. Income
scatter_plot <- ggplot(sample_data, aes(x = Age, y = Income)) +
geom_point() +
labs(title = "Scatter Plot of Age vs. Income", x = "Age", y = "Income")
print(scatter_plot)
# Histogram of Age
histogram <- ggplot(sample_data, aes(x = Age)) +
geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
labs(title = "Histogram of Age", x = "Age", y = "Frequency")
print(histogram)
# Boxplot of Score by Gender
boxplot <- ggplot(sample_data, aes(x = Gender, y = Score, fill = Gender)) +
geom_boxplot() +
labs(title = "Boxplot of Score by Gender", x = "Gender", y = "Score")
print(boxplot)
# Save plots as image files
ggsave("scatter_plot.png", scatter_plot, height = 5, width = 7, dpi = 300)
ggsave("histogram.png", histogram, height = 5, width = 7, dpi = 300)
ggsave("boxplot.png", boxplot, height = 5, width = 7, dpi = 300)
# Display a message indicating the completion of the program
cat("Program completed successfully.\n")
