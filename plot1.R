## Function to create histogram and save it to a PNG file

plot1 <- function(){
     # Read file
     x <- read.table("household_power_consumption.txt", 
                       colClasses = rep("character", 9), 
                       sep = ";", header = TRUE, na.strings = "?")
     
     # Get 2-day period data
     dat <- x[x$Date == "1/2/2007" | x$Date == "2/2/2007", ]
     
     rm(x)
     
     # Open device
     png(filename = "plot1.png", width = 504, height = 504)
     
     # Set font size
     par(ps = "12")
     par(bg = "transparent")
     par(col = "black")
     
     # Convert column to numeric
     dat$Global_active_power <- as.numeric(dat$Global_active_power)
     
     # Plot the histogram
     hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)", 
          main = "Global Active Power", col = "red")
     
     # Close device
     dev.off()
}