setwd("/Users/ChrisPitches/Desktop/Pol400W")
read.csv("anes2016small.csv", header = TRUE)
anes.data <- read.csv("anes2016small.csv", header = TRUE)

####Install Packages

install.packages("jtools", dependancies = TRUE)

install.packages("stargazer", dependancies = True)

install.packages("Rcpp", dependancies = TRUE)

library(jtools)

library(stargazer)

library(Rcpp)

### Question 1

multi.ftpre_trump.model <- lm(anes.data$ftpre_trump ~ anes.data$ideol7 +
anes.data$age +
anes.data$gender +
anes.data$region +
anes.data$religion)

summ(multi.ftpre_trump.model)

### Question 2

multi.ftpre_hillary.model <- lm(anes.data$ftpre_hillary ~ anes.data$ideol7 +
anes.data$age +
anes.data$gender +
anes.data$region +
anes.data$religion

summ(multi.ftpre_hillary.model)

###Question 3

stargazer(multi.ftpre_trump.model, multi.ftpre_hillary.model,
out = "multivariatemodels.html" ,
title = "Table 1: Feelings toward Hillary Clinton and Donald Trump in 2016" ,
type = "html" ,
align = TRUE ,
digits = 2 ,
no.space = TRUE ,
star.char = "*" ,
star.cutoffs = 0.05 ,
notes.append = FALSE ,
notes = c("*p < 0.05"))
## 
