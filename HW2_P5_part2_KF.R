#import libraries
library("ggplot2")

#load the date
df<-read.csv("C:/Users/kfeng3/Desktop/Intel1995.csv")
head(df)

#Pre-processing the date
date<-as.Date(df$Date, format="%m/%d/%Y")
head(date)

#create a log adj price, display over data and find the large percentage change in the analysis
lnprice=log(df$Adj.Close, base=exp(1))
ggplot(df, aes(x=date, y=lnprice))+
  labs(x="Date", y="Logged Adjusted Price", title="Logged Adjusted Price in Year 1995")+
  scale_y_continuous(breaks=seq(0, 3, 0.1))+
  geom_line(size=2, col="orange")
