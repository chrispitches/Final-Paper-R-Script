setwd("/Users/ChrisPitches/Desktop/Pol400W")

###Install Packages

install.packages ("MASS, survey", dependancies = TRUE)

library(MASS)

##Question 4

(12+3)

(12+3-2)

my.data <- read.csv("anes2016small.csv", header = TRUE)

names(my.data)

summary(my.data)

summary(my.data$ftpre_dempty)

summary(my.data$ftpre_repty)

freq <-table(my.data$ftpre_dempty)

table(my.data$ftpre_dempty)

freq <-table(my.data$ftpre_repty)

table(my.data$ftpre_repty)

my.data$ftpre_repty[anes.data$ftpre_repty >= 0 & anes.data$income <= 19] <- 1

my.data$ftpre_repty[anes.data$ftpre_repty > 20 & anes.data$income <= 39] <- 2

my.data$ftpre_repty[anes.data$ftpre_repty > 40 & anes.data$income <= 59] <- 3

my.data$ftpre_repty[anes.data$ftpre_repty > 60 & anes.data$income <= 79] <- 4

my.data$ftpre_repty[anes.data$ftpre_repty > 80 & anes.data$income <= 100] <- 5

ftrep5 <- ftpre_repty

my.data$ftpre_repty <- factor(my.data$ftpre_repty, levels = c(1, 2, 3, 4, 5), labels = c("Low", "Medium Low", "Medium", "Medium High", "High"))

table(my.data$ftpre_repty)