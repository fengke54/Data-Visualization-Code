#Import the library
library("ggplot2")

#Load the Data
df<-read.csv("C:/Users/kfeng3/Desktop/pt2.csv")
df

#Create the visualization of Response vs. Subject (Clarify Trail and Display)
ggplot(df, aes(x=Subject, y=Response, shape=Trial, col=factor(Display)))+
  labs(x="Subject Number", y="Response", title="Detecting Errouneous Data", shape="Trail", col="Display")+
  geom_point(size=2)

  