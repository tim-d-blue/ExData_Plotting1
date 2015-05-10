source("read_household_power_consumption.R")

plot_multi <- function() {
    # read data for relevant dates
    x <- read_data_for_dates("household_power_consumption.txt")
    
    #create a png file device
    png("plot4.png")
    #make a 2x2 grid for plots
    par(mfcol=c(2,2))

    #make a line plot of Global_active_power
    plot(x$DateTime,x$Global_active_power, type="l", xlab="", 
         ylab="Global Active Power")

    #make a line plot of each sub metering with legend
    plot(x$DateTime,x$Sub_metering_1, type="l", xlab="", 
         ylab="Energy sub metering")
    lines(x$DateTime,x$Sub_metering_2, col="red")
    lines(x$DateTime,x$Sub_metering_3, col="blue")
    legend('topright', legend=c("Sub_metering_1",
                                                "Sub_metering_2",
                                                "Sub_metering_3"), 
           lty=c(1, 1), col=c("black", "red", "blue"), bty="n")

    #make a line plot of Voltage
    plot(x$DateTime,x$Voltage, type="l", xlab="datetime", 
         ylab="Voltage")
    
    #make a line plot of Global_reactive_power
    plot(x$DateTime,x$Global_reactive_power, type="l", xlab="datetime", 
         ylab="Global_reactive_power")

    dev.off()
}
