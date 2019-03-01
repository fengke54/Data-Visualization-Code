#Import the libraries
library("ggplot2")

#Load the data
df <- read.csv ("C:/Users/kfeng3/Desktop/pt3.csv")
head(df)

#Use a jittere categorical scatterplot overlayed with a boxplot to display absolute error vs each test
ggplot(df, aes(x=reorder(Test, AbsoluteError, FUN=median), y=AbsoluteError, fill=Test))+
  labs(x="Test", y="Absolute Error", title="Boxplot of Test vs. Absolute Error (Excluding Anomalous Subjects")+
  geom_boxplot()+
  geom_jitter()+
  theme(axis.text.x = element_text(face="bold", angle = 50, vjust = 1.0, hjust = 1.0))
