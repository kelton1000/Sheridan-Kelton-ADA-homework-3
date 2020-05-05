library(ggplot2)

d <- read.csv("/Users/kelton/Desktop/ADA/KamilarAndCooper.csv")
d

ggplot(data = d, aes(y = MaxLongevity_m, x = Brain_Size_Species_Mean)) + 
  geom_point() + geom_smooth(method = "lm", se = FALSE)

m <- lm(formula = MaxLongevity_m ~ Brain_Size_Species_Mean, data = d)
m2 <- lm(formula = log(MaxLongevity_m) ~ log(Brain_Size_Species_Mean), data = d)
confint(m, level = 0.90)
confint(m2, level = 0.90)
