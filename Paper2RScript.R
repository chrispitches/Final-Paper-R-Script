# set working directory, make sure dataset is in folder

setwd("/Users/ChrisPitches/Desktop/POL400W")

# read dataset

anes.data <- read.csv("anes2016small.csv", header = TRUE) 

# recode variable "ftasians3"

anes.data$ftasians3 <- NA

anes.data$ftasians3[anes.data$ftpost_asians >= 0 & anes.data$ftpost_asians <= 49] <- 1

anes.data$ftasians3[anes.data$ftpost_asians == 50] <- 2

anes.data$ftasians3[anes.data$ftpost_asians >= 51 & anes.data$ftpost_asians <= 100] <- 3

anes.data$ftasians3 <- factor(anes.data$ftasians3, levels = c(1, 2, 3), labels = c("Cold", "Neutral", "Warm"))

# recode variable "educ5"

anes.data$educ5 <- factor(anes.data$educ5, levels = c(1, 2, 3, 4, 5), labels = c("Less HS", "High School", "Some Coll", "College", "Advanced"))

# recode variable "income"

anes.data$income[anes.data$ftincome >= 0 & anes.data$income <= 5] <- 1

anes.data$income[anes.data$ftincome > 5 & anes.data$income <= 11] <- 2

anes.data$income[anes.data$ftincome > 11 & anes.data$income <= 16] <- 3

anes.data$income[anes.data$income > 16 & anes.data$income <= 21] <- 4

anes.data$income[anes.data$income > 21 & anes.data$income <= 28] <- 5

anes.data$income <- factor(anes.data$income, levels = c(1, 2, 3, 4, 5), labels = c("Lowest", "Low", "Average", "High", "Highest"))

# crosstab contingency tables

install.packages("gmodels")

library(gmodels)

CrossTable(anes.data$ftasians3, anes.data$income, prop.c = TRUE, prop.r = FALSE, prop.t = FALSE, prop.chisq = FALSE, chisq = TRUE, format = "SPSS")

CrossTable(anes.data$ftasians3, anes.data$educ5, prop.c = TRUE, prop.r = FALSE, prop.t = FALSE, prop.chisq = FALSE, chisq = TRUE, format = "SPSS")

####
library(survey)
library(stargazer)

wgt <- svydesign(id = ~cluster, weight = ~weight, strata = ~strata, data = anes.data, nest = TRUE)

# Calculate mean by gender and ftasians3 variable
svy_gender_ftasians3_mean <- svyby(~ftpost_asians, ~gender, svymean, design = wgt, na.rm = TRUE)

# Run T-Test Analysis
ttest_AsiansGender <- svyttest(ftpost_asians ~ gender, design = wgt)

ttest_AsiansGender
# Print T-Test Analysis results
print(ttest_AsiansGender)

# Export T-Test Results as HTML Table
stargazer(ttest_AsiansGender, type = "html", out = "ttest_results.html")



### Ordinary Least Squares Regression










