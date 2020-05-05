library(ggplot2)

f <- file.choose()
d <- read.csv("/Users/kelton/Desktop/ADA/KamilarAndCooper.csv")
d

ggplot(data = d, aes(y = MaxLongevity_m, x = Brain_Size_Species_Mean)) + 
  geom_point() + geom_smooth(method = "lm")
