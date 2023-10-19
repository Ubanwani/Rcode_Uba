# Assignment2_datawrangling

# view function to display titanic dataset
df_titanic <- read_csv("titanic.csv") 
view(df_titanic)


# understanding the data type
glimpse(df_titanic)


# unique function to display unique valua survived
unique(df_titanic$survived)


# find duplicates and remove them
# Remove duplicates by single column on pclass
df_titanic2 <- df_titanic[!duplicated(df_titanic$pclass),] %>% 
  view()
  

# create a new column from an existing column
# creating a column named rescue and reorder the table
df_titanic %>% 
  mutate(rescued = survived) %>% 
  select(survived, rescued, everything()) %>%
  view()


# manipulate the data used to change variable types.
df_titanic$sex <- as.factor(df_titanic$sex)
class(df_titanic$sex)


# filtering column in dataset (Titanic data set)
df_titanic %>% 
  select(survived, sex, embarked, alive, who) %>% 
  filter(who %in% c("woman", "man")) %>% 
  view()


# recoding variables changing factor variable from char to int
df_titanic %>% 
  mutate(class = recode(class, "first" = 1,
              "second" = 2, "third" = 3)) %>% 
  view()


# handling missing values
df_titanic %>% 
  select(survived, pclass, sex, age, who, class, alive, fare) %>%
  filter(!complete.cases(.)) %>% 
  view()


# mutate empty observations function for mass -for numeric value to ZERO
df_titanic %>% 
  mutate(sex = recode(sex, "male" = "M",
                       "female" = "F")) %>%
  view()


# rename the variable sex with gender
df_titanic %>%
  rename("gender" = "sex") %>% 
  view()


# subsetting (selecting and listing only the columns needed)
df_titanic_sub <- df_titanic %>% 
  select(1:5, who) %>% 
  view()


# creating a column named rescue and reorder the table
df_titanic %>% 
  mutate(rescued = survived) %>% 
  select(survived, rescued, everything()) %>%
  mutate(sex = recode(sex, "male" = "M",
                      "female" = "F")) %>%
  view()

