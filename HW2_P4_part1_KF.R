#Import the libraries
library("ggplot2")

#Load the data
df <- read.csv ("C:/Users/kfeng3/Desktop/pt.csv")
head(df)

#Use a jittere categorical scatterplot overlayed with a boxplot to display absolute error vs each test
ggplot(df, aes(x=reorder(Test, AbsoluteError, FUN = median), y=AbsoluteError, fill=Test))+
  labs(x="Test", y="Absolute Error", title="Boxplot of Test vs. Absolute Error")+
  geom_boxplot()+
  geom_jitter()+
  theme(axis.text.x = element_text(face="bold", angle = 50, vjust = 1.0, hjust = 1.0))

#Extra Point 2: Normal Jitter
ggplot(df, aes(x=reorder(Test, AbsoluteError, FUN=median), y=AbsoluteError, fill=Test))+
  labs(x="Test", y="Absolute Error", title="Boxplot of Test vs. Absolute Error")+
  geom_boxplot()+
  geom_jitter(position = position_jitter(width = 0.1, height = 0.1, seed = NA))+
  theme(axis.text.x = element_text(face="bold", angle = 50, vjust = 1.0, hjust = 1.0))

#Create a violin plot to explore the error (without jitter)
ggplot(df, aes(x=reorder(Test, Error, FUN = median), y=Error, fill=Test))+
  labs(x="Test", y="Error", title="Violin Plot for Test vs. Error")+
  geom_violin()+
  theme(axis.text.x = element_text(face="bold", angle = 40, vjust = 1.0, hjust = 1.0))
#with jitter
ggplot(df, aes(x=reorder(Test, Error, FUN = median), y=Error, fill=Test))+
  labs(x="Test", y="Error", title="Violin Plot for Test vs. Error with Jitter")+
  geom_violin()+
  geom_jitter()+
  theme(axis.text.x = element_text(face="bold", angle = 40, vjust = 1.0, hjust = 1.0))

#Subset the data and pick out line 56-73
#Not breakdown by Tests
newdf <- subset(df, df$Subject>55 & df$Subject<74)
newdf
ggplot(newdf, aes(x=factor(Display), y=Error, fill=factor(Display)))+
  labs(x="Display", y="Error", title="Error Distribution by Display", fill="Display")+
  geom_boxplot()
#Breakdown by Tests
ggplot(newdf, aes(x=reorder(Test, Error, FUN = median), y=Error, fill=factor(Display)))+
  labs(x="Test", y="Result (Error)", fill="Display", title="Results from Different Displays (With Test Result)")+
  theme(axis.text.x = element_text(face="bold", angle = 30, vjust = 1.0, hjust = 1.0))+
  geom_boxplot()



