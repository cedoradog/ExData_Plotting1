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

#The breaks for the histogram (it is not necessary for this example)
breaks <- seq(from = 0, to = max(consumption$Global_active_power, na.rm=T) + 0.5,
              by = 0.5)

#Open device to plot into a png file
png("plot1.png")

#Plot histogram
hist(consumption$Global_active_power, col="red", main = "Global Active Power",
     xlab="Global Active Power (kW)", breaks = breaks)

#Close the plotting device
dev.off()
