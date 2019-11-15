fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "household power consumption.zip"
download.file(fileurl, filename)
if(!file.exists("household power consumption")){
        unzip(filename)
}
filename <- "household_power_consumption"
unzip(filename)
unzip(filename)
library(data.table)
powerDT <- data.table::fread(input="household_power_consumption.txt"
                             , na.strings = "?")
powerDT[, Global_active_power:= lapply(.SD, as.numeric), .SDcols=c("Global_active_power")]
powerDT[, Date:= lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols=c("Date")]
powerDT <- powerDT[(Date>= "2007-02-01") & (Date <= "2007-02-02")]
png("plot1.png", width = 480, height = 480)
hist(powerDT[, Global_active_power], main = "Global Active Power",xlab= "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
dev.off()