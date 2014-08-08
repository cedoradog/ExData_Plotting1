#Created by Camilo Dorado
#Created on August 7th/2014
#Last modification on August 7th/2014

#Set the working directory
setwd("d:/Users/Camilo/Desktop/DataScience/ExploratoryDataAnaL/A1")

#Assume that unzipped "household_power_consumption.txt" file is in the same
#directory of this script, also the same directory where the plot is created.

#Load the data in several dataframes
consumption <- read.table("household_power_consumption.txt", sep = ";",
                          head = T, na.strings = "?")

#Select the only two days we are interested in
consumption <- subset(consumption, Date == "1/2/2007" | Date == "2/2/2007")

#Convert the Time and Date variables in POSIXlt time objects
consumption$Time <- strptime(paste(consumption$Date, consumption$Time),
                             "%d/%m/%Y %H:%M:%S", tz = "UTC")
consumption$Date <- strptime(consumption$Date, "%d/%m/%Y", tz = "UCT")

#Set English as the locale language
Sys.setlocale("LC_TIME", "English")

#Open device to plot into a png file
png("plot3.png")

#Plot the lines graph line by line
with(consumption, plot(Time, Sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub-metering"))
with(consumption, lines(Time, Sub_metering_2, type = "l", col = "red"))
with(consumption, lines(Time, Sub_metering_3, type = "l", col = "blue"))

#Add legend
legend("topright", legend = names(consumption)[7:9], 
       col = c("black", "red", "blue"), lty = 1)

#Close the plotting device
dev.off()
