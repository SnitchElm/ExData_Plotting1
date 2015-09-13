## Function to create line graph and save it to a PNG file

plot2 <- function(){
     # Read file
     x <- read.table("household_power_consumption.txt", 
                     colClasses = rep("character", 9), 
                     sep = ";", header = TRUE, na.strings = "?")
     
     # Get 2-day period data
     dat <- x[x$Date == "1/2/2007" | x$Date == "2/2/2007", ]
     
     rm(x)
     
     # Add column for Date data (concat Date and Time column)
     dat$Complete_date <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
     
     # Set parameter
     par(bg = "transparent")
     par(ps = "12")
     par(mar = c(4.1, 3.8, 3.4, 1))
     par(col = "black")
     
     # Plot the graphic
     plot(dat$Complete_date, dat$Global_active_power, type = "l",
          xlab = "", ylab = "Global Active Power (kilowatts)")
     
     
     # Save into file
     dev.copy(png, file = "plot2.png")
     dev.off()
}