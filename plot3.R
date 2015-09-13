## Function to create line graph and save it to a PNG file

plot3 <- function(){
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
     png(filename = "plot3.png", width = 504, height = 504)
     
     # Set parameter
     par(bg = "transparent")
     par(ps = "12")
     #par(mar = c(4.1, 3.8, 3.4, 1))
     
     # Draw line graph for sub metering 1
     par(col = "black")
     plot(dat$Complete_date, dat$Sub_metering_1, type = "l",
          xlab = "", ylab = "Energy sub metering")
     legend("topright", legend = c("Sub_metering_1", "", ""),
            lty = c(1, 0, 0), text.col = "black")
     # Draw line graph for sub metering 2
     par(col = "red")
     lines(dat$Complete_date, dat$Sub_metering_2)
     legend("topright", legend = c("", "Sub_metering_2", ""),
            lty = c(0, 1, 0), text.col = "black")
     # Draw line graph for sub metering 3
     par(col = "blue")
     lines(dat$Complete_date, dat$Sub_metering_3)
     legend("topright", legend = c("", "", "Sub_metering_3"),
            lty = c(0, 0, 1), text.col = "black")
     
     
     # Close device
     dev.off()
}