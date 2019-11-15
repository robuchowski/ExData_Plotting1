powerDT <- data.table::fread(input="household_power_consumption.txt", na.strings = "?")
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerDT[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerDT <- powerDT[(datetime >= "2007-02-01") & (datetime < "2007-02-03")]

png("plot2.png", width=480, height=480)
plot(x = powerDT[, datetime]
     , y = powerDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()