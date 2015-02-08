library(dplyr)

#  merge the X_train data sets and return a single data set
plot4 <- function( ){
      #  Open files
      #browser()
      pf <- read.csv("household_power_consumption.txt", 
                            head = TRUE, sep = ";", nrows = 69516,
                            na.strings = "?")
      #  Create a date var what can be filtered
      pf$Date <- as.Date(pf$Date, "%d/%m/%Y")
      #  Remove all sample not within the dates
      pf <- filter(pf, Date >= "2007-02-01" & Date <= "2007-02-02")
      
      #  Create date and time 
      #browser()
      tmm <- strptime(paste(as.character(pf$Date), 
                            as.character(pf$Time)), 
               format = "%Y-%m-%d %H:%M:%S")
      
      #  Create plot and save a png file
      png("plot4.png")
      par(mfrow = c(2,2))
      
      with(pf, {
            plot( tmm, Global_active_power, type = "l",
                     xlab = " ", ylab = "Global Active Power")
            
            plot( tmm, Voltage, type = "l",
                  xlab = "datetime", ylab = "Voltage")
      
            plot( tmm, Sub_metering_1,
               xlab = " ", ylab = "Energy sub metering", type = "n")
            lines(tmm,Sub_metering_1, col = "black", type = "l")
            lines(tmm,Sub_metering_2, col = "red", type = "l")
            lines(tmm,Sub_metering_3, col = "blue", type = "l")
      
            legend("topright", col = c("black", "red", "blue"), lty = 1,
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
            
            plot( tmm, Global_reactive_power, type = "l",
                  xlab = "datetime")
      } )
      dev.off()
      #browser()
            
}