library(dplyr)

#  merge the X_train data sets and return a single data set
plot2 <- function( ){
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
      tmm <- strptime(paste(as.character(pf$Date), 
                            as.character(pf$Time)), 
               format = "%Y-%m-%d %H:%M:%S")
      
      #  Create plot and save a png file
      png("plot2.png")
      with(pf, plot( tmm, Global_active_power, type = "l",
                 xlab = " ", ylab = "Global Active Power (kilowatts)"))
      dev.off()
      # browser()
            
}