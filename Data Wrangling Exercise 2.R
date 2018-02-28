library(data.table)
library(dplyr)
library(tidyr)
library(readr)
library(readxl)
titanic <- read_excel("C:/Users/Antstoe/Desktop/School/Bootcamp/SpringBoard/Data Wrangling Exercise 1/Data Wrangling Exercise 2/titanic3.xls")
write.csv(titanic, "titanic_original.csv", row.names=T)
titanic_original <- read.csv("C:/Users/Antstoe/Desktop/School/Bootcamp/SpringBoard/Data Wrangling Exercise 1/Data Wrangling Exercise 2/Data Wrangling Exercise 2/titanic_original.csv", header = T)

#Port of Embarkation
titanic_original <- titanic_original %>% 
  mutate(embarked = gsub("^$", "S", embarked))
#unique company name list
titanic_original %>% select(embarked) %>% unique()

#Task #2: Age
titanic_original <- titanic_original %>% 
  mutate(age = if_else(is.na(age), mean(df$age, na.rm=TRUE), age))
titanic_original %>% select(age) %>% unique()

#Task #3: Lifeboat
titanic_original <- titanic_original %>% 
  mutate(boat = gsub("^$", "NA", boat))
#unique boat list
titanic_original %>% select(boat) %>% unique()

#Task #4: Cabin
titanic_original <- titanic_original %>% 
  mutate(as_cabin_number = if_else(grepl("^$", cabin), 0, 1))
titanic_original %>% 
  select(as_cabin_number) %>% distinct

View(titanic_original)
write.csv(titanic_original,'titanic_original.csv', row.names=T)