# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
View(flights)

dep_delay_by_month <- flights %>%
  group_by(month) %>%
  summarize(mean_delay = mean(dep_delay, na.rm = TRUE)) %>%


# Which month had the greatest average departure delay?
greatest_average <- dep_delay_by_month %>%
  filter(mean_delay == max(mean_delay))
print(greatest_average)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot_this <- dep_delay_by_month %>%
    plot('month', 'mean_delay')


# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
flights %>%
  group_by(dest) %>%
  summarize(average_delay = mean(arr_delay, na.rm = TRUE)) %>%
  filter(average_delay == max(average_delay, na.rm = TRUE))

#summarize(highest_delay = max(mean(arr_delay, na.rm = TRUE), na.rm = TRUE)) %>%

# You can look up these airports in the `airports` data frame!
airports %>%
  filter(faa == "CAE")

# Which city was flown to with the highest average speed?

flights %>%
  group_by(dest) %>%
  summarize(
    ave_speed = mean(distance/air_time)
  ) %>%
  filter(ave_speed == max(ave_speed, na.rm = TRUE))

