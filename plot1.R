library(dplyr)

#  create Plot 1 for Exploritory Data Analysis Project 1
plot1 <- function( ){
      #  read the csv data - stopping at 2/2/2007
      pf <- read.csv("household_power_consumption.txt", 
                            head = TRUE, sep = ";", nrows = 69516,
                            na.strings = "?")
      #  Repair the date column
      pf$Date <- as.Date(pf$Date, "%d/%m/%Y")
      
      # Select only the dates of interest
      pf <- filter(pf, Date >= "2007-02-01" & Date <= "2007-02-02")
      pf$Time <- as.character(pf$Time)
      
      #  plot the histogram
      png("plot1.png")
      hr <- hist(pf$Global_active_power, 
           main="Global Active Power", xlab = "Global Active Power (kilowatts)",
           col="firebrick3")
      
      dev.off()
      
      
}