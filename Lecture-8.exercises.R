##Conditionals

10 > 5
"aang" == "aang"
3 != 3
"dog" %in% c("cat", "dog", "rabbit")

5 > 2 & 6 >=10
5 > 2 | 6 >=10

c(1, 1, 2, 3, 1) == 1


site = c('a', 'b', 'c', 'd')
state = c('FL', 'FL', 'GA', 'AL')
state == 'FL'
site[state == 'FL']
site[c(TRUE, TRUE, FALSE, FALSE)]


##Exercise 1
w <- 10.2
x <- 1.3
y <- 2.8
z <- 17.5
colors <- c("red", "blue", "green")
masses <- c(45.2, 36.1, 27.8, 81.6, 42.4)
dna1 <- "attattaggaccaca"
dna2 <- "attattaggaacaca"

#1.1 
w > 10

#1.2
"green" == colors

#1.3
x > y

#1.4 
masses > 40


###if statements

x <- 6
if (x > 5){
  x <- x^2
}
x

x = 4
if (x > 5){
  x <- x^2
}
x

veg_type <- "tree"
volume <- 16.08
if (veg_type == "tree") {
  mass <- 2.65 * volume^0.9
}
mass

##Exercise 2
age_class = "sapling"
if (age_class == "sapling"){y <- 10
  
}
y

##Alternative conditioning

veg_type <- "grass"
volume <- 16.08
if (veg_type == "tree") {
  mass <- 2.65 * volume^0.9
} else if (veg_type == "grass") {
  mass <- 0.65 * volume^1.2
}
mass


veg_type <- "shrub"
volume <- 16.08
if (veg_type == "tree") {
  mass <- 2.65 * volume^0.9
} else if (veg_type == "grass") {
  mass <- 0.65 * volume^1.2
} else {
  mass <- NA
}
mass

##Exercise 3
##3.1
age_class <- "seedling"
if (age_class == "sapling"){ y = 10
} else if (age_class == "seedling"){y = 5
}
y

##3.2
age_class = "adult"
if (age_class =="sapling"){y = 10
} else if (age_class == "seedling") {y = 5
} else (y = 0)
y

# Multiple ifs vs else if
x <- 5
if (x > 2){
  x * 2
}
if (x > 4){
  x * 4
}


x <- 5
if (x > 2){
  x * 2
} else if (x > 4){
  x * 4
}


##Wrap conditionals within a function
est_mass <- function(volume, veg_type){
  if (veg_type == "tree") {
    mass <- 2.65 * volume^0.9
  } else if (veg_type == "grass") {
    mass <- 0.65 * volume^1.2
  } else {
    print("I don't know how to convert volume to mass for that vegetation type")
    mass <- NA
  }
  return(mass)
}

est_mass(1.6, "tree")
est_mass(1.6, "grass")
est_mass(1.6, "shrub")

##Exercise 4
get_mass_from_length_by_name <- function(length,name){
  if(name == "Stegosauria"){
  a = 10.95 
  b = 2.64
  } else if 
  (name == "Theropoda"){
    a = 0.73
    b = 3.63
  } else if 
  (name == "Sauropoda"){
    a = 214.44
    b = 1.46
  } else {
      a = NA
      b = NA
    }
  
  mass <- a * (length ^ b)
  return(mass)
  }
get_mass_from_length_by_name(name="Stegosauria", length=10)
get_mass_from_length_by_name(name="Theropoda", length=8)
get_mass_from_length_by_name(name="Sauropoda", length=12)
get_mass_from_length_by_name(name="Ankylosauria", length=13)  
  
##Nested conditionals

est_mass <- function(volume, veg_type, age){
  if (veg_type == "tree") {
    if (age < 5) {
      mass <- 1.6 * volume^0.8
    } else {
      mass <- 2.65 * volume^0.9
    }
  } else if (veg_type == "grass" | veg_type == "shrub") {
    mass <- 0.65 * volume^1.2
  } else {
    print("I don't know how to convert volume to mass for that vegetation type")
    mass <- NA
  }
  return(mass)
}

est_mass(1.6, "tree", age = 2)
est_mass(1.6, "shrub", age = 5)


##Basic for loop
for (item in list_of_items) {
  do_something(item)
}

print()

volumes = c(1.6, 3, 8)
for (volume in volumes){
  print(2.65 * volume^0.9)
}

volume <- volumes[1]
print(2.65 * volume ^ 0.9)
volume <- volumes[2]
print(2.65 * volume ^ 0.9)
volume <- volumes[3]
print(2.65 * volume ^ 0.9)


for (volume in volumes){
  mass <- 2.65 * volume ^ 0.9
  mass_lb <- mass * 2.2
  print(mass_lb)
}

## Exercise 5
#5.1
for (i in 2:16){
  print(i)
}

#5.2

for (i in 1:5){
  print(i*3)
}

#5.3
birds = c('robin', 'woodpecker', 'blue jay', 'sparrow')
for (i in 1:length(birds)){
  print(birds[i])
}

#5.4
radius <- c(1.3, 2.1, 3.5)
areas <- vector(mode = "numeric", length = length(radius))
for (i in 1:length(radius)){
  areas[i] <- pi * radius[i] ^ 2
}
areas

#5.5
lengths = c(1.1, 2.2, 1.6)
widths = c(3.5, 2.4, 2.8)
areas <- vector(length = length(lengths))
for (i in length(lengths)) {
  areas[i] <- lengths[i] * widths[i]
}
areas

##Looping with an index & storing results
for (i in 1:length(volumes)){
  mass <- 2.65 * volumes[i] ^ 0.9
  print(mass)
}

masses <- vector(mode = "numeric", length = length(volumes))
masses

for (i in 1:length(volumes)){
  mass <- 2.65 * volumes[i] ^ 0.9
  masses[i] <- mass
}
masses

b0 <- c(2.65, 1.28, 3.29)
b1 <- c(0.9, 1.1, 1.2)
masses <- vector(mode="numeric", length=length(volumes))
for (i in seq_along(volumes)){
  mass <- b0[i] * volumes[i] ^ b1[i]
  masses[i] <- mass
}






