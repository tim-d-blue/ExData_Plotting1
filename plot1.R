source("read_household_power_consumption.R")

plot_Global_active_power <- function() {
    # read data for relevant dates
    x <- read_data_for_dates("household_power_consumption.txt")
    
    #create a png file device
    png("plot1.png")
    
    #make a histogram plot
    hist(x$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
         main="Global Active Power")
    dev.off()    
}
