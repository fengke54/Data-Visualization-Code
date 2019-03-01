#HW1---Problem2

#Import Libraries
library("ggplot2")

#Load the Dataset
df <- read.csv("C:/Users/kfeng3.DPU/Desktop/Intel.csv")
head(df)

#Preprocessing: Rename the variables and Change Date format
colnames(df)
colnames(df)[8] <- "Adjclose"
date <- as.Date(df$Date, format="%m/%d/%y")
head(date)

#Graph the closing price vs. the data with an ordinary line graph 
ggplot(df, aes(x=date, y=Adjclose))+
  labs(x="Date", y="Adjusted Closing Price", title = "Adjusted Closing Price by Date")+
  geom_line(size=2, col="Blue")+
  scale_y_continuous(limits = c(15,30))+
  theme(axis.text.x = element_text(face="bold"))

#Graph the Volume vs Date with a Bar Graph
volume2 <- df$Volume/1000000
max(volume2)
min(volume2)
ggplot(df, aes(x=date, y=volume2))+
  labs(x="Date", y="Volume (Unit: Million)", title="Volume by Date")+
  geom_bar(stat="identity", width=0.5, fill="#008000")+
  scale_x_date(breaks = "7 days")+
  scale_y_continuous(breaks=seq(0, 370,50))+
  theme(axis.text.x = element_text(angle = 40, vjust = 1.0, hjust = 1.0))

#Create a histogram of daily stock Volume
ggplot(df, aes(volume2))+
  labs(title="Distribution of Daily Stock Volume", x="Volume (Unit: Million)", y="Count")+
  scale_y_continuous(breaks=seq(0, 30,5))+
  scale_x_continuous(breaks=seq(0, 400,50))+
  geom_histogram(stat = "bin", fill="#B22222", bins=70)

#Create a scatterplot with volume on x-axis and range on y-axis
df$range <- df$High-df$Low
head(range)
ggplot(df, aes(x=volume2, y=range))+
  labs(x="Volume (Unit: Million)", y="Daily Price Range", title= "Daily Volume Vs. Price Range")+
  scale_x_continuous(breaks = seq(0, 370, 20))+
  scale_y_continuous(breaks= seq(0, 9.31,1))+
  geom_point(color="orange", size=1, stroke=1)


