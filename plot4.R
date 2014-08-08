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
png("plot4.png")

#Draw the figure, plot by plot
par(mfrow = c(2, 2))

#1st plot (the same plot1: Global_active_power vs. Time)
with(consumption, plot(Time, Global_active_power, type = "l", xlab = "Time", 
                       ylab = "Global Active Power"))

#2nd plot (Voltage vs. Time)
with(consumption, plot(Time, Voltage, type = "l", xlab = "Time", 
                       ylab = "Voltage"))

#3rd plot (the same plot3: Sub_meterings vs. Time)
with(consumption, plot(Time, Sub_metering_1, type = "l", col = "black",
     xlab = "Time", ylab = "Energy sub-metering"))
with(consumption, lines(Time, Sub_metering_2, type = "l", col = "red"))
with(consumption, lines(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = names(consumption)[7:9], 
       col = c("black", "red", "blue"), lty = 1)

#4th plot (Global_reactive_power vs. Time)
with(consumption, plot(Time, Global_reactive_power, type = "l",
                       xlab = "Time", ylab = "Global reactive power"))

#Close the plotting device
dev.off()
