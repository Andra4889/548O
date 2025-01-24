library(tidyverse)
require(nycflights13)


head(as.data.frame(weather))
head(as.data.frame(airports))
head(as.data.frame(flights))
head(as.data.frame(planes))



#13.4.6 Exercises
##1.
Avg_delay_dest <- flights %>%
  group_by(dest) %>% 
  summarize(avg_delay = mean(dep_delay, na.rm = TRUE)) %>%
  inner_join(airports, c("dest" = "faa" )) %>% 
  ggplot(aes(color = avg_delay,lon, lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()  
  
Avg_delay_dest

##2. Add the location of the origin and destination (i.e. the lat and lon)
#to flights.

flights_with_origin <- flights %>% select(year:day,hour, origin, dest) %>%  
  left_join(select(airports,"faa","lat","lon"), by = c("origin" = "faa")) %>% 
  left_join(select(airports, "faa","lat","lon"), by = c("dest" = "faa"))
  
##3. 
## Find age of planes
## Join flights with age of planes and avg delay

planes_age <- planes %>% mutate(Age= 2013-year)
Flights_plane_age <- flights %>% left_join(select(planes_age, "Age", "tailnum"), 
                    by="tailnum")

R_age_delay <-  ggplot(data = Flights_plane_age, aes(Age, dep_delay)) +
                    geom_point()
plot(R_age_delay)

### 13.5.1 Exercise
##2. 
Planesless100 <- flights %>% group_by(tailnum)%>%
  summarize(flight_count = n()) %>%  filter(flight_count<=100) %>% 
  semi_join(Planesless100, by = "tailnum")

##5.

anti_join(flights, airports, by = c("dest" = "faa"))
# This shows all flights outside of the US
anti_join(airports, flights, by = c("faa" = "dest"))
# This shows all US airports that were not listed under "dest" in the flight table 







