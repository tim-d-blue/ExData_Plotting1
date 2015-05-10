# Read the data file: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# select rows between start_date and end_date
read_data_for_dates <- function(fname, 
                                start_date=as.Date("2007-02-01", "%Y-%m-%d"), 
                                end_date=as.Date("2007-02-02", "%Y-%m-%d"))
{
    # open file
    f <- file(fname, "r")
    # Column names:
    #   Date;Time;Global_active_power;Global_reactive_power;Voltage;
    #   Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
    readLines(f,1) # skip the header row
    # setup the data table to return
    data <- data.table(DateTime=as.POSIXct(character()),
                       Global_active_power=numeric(),
                       Global_reactive_power=numeric(),
                       Voltage=numeric(),
                       Global_intensity=numeric(),
                       Sub_metering_1=numeric(),
                       Sub_metering_2=numeric(),
                       Sub_metering_3=numeric())
    # read each line of the file
    while (length(l <- readLines(f, 1, warn=FALSE)) > 0) {
        row <- strsplit(l, ";")
        # only add to return data table if within date range
        if (as.Date(row[[1]][1], "%d/%m/%Y") >= start_date &&  
                as.Date(row[[1]][1], "%d/%m/%Y") <= end_date) {
            # append a row to the data table
            data <- rbindlist(
                list(data, 
                     data.table(
                        DateTime=as.POSIXct(strptime(paste(row[[1]][1], 
                                                           row[[1]][2], 
                                                           sep=" "), 
                                                     "%d/%m/%Y %H:%M:%S")),
                        Global_active_power=as.numeric(row[[1]][3]), 
                        Voltage=as.numeric(row[[1]][4]), 
                        Global_intensity=as.numeric(row[[1]][5]), 
                        Global_reactive_power=as.numeric(row[[1]][6]), 
                        Sub_metering_1=as.numeric(row[[1]][7]), 
                        Sub_metering_2=as.numeric(row[[1]][8]),
                        Sub_metering_3=as.numeric(row[[1]][9])
                )))
        }
    }
    close(f)

    data
}
