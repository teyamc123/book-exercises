# load relevant libraries
library("httr")
library("jsonlite")

# Be sure and check the README.md for complete instructions!


# Use `source()` to load your API key variable from the `apikey.R` file you made.
# Make sure you've set your working directory!
source("apikey.R") #execute all of the code in this file

key_param <- list("api-key" = nyt_key)

# Create a variable `movie_name` that is the name of a movie of your choice.
movie_name <- "Parasite"

# Construct an HTTP request to search for reviews for the given movie.
# The base URI is `https://api.nytimes.com/svc/movies/v2/`
# The resource is `reviews/search.json`
# See the interactive console for parameter details:
#   https://developer.nytimes.com/movie_reviews_v2.json
#
# You should use YOUR api key (as the `api-key` parameter)
# and your `movie_name` variable as the search query!

#this is the base, drawing out the whole map
base_uri <- "https://api.nytimes.com/svc/movies/v2/"
endpoint <- "reviews/search.json"
uri <- paste0(base_uri, endpoint)

#these are the directions to the treasure. Details about the 
#landscape and how many steps to take are listed here
#each parameter is a new step 
query_params_list <- list("api-key" = nyt_key, "movie_name" = movie_name)
  print(query_param_list)
# Send the HTTP Request to download the data
# Extract the content and convert it from JSON

response <- GET(uri, query = query_params_list)
body <- content(response, "text")
data <- fromJSON(body)
print(data)

# What kind of data structure did this produce? A data frame? A list?
#It came out as a list but that list has a dataframe stored in it

# Manually inspect the returned data and identify the content of interest 
# (which are the movie reviews).
# Use functions such as `names()`, `str()`, etc.
names(data)
str(data)


# Flatten the movie reviews content into a data structure called `reviews`
reviews_df <- data$results
View(reviews_df)

# From the most recent review, store the headline, short summary, and link to
# the full article, each in their own variables
most_recent <- reviews_df %>%
  head(1) %>%
  View()

# Create a list of the three pieces of information from above. 
# Print out the list.
first_three <- c(most_recent$display_title, most_recent$mpaa_rating, most_recent$critics)
print(first_three)
