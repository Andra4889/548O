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


