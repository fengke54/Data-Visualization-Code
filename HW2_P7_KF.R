#Import Libraries
library("ggplot2")
library("zoo")

#Load the Data
df <-read.csv("C:/Users/kfeng3/Desktop/pw.csv")
head(df)

#Pre-processing: Manipulate the date
date<- as.Date(df$Date, format="%m/%d/%Y")
head(date)

#Create a graph and conduct a geom_smooth
#remain high frequency, no aggregation 
smoothwl = rollmean(df$WL, 72, align="center")
plot(df$WL, xlab="Time", ylab ="Water Level", main ="Water Level Centered Moving Average")
lines(smoothwl, col="red")
#aggregate by daily sum 
sumwl=aggregate(df$WL, by=list(date), FUN=sum)
sumwl
colnames(sumwl)[1]="date1"
colnames(sumwl)[2]="Wlsumbyday"
sumwl
smoothsumwl=rollmean(sumwl$Wlsumbyday, 3, align="center")
plot(sumwl$Wlsumbyday, xlab = "Time (Daily)", ylab = "Water Level (Daily Sum)", main="Water Level Centered Moving Average (Sum by Day)")
lines(smoothsumwl, col="red")
#aggregate by daily average  
avewl=aggregate(df$WL, by=list(date), FUN=mean)
avewl
colnames(avewl)[1]="date1"
colnames(avewl)[2]="Wlavebyday"
avewl
smoothavewl=rollmean(avewl$Wlavebyday, 3, align="center")
plot(avewl$Wlavebyday, xlab = "Time (Daily)", ylab = "Water Level (Daily Average)", main="Water Level Centered Moving Average (Average by Day)")
lines(smoothavewl, col="red")