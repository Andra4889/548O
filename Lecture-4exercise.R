library(tidyverse)

surveys <- read_csv("data/surveys.csv")
select(surveys, year, month, day)

filter(surveys, species_id == "DS")
mutate(surveys, hindfoot_length_cm = hindfoot_length / 10)

surveys <- mutate(surveys,
                  hindfoot_length_cm = hindfoot_length / 10)


#### Exercise 1
shrub_vol <- read.csv("data/shrub-volume-data.csv")
str(shrub_vol)

#try out select and filter
select(shrub_vol, length)
select(shrub_vol, site, experiment)
filter(shrub_vol, height > 5)

#create new column with volume in a new df
shrub_data_w_vols <- mutate(shrub_vol,
                            volume = length * width * height)

#### Basic Aggregation
group_by(surveys, species_id)

surveys_by_species <- group_by(surveys, species_id)

#count number of individuals in each species
summarize(surveys_by_species, abundance = n())


surveys_by_species_plot <- group_by(surveys, species_id, plot_id)
summarize(surveys_by_species_plot, abundance = n())

species_weight <- summarize(surveys_by_species, avg_weight = mean(weight))
species_weight

species_weight <- summarize(surveys_by_species,
                            avg_weight = mean(weight, na.rm = TRUE))
species_weight
na.omit(species_weight)


#determine mean weight of DS each year with intermediates
ds_data <- filter(surveys, species_id == "DS")
ds_data_by_year <- group_by(ds_data, year)
ds_weight_by_year <- summarize(ds_data_by_year,
                               avg_weight = mean(weight, na.rm = TRUE))

####Exercise 2
#2.1
select(surveys, year, month, day, species_id)

#2.2
surveys_weight_g_NA <- select(surveys, year, species_id, weight)
surveys_weight_g_noNA <- na.omit(surveys_weight_g_NA)
surveys_weight_kg <- mutate(surveys_weight_g_noNA, 
                            weight = weight/1000) # replace weight column in grams with kg
#2.3 
filter(surveys, species_id == "SH")

#2.4
surveys_species <- group_by(surveys, species_id)
summarize(surveys_species, abundance = n())

#2.5
surveys_species_years <- group_by(surveys, species_id, year)
summarise(surveys_species_years, abundance = n())

#2.6
surveys_DO <- filter(surveys, species_id == "DO")
surveys_DO_grouped <- group_by(surveys_DO, year)
summarise(surveys_DO_grouped, avg_weight = mean(weight, na.rm = TRUE))

#Pipes
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

#exercise 3
#3.1
surveys_weight_kg_2 <- surveys %>%
  select(year, species_id, weight) %>%
  mutate( wight = weight/1000) %>%
  na.omit(na.rm = TRUE)

#3.2
surveys_SH <- surveys %>%
  filter(species_id == "SH") %>%
  select(year, month, day, species_id)

#3.3
surveys_species_count <- surveys %>%
  group_by(species_id) %>%
  summarize(abundance = n())

#3.4
surveys_species_count_years <- surveys %>%
  group_by(species_id, year) %>%
  summarize(abundance = n())

#3.5
surveys_DO_mass_years <- surveys %>%
  filter(species_id == "DO") %>%
  group_by(species_id, year) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))

# Multiple filter conditions
filter(surveys, species_id == "DS", year > 1995)
filter(surveys, species_id == "DS" | species_id == "DM" | species_id == "DO")

species_weights <- surveys %>%
  group_by(species_id) %>%
  filter(n() > 100) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))
