## Goal is to examine how household energy usage varies over February 1-2, 2007.

## Plot 1: Global Active Power Histogram

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
png(filename="plot1.png", width=480, height=480)

hist(epower2$Global_active_power,col="red",main = "Global Active Power"
        ,xlab = "Global Active Power (kilowatts)"
        ,ylab = "Frequency")

dev.off()