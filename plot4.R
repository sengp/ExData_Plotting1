## Goal is to examine how household energy usage varies over February 1-2, 2007.

## Plot 4: Global Active Power, Voltage, Energy sub metering
##         , Global_reactive_power over Date/Time.


## Load dataset into R 
setwd("C:/Users/Seng/Desktop/Coursera Data Scientist/Class4ExploratoryDataAnalysis")
epower <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                     colClasses=c("character","character","numeric","numeric","numeric"
                                  ,"numeric","numeric","numeric","numeric"), na.strings = "?")

## Create subset for data from 2/1/2007 - 2/2/2007 
epower2<- subset(epower,Date %in% c("1/2/2007","2/2/2007"))

## Convert the Date and Time variables to Date/Time classes
epower2$DateTime <- strptime(paste(epower2$Date,epower2$Time)
                             ,format="%d/%m/%Y %H:%M:%S")

## Construct the plot and save it to a PNG file
png(filename="plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(epower2$DateTime,epower2$Global_active_power, type = "l"
     , xlab = "", ylab = "Global Active Power") 

plot(epower2$DateTime,epower2$Voltage, type = "l"
     , xlab = "datetime", ylab = "Voltage") 

plot(epower2$DateTime,epower2$Sub_metering_1, type = "l",col="black"
     , xlab = "", ylab = "Energy sub metering")
lines(epower2$DateTime,epower2$Sub_metering_2, col="red")
lines(epower2$DateTime,epower2$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , lty=1) 

plot(epower2$DateTime,epower2$Global_reactive_power, type = "l"
     , xlab = "datetime", ylab = "Global_reactive_power") 

dev.off()