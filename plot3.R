source("read_household_power_consumption.R")

plot_Sub_metering <- function() {
    # read data for relevant dates
    x <- read_data_for_dates("household_power_consumption.txt")
    
    #create a png file device
    png("plot3.png")
    
    #make a line plot of each sub metering with legend
    plot(x$DateTime,x$Sub_metering_1, type="l", xlab="", 
         ylab="Energy sub metering")
    lines(x$DateTime,x$Sub_metering_2, col="red")
    lines(x$DateTime,x$Sub_metering_3, col="blue")
    legend('topright', border="black", legend=c("Sub_metering_1",
                                                "Sub_metering_2",
                                                "Sub_metering_3"), 
           lty=c(1, 1), col=c("black", "red", "blue"))
    dev.off()
}
