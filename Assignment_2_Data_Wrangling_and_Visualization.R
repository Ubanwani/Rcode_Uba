# ASSIGNMNET2_DATA_WRANGLING AND VISUALIZATION

# Use the titanic.csv file and perform data wrangling and visualization. Consider the step-by-step guide given below:

# Load the tidyverse library.
library(tidyverse)

#	Load the csv file using read_csv() and assign it to a dataframe.
df_titanic <- read_csv("titanic.csv") 
view(df_titanic)


# create another data frame named df_titanic_new
# by dropping a column
df_titanic_new <- df_titanic[,-c(12)] 
view(df_titanic_new)


#	Familiarize yourself with the data using glimpse().
glimpse(df_titanic_new)


#	Check for missing values either using view() or isnull().
df_titanic_new  %>% 
  filter(!complete.cases(.)) %>% 
  view()


#	Handle the missing value by using drop_na() or replace_na().
# df_titanic_new$age[is.na(df_titanic_new$age)] 

a <- mean(df_titanic_new$age,na.rm = TRUE)  
df_titanic_new  %>% 
  mutate(age = replace_na(age, a)) %>% 
  view()


#	Check for the datatypes and convert datatypes (if required).

df_titanic_new$who <- as.factor(df_titanic_new$who)
class(df_titanic_new$who)


#	Visualize the data. Make sure to include a bar chart, a histogram, a scatter plot and a box plot.

# Histogram of Number of adult male survivor by age
df_titanic_new %>% 
  ggplot(aes(x=age)) +
  geom_histogram() +
  labs (x="age")


# Histogram of not survived
df_titanic_new  %>%
  mutate(alive = recode(alive, "no" = 0,
           "yes" = 1))  %>%  
  ggplot(aes(x=alive)) +
  geom_histogram() +
  labs(x="alive")


# Bar chart of number of survived using "who"
df_titanic_new %>% 
  # filter(who %in% c("man", "woman", "child")) %>% 
  ggplot(aes(who, fill="survived")) +
  geom_bar(alpha = 0.5) 


# Bar chart of number of not survived using "who"
df_titanic_new  %>%
  mutate(alive = recode(alive, "no" = 0,
                 "yes" = 1)) %>% 
    filter(who %in% c("man", "woman", "child")) %>% 
  ggplot(aes(who, fill="not survived")) +
  geom_bar(fill = "lightblue", color = "blue") 
  labs(x="alive")


# Number of Adult Male survivor by age
df_titanic_new %>% 
  ggplot(aes())
  

# Number of deaths embarked by town using Bar Chart
df_titanic_new %>% 
  drop_na(embark_town, alive) %>% 
  filter(alive %in% c(alive="no")) %>% 
  ggplot(aes(x=embark_town, fill=who)) +
   geom_bar(alha = 0.5) +
  labs(title = "Deaths", 
    x="Departure",
    y="Death") +
  theme_minimal()


# Number of adult survivor by age using Boxplot chart
df_titanic_new %>% 
  drop_na(age,adult_male,alive) %>% 
  filter(alive %in% c("no")) %>% 
  ggplot(aes(age,adult_male, fill = alive)) +
  geom_boxplot() +
  labs(title = "Male by Age",
       x= "AGE", y="Adult male") +
  theme_light()

 
# A scatter plot 
a <- mean(df_titanic_new$age,na.rm = TRUE)  
df_titanic_new  %>% 
  mutate(age = replace_na(age, a)) %>% 
  drop_na(survived) %>% 
  ggplot(aes(age, survived)) +
  geom_point(aes(color=sex, alpha=0.5)) +   # scatter plot chart
  geom_smooth(method="lm") +   # to add linear mean (line accross the chart)
  labs(title="Survived and age") + 
  theme_light()

