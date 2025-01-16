###Loadind package

library(tidyverse)
library(dplyr)

surveys <- read_csv("data/surveys.csv")

##Select a subset of columns
select(surveys, year, month, day)

##They can occur in any order.
select(surveys, month, day, year)

###Filtering some information
filter(surveys, species_id == "DS")

##Add new columns with calculated values using mutate()
mutate(surveys, hindfoot_length_cm = hindfoot_length / 10)

####Adding new information to the CSV 
surveys_plus <- mutate(surveys,
                       hindfoot_length_cm = hindfoot_length / 10)

###Overwriting existing column or variable
surveys <- mutate(surveys,
                  hindfoot_length_cm = hindfoot_length / 10)


#####EXERCISE 1
###Adding the csv file 

shrub_volume_data <- read_csv("data/shrub-volume-data.csv")
str(shrub_volume_data)

##Select a data from the length columns
select(shrub_volume_data, length)

##Select a data from the site and experiment columns columns
select(shrub_volume_data, site, experiment)

###Filter the data for all of the plants with heights greater than 5 and print out the result.
filter(shrub_volume_data, height > "5")

##Create a new tibble or data.frame 
shrub_volume_data_plus <- mutate(shrub_volume_data,shrub_data_w_vols =length*width*height)


### Basic aggregation
group_by(surveys, species_id)

### Different looking kind of data.frame
surveys_by_species <- group_by(surveys, species_id)


###Use summarize() to calculate values for each group
summarize(surveys_by_species, abundance = n())

##Can group by multiple columns
surveys_by_species_plot <- group_by(surveys, species_id, plot_id)

summarize(surveys_by_species_plot, abundance = n())

##Use any function that returns a single value from a vector.

##species_weight <- summarize(surveys_by_species, avg_weight = mean(weight))

species_weight <- summarize(surveys_by_species,
                            avg_weight = mean(weight, na.rm = TRUE))
na.omit(species_weight)

##Determine the mean weight of DS in each year
ds_data <- filter(surveys, species_id == "DS")
ds_data_by_year <- group_by(ds_data, year)
ds_weight_by_year <- summarize(ds_data_by_year,
                               avg_weight = mean(weight, na.rm = TRUE))


####EXERCISE 2
##Selecting
select(surveys, month, day, year, species_id)

####Calculating for the weights in gram
Surveys_weight <- mutate(surveys,weight_g = weight / 1000)

##Creating a new dataframe
Surveys_weight_omit <- na.omit(Surveys_weight)
Surveys_data.frame <- select(Surveys_weight_omit,year, species_id,weight_g)

##3
Surveys_data.filter <- filter(Surveys_data.frame, species_id == "SH")

##4
surveys_group <- group_by(Surveys_data.filter, species_id)
surveys_summarize <- summarize(surveys_group, abundance = n())

##5
surveys_group_1 <- group_by(Surveys_data.frame, species_id, year)
surveys_summarize_1 <- summarize(surveys_group_1, abundance = n())

##6

Mean_mass <- filter(surveys, species_id =="DO")
Mean_mass_year <- group_by(Mean_mass, year)
Mean_mass_by_year <-  summarize(Mean_mass_year,
                                avg_weight = mean(weight, na.rm = TRUE))


##Pipe
x = c(1, 2, 3)
mean(x)

x %>% mean()

x = c(1, 2, 3, NA)
mean(x, na.rm = TRUE)
x %>% mean(na.rm = TRUE)


surveys %>%
  filter(species_id == "DS", !is.na(weight))

ds_weight_by_year <- surveys %>%
  filter(species_id == "DS") %>%
  group_by(year) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))


###EXERCISE 3 USING PIPING







