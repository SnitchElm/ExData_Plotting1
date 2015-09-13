## Function to create plot and save it to a PNG file

plot4 <- function(){
     # Read file
     x <- read.table("household_power_consumption.txt", 
                     colClasses = rep("character", 9), 
                     sep = ";", header = TRUE, na.strings = "?")
     
     # Get 2-day period data
     dat <- x[x$Date == "1/2/2007" | x$Date == "2/2/2007", ]
     
     rm(x)
     
     # Add column for Date data (concat Date and Time column)
     dat$Complete_date <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
     
     # Open device png
     png(filename = "plot4.png", width = 504, height = 504)
     
     # Set parameter
     par(bg = "transparent")
     par(ps = "12")
     par(mfrow = c(2, 2))
     par(col = "black")
     
     # Plot #1
     plot(dat$Complete_date, dat$Global_active_power, type = "l",
          ylab = "Global Active Power", xlab = "")
     
     # Plot #2
     plot(dat$Complete_date, dat$Voltage, type = "l",
          xlab = "datetime", ylab = "Voltage")
     
     # Plot #3
     plot(dat$Complete_date, dat$Sub_metering_1, type = "l",
          xlab = "", ylab = "Energy sub metering")
     legend("topright", legend = c("Sub_metering_1", "", ""), lty = c(1, 0, 0),
            text.col = "black", bty = "n")
     par(col = "red")
     lines(dat$Complete_date, dat$Sub_metering_2)
     legend("topright", legend = c("", "Sub_metering_2", ""), lty = c(0, 1, 0),
            text.col = "black", bty = "n")
     par(col = "blue")
     lines(dat$Complete_date, dat$Sub_metering_3)
     legend("topright", legend = c("", "", "Sub_metering_3"), lty = c(0, 0, 1),
            text.col = "black", bty = "n")
     
     # Plot #4
     par(col = "black")
     plot(dat$Complete_date, dat$Global_reactive_power, type = "l",
          xlab = "datetime", ylab = "Global_reactive_power")
     
     
     # Close device
     dev.off()
}