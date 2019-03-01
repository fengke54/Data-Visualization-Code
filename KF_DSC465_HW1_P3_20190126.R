#HW1---Problem 3

#Import Libraries
library("ggplot2")
library("reshape")

#Load the data
df <- read.csv("C:/Users/kfeng3.DPU/Desktop/perception.csv")
head(df)

#Pre-Processing: Create new variables
df$error=df$Response-df$TrueValue
df$error
head(df)

#Create a histogram showing the overall distribution of Error
hist(df$error, col="Yellow")
head(df)

#Error vs. Test---Bar Graph
aggdata <- aggregate(df$error, by=list(df$Test), FUN=median)
head(aggdata)
names(aggdata)[1]= "Test"
names(aggdata)[2]="ErrorM"
head(aggdata)
ggplot(aggdata, aes(x=reorder(Test, ErrorM), y=ErrorM, col=Test, fill=Test))+
  labs(title = "Median Error by Test", x="Test", y="Error (Median)")+
  geom_bar(stat="identity")+
  theme(axis.text.x = element_text(face="bold", angle = 40, vjust = 1.0, hjust = 1.0))

#Error vs. Test---Standard Deviation---Bar Graph
aggdata2 <-aggregate(df$error, by=list(df$Test), FUN=sd)
aggdata2
names(aggdata2)[1]= "Test"
names(aggdata2)[2]="Sderror"
head(aggdata2)
ggplot(aggdata2, aes(x=reorder(Test, Sderror), y=Sderror, col=Test, fill=Test))+
  labs(title = "Error Standard Deviation by Test", x="Test", y="Error (Standard Deviation)")+
  geom_bar(stat="identity")+
  theme(axis.text.x = element_text(face="bold", angle = 40, vjust = 1.0, hjust = 1.0))

#Calculate Absolute error and then create a bar graph showing abs(error) vs. Test
df$abserror=abs(df$error)
head(df)
ggplot(df, aes(x=reorder(Test, abserror), y=abserror, col=Test, fill=Test))+
  labs(title="Absolute Error vs. Test", x="Test", y="Absolute Error")+
  geom_bar(stat="identity")+
  theme(axis.text.x = element_text(face="bold", angle = 40, vjust = 1.0, hjust = 1.0))
