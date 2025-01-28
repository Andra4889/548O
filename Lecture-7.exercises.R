##Function basics

function_name <- function(inputs) {
  output_value <- do_something(inputs)
  return(output_value)
}


{a = 2
  b = 3
  a + b}


calc_shrub_vol <- function(length, width, height) {
  volume <- length * width * height
  return(volume)
}

calc_shrub_vol(0.8, 1.6, 2.0)
shrub_vol <- calc_shrub_vol(0.8, 1.6, 2.0)


##Exercise 1
# Conversion of Pounds to Grams
Pounds_to_Grams <- function(Pounds) {
  grams <- Pounds * 453.592
  return(grams)
}

# Calculate grams for 3.75 pounds
Grams_3_75_to_pounds <- Pounds_to_Grams (3.75); Grams_3_75_to_pounds

##Exercise 2
##Mass from length of  the theropada
get_mass_from_length_theropoda <- function(length){
  mass <- 0.73 * length ^ 3.63
  return(mass)
}
##2.2
##Mass of a Spinosaurus
Mass_16m <- get_mass_from_length_theropoda(16); Mass_16m


# 2.3
get_mass_from_length <- function(length) {
  mass <- 214.44 * (length ^ 1.46)
  return(mass)
}

# Calculate the mass for the Sauropoda
Mass_sauropoda <- get_mass_from_length(26); Mass_sauropoda
  
##Default Agreement
calc_shrub_vol <- function(length = 1, width = 1, height = 1) {
  volume <- length * width * height
  return(volume)
}

calc_shrub_vol()
calc_shrub_vol(width = 2)
calc_shrub_vol(0.8, 1.6, 2.0)
calc_shrub_vol(height = 2.0, length = 0.8, width = 1.6)

##3.1 
get_mass_from_length <- function(length, a, b) {
  mass <- a * (length ^ b)
  return(mass)
}
# Parameters 
length_sauropoda <- 26 #in meters
a_sauropoda <- 214.44
b_sauropoda <- 1.46

