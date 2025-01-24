library(tidyverse)
library(nycflights13)

planes %>% 
  count(tailnum) %>% 
  filter(n > 1)


weather %>% 
  count(year, month, day, hour, origin) %>% 
  filter(n > 1)

flights %>% 
  count(year, month, day, flight) %>% 
  filter(n > 1)


flights %>% 
  count(year, month, day, tailnum) %>% 
  filter(n > 1)


mutate(flights)
row_number()

13.4.6 Exercises
##1
average_delay_by_destination <- flights %>%
  group_by(dest) %>% 
  summarize(avg_delay = mean(arr_time, na.rm = TRUE))
%>% 
  inner_join(dest, by = "airport")








Compute the average delay by destination, then join on the airports data 
frame so you can show the spatial distribution of delays. Here’s an easy way 
to draw a map of the United States:
  
  airports %>%
  semi_join(flights, c("faa" = "dest")) %>%
  ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()