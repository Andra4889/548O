library(gapminder)
library(stringr)
gDat <- gapminder::gapminder
str(gDat)

##Escape sequences
grep('\'', levels(gDat$country), value = TRUE)
print("a\nb")
cat("a\nb")



##Quantifiers
(strings <- c("a", "ab", "acb", "accb", "acccb", "accccb"))
grep("ac*b", strings, value = TRUE)
grep("ac+b", strings, value = TRUE)
grep("ac?b", strings, value = TRUE)
grep("ac{2}b", strings, value = TRUE)
grep("ac{2,}b", strings, value = TRUE)
grep("ac{2,3}b", strings, value = TRUE)

##Exercise 1
#ee in Gapminder using quantifiers.
eecountry <- levels(gDat$country)
grep("e{2}", eecountry, value = TRUE)
#Answer = Greece
##Position of pattern within the string
(strings <- c("abcd", "cdab", "cabd", "c abd"))
grep("ab", strings, value = TRUE)
grep("^ab", strings, value = TRUE)
grep("ab$", strings, value = TRUE)
grep("\\bab", strings, value = TRUE)


##Exercise 2
grep(".R$", dir(), value = TRUE)

##Operators

(strings <- c("^ab", "ab", "abc", "abd", "abe", "ab 12"))
grep("ab.", strings, value = TRUE)
grep("ab[c-e]", strings, value = TRUE)
grep("ab[^c]", strings, value = TRUE)
grep("^ab", strings, value = TRUE)
grep("\\^ab", strings, value = TRUE)
grep("abc|abd", strings, value = TRUE)
gsub("(ab) 12", "\\1 34", strings)

##Exercise 3
Country <- levels(gDat$country)
Step_a <- grep("i|t", Country, value = TRUE)
Step_b <- grep("land$",Step_a, value = TRUE)
Step_c <- gsub("land","LAND", Step_b)
print(Step_c)
