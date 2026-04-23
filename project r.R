#Loading the dataset
zomato_data <- read.csv(file.choose())

# View data
head(zomato_data)

#Remove duplicate rows
zomato_data <- distinct(zomato_data)

# Convert variables to correct data types
zomato_data$Delivery_person_Age <- as.numeric(zomato_data$Delivery_person_Age)

zomato_data$Delivery_person_Ratings <- as.numeric(zomato_data$Delivery_person_Ratings)

zomato_data <- zomato_data %>%
  rename(Time_taken_min = contains("Time_taken"))

# Create age groups

zomato_data$Age_Group <- cut(zomato_data$Delivery_person_Age,
                             breaks=c(20,25,30,35,40,45),
                             labels=c("20-25","25-30","30-35","35-40","40-45"))
# Fix column names permanently
colnames(zomato_data) <- make.names(colnames(zomato_data))
colnames(zomato_data)



#1.Delivery Time Distribution
ggplot(zomato_data, aes(x = Time_taken.min.)) +
  geom_histogram(binwidth = 5,
                 fill = "darkgreen",
                 color = "black") +
  labs(title = "Distribution of Delivery Time",
       x = "Delivery Time (minutes)",
       y = "Frequency") +
  theme_minimal()



#2.Ratings by Age Group
ggplot(zomato_data,
       aes(x = Age_Group,
           y = Delivery_person_Ratings,
           fill = Age_Group)) +
  geom_boxplot() +
  labs(title = "Delivery Ratings by Age Group") +
  theme_minimal()



#3.Restaurants by City
traffic_density_counts <- food_delivery_data %>%
  count(Road_traffic_density) %>%
  mutate(percentage = n/sum(n)*100)

ggplot(traffic_density_counts,
       aes(x = "",
           y = percentage,
           fill = Road_traffic_density)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y") +
  labs(title="Orders by Road Traffic Density") +
  theme_void()




#4.Restaurant Ratings Distribution
zomato_data$Rating_Group <- cut(zomato_data$Aggregate.rating,
                                breaks = c(0,2,3,4,5),
                                labels = c("Poor","Average","Good","Excellent"))

ggplot(zomato_data,
       aes(x = Rating_Group,
           fill = Rating_Group)) +
  geom_bar() +
  labs(title = "Restaurant Rating Categories",
       x = "Rating Category",
       y = "Number of Restaurants") +
  theme_minimal()





#5: High Quality AND Fast Delivery Restaurants
best_restaurants <- zomato_data %>%
  group_by(Restaurant.Name) %>%
  summarise(
    avg_rating = mean(Aggregate.rating),
    avg_delivery_time = mean(Time_taken.min.)
  ) %>%
  filter(avg_rating > 4) %>%
  arrange(avg_delivery_time) %>%
  head(10)

ggplot(best_restaurants,
       aes(x = reorder(Restaurant.Name, -avg_rating),
           y = avg_rating,
           fill = avg_delivery_time)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top High Quality AND Fast Delivery Restaurants",
       x = "Restaurant Name",
       y = "Restaurant Rating",
       fill = "Delivery Time") +
  theme_minimal()


#6. Restaurant Rating vs Delivery Time Trend
rating_trend <- zomato_data %>%
  group_by(Aggregate.rating) %>%
  summarise(avg_delivery_time = mean(Time_taken.min.))

ggplot(rating_trend,
       aes(x = Aggregate.rating,
           y = avg_delivery_time)) +
  geom_line(color = "blue",
            size = 1.5) +
  geom_point(color = "red",
             size = 3) +
  labs(title = "Restaurant Rating vs Delivery Time Trend",
       x = "Restaurant Rating",
       y = "Average Delivery Time") +
  theme_minimal()
