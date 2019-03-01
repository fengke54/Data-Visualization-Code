#import libraries
library("ggplot2")

#load the data
df <-read.csv("C:/Users/kfeng3/Desktop/md.csv")
head(df)

#Pre-processing, delete the missing values 
df1<-na.omit(df)
df1
colnames(df1)[1]="md"
df1

#Messier number against others one by one, first detect by correlation matrix 
plot(df1)
plot(df1$md, df1$NGC)
plot(df1$md, df1$Kind)
plot(df1$md, df1$Type)
plot(df1$md, df1$Distance)
plot(df1$md, df1$Size)
plot(df1$md, df1$ApparentMagnitude)
plot(df1$md, df1$RightAscension)
plot(df1$md, df1$Declination)
plot(df1$md, df1$Constellation)
plot(df1$md, df1$Season)
plot(df1$md, df1$Discoverer)
plot(df1$md, df1$year)
plot(df1$md, df1$Remarks)
#With Distance
distance1=log(df1$Distance, base=10) 
distance1
ggplot(df1, aes(x=md, y=distance1))+
  scale_x_continuous(breaks=seq(0, 110, 20))+
  labs(x="Messier Number", y="Distance with Log Base 10", title="Distance vs. Messier Number (Pattern A)")+
  geom_point(color="red", size=2)+
  geom_smooth(method = "loess", size=1, col="yellow")
#With Size
ggplot(df1, aes(x=md, y=Size))+
  scale_x_continuous(breaks=seq(0, 110, 20))+
  labs(x="Messier Number", y="Size", title="Size vs. Messier Number (Pattern B)")+
  geom_point(color="purple", size=2)+
  geom_smooth(method = "loess", size=1, col="black")
#With ApparentMagnitude 
ggplot(df1, aes(x=md, y=ApparentMagnitude))+
  scale_x_continuous(breaks=seq(0, 110, 20))+
  labs(x="Messier Number", y="Apparent Magnitude", title="Apparent Magnitude vs. Messier Number (Pattern C)")+
  geom_point(color="blue", size=2)+
  geom_smooth(method = "loess", size=1, col="orange")

#compare distribution 
ggplot(df1,aes(x=reorder(Kind, distance1, FUN = median), y=distance1, fill=Kind))+
  labs(x="Kind", y="Distance with Log Base 10", title = "Distance vs. Kind")+
  geom_boxplot()

#scatter plot distance vs apparent magnitude
colnames(df1)[7]="magnitude"
ggplot(df1, aes(x=distance1, y=magnitude, col=magnitude))+
  labs(x="Distance(With Log Base 10)", y="Magnitude", title="Apparent Magnitude vs. Distance by Color")+
  scale_color_continuous(low="#FFFF00", high="#0A0A2A")+
  geom_point(size=2)
ggplot(df1, aes(x=md, y=distance1, col=magnitude))+
  labs(x="Magnitude", y="Distance(With Log Base 10)", title="Distance vs. Apparent Magnitude by Color")+
  scale_color_continuous(low="#FFFF00", high="#0A0A2A")+
  geom_point(size=2)

#create a scatter plot 
ggplot(df1, aes(x=Size, y=distance1, shape=Kind, col=magnitude))+
  labs(x="Size", y="Distance(With Log Base 10)", title="Measuring Messier Objects with Four Parameters", col="Magnitude", shape="Kind")+
  scale_color_continuous(low="#FFFF00", high="#0000FF")+
  geom_point(size=2)
