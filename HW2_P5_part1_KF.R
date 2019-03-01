#Load Libraries
library("ggplot2")

#Import Data
df <- read.csv("C:/Users/kfeng3/Desktop/Intel.csv")
head(df)

#Pre-Processing
date <- as.Date(df$Date, format="%m/%d/%Y")
head(date)

#Create a standard line graph of the Adj.Close both with and without logrithm
#Without Logrithm
ggplot(df, aes(x=date, y=Adj.Close))+
  labs(x="Date", y="Adjusted Closing Price", title ="Adjusted Closing Price Displayed on a Daily Basis")+
  geom_line(size=2, color="Blue")
#With Logrithm
logadjp=log(df$Adj.Close, base=exp(1))
head(logadjp)
ggplot(df, aes(x=date, y=logadjp))+
  labs(x="Date", y="Adjusted Closing Price with Logrithm", title="Adjusted Closing Price with Logrithm Displayed on a Daily Basis")+
  geom_line(size=2, color="Red")

#Use a standard line graph and use the Volume field to alter the color of the line at each point
Volume2=df$Volume/1000000
head(Volume2)
ggplot(df, aes(x=date, y=logadjp, color=Volume2))+
  labs(x="Date", y="Adjusted Price with Logrithm", color="Volume(Unit: Millions)", title="Logrithm Price Display---Color by Volume")+
  scale_color_continuous(low="red", high="blue")+
  geom_line(size=3)

#Create a calculated field for logVolume=ln(Volume). Use logged Volume as color, and logged (adjprice), see if there is any difference from b
lnvolume=log(df$Volume, base = exp(1))
head(lnvolume)
ggplot(df, aes(x=date, y=logadjp, col=lnvolume))+
  labs(x="Date", y="Adjusted Price with Logrithm", col="Volume(Unit: Miilions)", title="Logrithm Price Display---Color by ln(Volume)")+
  scale_color_continuous(low="red", high="blue")+
  geom_line(size=3)

