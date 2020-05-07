library(ggplot2)
library(infer)
library(tidyverse)
library(broom)

d <- read.csv("/Users/kelton/Desktop/ADA/KamilarAndCooper.csv")
d

ggplot(data = d, aes(y = MaxLongevity_m, x = Brain_Size_Species_Mean)) + 
  geom_point() + geom_smooth(method = "lm", se = FALSE)

m <- lm(formula = MaxLongevity_m ~ Brain_Size_Species_Mean, data = d)
m2 <- lm(formula = log(MaxLongevity_m) ~ log(Brain_Size_Species_Mean), data = d)
confint(m, level = 0.90)
confint(m2, level = 0.90)


#Using the “KamilarAndCooperData.csv” dataset, run a linear regression 
#looking at log(HomeRange_km2) in relation to log(Body_mass_female_mean) and report your  
#β coeffiecients (slope and intercept).

x <- lm(formula = log(HomeRange_km2) ~ log(Body_mass_female_mean), data = d)

f <- rep_sample_n(tbl = d, size = nrow(d), reps = 1000, replace = TRUE)
f

lol <- f %>% 
  # Group by replicate
  group_by(replicate) %>% 
  # Run the model on each replicate, then tidy it
  do(lm(log(HomeRange_km2) ~ log(Body_mass_female_mean), data = .) %>% tidy())
filter(lol, term == "(Intercept)")
filter(lol, term == "log(Body_mass_female_mean)")

filtinter <- filter(lol, term == "(Intercept)")
filtBody <- filter(lol, term == "log(Body_mass_female_mean)")

ggplot(data = filtinter, aes(x = filtinter $ estimate, y = )) + geom_histogram()
ggplot(data = filtBody, aes(x = filtBody $ estimate, y = )) + geom_histogram()

#Estimate the standard error for each of your β
#coefficients as the standard deviation of the sampling distribution 
#from your bootstrap.

filter(lol, std.error == "(Intercept)")
filter(lol, std.error == "log(Body_mass_female_mean)")


