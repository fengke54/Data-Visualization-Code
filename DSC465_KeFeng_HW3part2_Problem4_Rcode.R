#Import Libraries
library("ggplot2")
library("zoo")

#Load the Data
df <- read.csv("C:/Users/kfeng3/Desktop/pw.csv")
head(df)

#Pre-processing: Manipulate the date
date<- as.Date(df$Date, format="%m/%d/%Y")
head(df$date)

#Smoothing with a proper window size 

##Smoothing without Aggregation 
smoothwl = rollmean(df$WL,72, align="center")
plot(df$WL, xlab="Time", ylab ="Water Level", main ="Water Level Centered Moving Average", type="l")
lines(smoothwl, col="red")

smoothwl = rollmean(df$WL,120, align="center")
plot(df$WL, xlab="Time", ylab ="Water Level", main ="Water Level Centered Moving Average", type="l")
lines(smoothwl, col="red")

smoothwl = rollmean(df$WL,240, align="center")
plot(df$WL, xlab="Time", ylab ="Water Level", main ="Water Level Centered Moving Average", type="l")
lines(smoothwl, col="red")

smoothwl = rollmean(df$WL,960, align="center")
plot(df$WL, xlab="Time", ylab ="Water Level", main ="Water Level Centered Moving Average", type="l")
lines(smoothwl, col="red")

##Smoothing aggregation by daily sum (Exploring Different Window Size)
sumwl=aggregate(df$WL, by=list(date), FUN=sum)
sumwl
colnames(sumwl)[1]="date1"
colnames(sumwl)[2]="Wlsumbyday"
sumwl
smoothsumwl=rollmean(sumwl$Wlsumbyday, 3, align="center")
plot(sumwl$Wlsumbyday, xlab = "Time (Daily)", ylab = "Water Level (Daily Sum)", main="Water Level Centered Moving Average (Sum by Day)", type = "l")
lines(smoothsumwl, col="red")

smoothsumwl=rollmean(sumwl$Wlsumbyday, 5, align="center")
plot(sumwl$Wlsumbyday, xlab = "Time (Daily)", ylab = "Water Level (Daily Sum)", main="Water Level Centered Moving Average (Sum by Day)", type = "l")
lines(smoothsumwl, col="red")

smoothsumwl=rollmean(sumwl$Wlsumbyday, 10, align="center")
plot(sumwl$Wlsumbyday, xlab = "Time (Daily)", ylab = "Water Level (Daily Sum)", main="Water Level Centered Moving Average (Sum by Day)", type = "l")
lines(smoothsumwl, col="red")

smoothsumwl=rollmean(sumwl$Wlsumbyday, 20, align="center")
plot(sumwl$Wlsumbyday, xlab = "Time (Daily)", ylab = "Water Level (Daily Sum)", main="Water Level Centered Moving Average (Sum by Day)", type = "l")
lines(smoothsumwl, col="red")


##Smoothing aggregation by daily average (Exploring Different Window Size)
avewl=aggregate(df$WL, by=list(date), FUN=mean)
avewl
colnames(avewl)[1]="date1"
colnames(avewl)[2]="Wlavebyday"
avewl
smoothavewl=rollmean(avewl$Wlavebyday, 3, align="center")
plot(avewl$Wlavebyday, xlab = "Time (Daily)", ylab = "Water Level (Daily Average)", main="Water Level Centered Moving Average (Average by Day)", type="l")
lines(smoothavewl, col="red")

smoothavewl=rollmean(avewl$Wlavebyday, 5, align="center")
plot(avewl$Wlavebyday, xlab = "Time (Daily)", ylab = "Water Level (Daily Average)", main="Water Level Centered Moving Average (Average by Day)", type="l")
lines(smoothavewl, col="red")

smoothavewl=rollmean(avewl$Wlavebyday, 10, align="center")
plot(avewl$Wlavebyday, xlab = "Time (Daily)", ylab = "Water Level (Daily Average)", main="Water Level Centered Moving Average (Average by Day)", type="l")
lines(smoothavewl, col="red")

smoothavewl=rollmean(avewl$Wlavebyday, 20, align="center")
plot(avewl$Wlavebyday, xlab = "Time (Daily)", ylab = "Water Level (Daily Average)", main="Water Level Centered Moving Average (Average by Day)", type="l")
lines(smoothavewl, col="red")
