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




























