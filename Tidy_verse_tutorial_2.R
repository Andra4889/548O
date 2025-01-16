##Adding Library###

library(tidyverse)

##Adding CSV Files
fship <- read_csv(file.path("data", "The_Fellowship_Of_The_Ring.csv"))
ttow <- read_csv(file.path("data", "The_Two_Towers.csv"))
rking <- read_csv(file.path("data", "The_Return_Of_The_King.csv")) 
rking

######
lotr_untidy <- bind_rows(fship, ttow, rking)
str(lotr_untidy)
lotr_untidy

##### Adding untidy data to project
write.csv(lotr_untidy, "lotr_untidy.csv")

### renaming the variable male and female as gender
lotr_tidy <- gather(lotr_untidy, key = 'Gender', value = 'Words', Female, Male)
lotr_tidy

### Write the tidy data to a delimited file
write_csv(lotr_tidy, path = file.path("data", "lotr_tidy.csv"))

###Adding male and female csv file
female <- read_csv(file.path("data", "Female.csv"))
male <- read_csv(file.path("data", "Male.csv"))

###3 Binding the rows and visualizing it 
lotr_untidy <- bind_rows(female,male)
str(lotr_untidy)
lotr_untidy

##### Adding untidy data to project
write_csv(lotr_untidy, path = file.path("data","lotr_untidy.csv"))

####Making the data messy
lotr_tidy <- read_csv(file.path("data", "lotr_tidy.csv"))

####Visualizing the data
lotr_tidy

## practicing with spread: let's get one variable per Race
##lotr_tidy %>% spread(key = Race, value = Words)

## practicing with spread: let's get one variable per Gender
##lotr_tidy %>% 
 ##spread(key = Gender, value = Words)

## practicing with spread ... and unite: let's get one variable per combo of Race and Gender
##lotr_tidy %>% 
  ##unite(Race_Gender, Race, Gender) %>% 
  ##spread(key = Race_Gender, value = Words)

### practicing with pivot_wider...let's get one variable per Race
lotr_tidy_pivot <- pivot_wider(lotr_tidy, names_from = "Race", values_from = "Words")
#lotr_tidy_pivot

## practicing with pivot_wider: let's get one variable per Gender
lotr_tidy_pivot <- pivot_wider(lotr_tidy, names_from = "Gender", values_from = "Words")
lotr_tidy_pivot

## practicing with pivot_wider ... and unite: let's get one variable per combo of Race and Gender
lotr_tidy_pivot <- unite(lotr_tidy,Race_Gender, Race, Gender) %>% pivot_wider(names_from = "Race_Gender", values_from = "Words")
lotr_tidy_pivot

### Write the tidy data to a delimited file
write_csv(lotr_tidy_pivot, path = file.path("data", "lotr_tidy_pivot.csv"))
