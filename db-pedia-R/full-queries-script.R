library(SPARQL) # SPARQL querying package
library(ggplot2)

# Step 1 - Set up preliminaries and define query
# Define the data.gov endpoint
endpoint <- "http://services.data.gov/sparql"
endpoint <- "http://dbpedia.org/sparql"


# create query statement
query <-
  "select ?band
where {
  ?band rdf:type <http://schema.org/MusicGroup>.
  ?band dbo:hometown dbr:Leeds.
}"
 
# Step 2 - Use SPARQL package to submit query and save results to a data frame
qd <- SPARQL(endpoint,query)
df <- qd$results

# Step 3 - Prep for graphing

# Numbers are usually returned as characters, so convert to numeric and create a
# variable for "average acres burned per fire"
str(df)
df <- as.data.frame(apply(df, 2, as.numeric))
str(df)

df$avgperfire <- df$ac/df$fi

# Step 4 - Plot some data
ggplot(df, aes(x=ye, y=avgperfire, group=1)) +
  geom_point() +
  stat_smooth() +
  scale_x_continuous(breaks=seq(1960, 2008, 5)) +
  xlab("Year") +
  ylab("Average acres burned per fire")

ggplot(df, aes(x=ye, y=fi, group=1)) +
  geom_point() +
  stat_smooth() +
  scale_x_continuous(breaks=seq(1960, 2008, 5)) +
  xlab("Year") +
  ylab("Number of fires")

ggplot(df, aes(x=ye, y=ac, group=1)) +
  geom_point() +
  stat_smooth() +
  scale_x_continuous(breaks=seq(1960, 2008, 5)) +
  xlab("Year") +
  ylab("Acres burned")

# In less than 5 mins we have written code to download just
# the data we need and have an interesting result to explore!