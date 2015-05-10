source("read_household_power_consumption.R")

plot_Global_active_power2 <- function() {
    # read data for relevant dates
    x <- read_data_for_dates("household_power_consumption.txt")
    
    #create a png file device
    png("plot2.png")
    
    #make a line plot
    plot(x$DateTime,x$Global_active_power, type="l", xlab="", 
         ylab="Global Active Power (kilowatts)")
    dev.off()    
}
