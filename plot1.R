## Function to create histogram and save it to a PNG file

plot1 <- function(){
     # Read file
     x <- read.table("household_power_consumption.txt", 
                       colClasses = rep("character", 9), 
                       sep = ";", header = TRUE, na.strings = "?")
     
     # Get 2-day period data
     dat <- x[x$Date == "1/2/2007" | x$Date == "2/2/2007", ]
     
     rm(x)
     
     # Set font size
     par(ps = "12")
     
     # Convert column to numeric
     dat$Global_active_power <- as.numeric(dat$Global_active_power)
     
     # Plot the histogram
     hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)", 
          main = "Global Active Power", col = "red")
     
     # Save into file
     dev.copy(png, file = "plot1.png")
     dev.off()
}