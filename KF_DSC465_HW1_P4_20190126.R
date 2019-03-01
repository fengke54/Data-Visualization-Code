#HW1---Problem 4

#Import Libraries
library("ggplot2")

#Load the data
df <- read.csv("C:/Users/kfeng3.DPU/Desktop/Infant.csv")
df
head(df)

#Pre-Processing: Renaming the variables
colnames(df) <- c("sex", "height", "weight")
df

#Create a scatterplot (x-axis: Weight.lbs, y-axis: Height.in)--colored by gender 
ggplot(df, aes(x=height, y=weight, color=sex))+
  labs(title="Infant Weight Over Height", x="Height", y="Weight")+
  scale_x_continuous(breaks=seq(15,25,1))+
  scale_y_continuous(breaks=seq(4,10,1))+
  geom_point(pch=20, size=5)

#Build two trend lines for the two population of the graph 
ggplot(df, aes(x=height, y=weight, color=sex))+
  labs(title="Infant Weight Over Height", x="Height", y="Weight")+
  scale_x_continuous(breaks=seq(15,25,1))+
  scale_y_continuous(breaks=seq(4,10,1))+
  geom_point(pch=20, size=5)+
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)
       