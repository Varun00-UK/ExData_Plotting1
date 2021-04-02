library("data.table")
Z<- data.table::fread(input = "household_power_consumption.txt",na.strings="?")
Z[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
Z[, date_Time := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
Z <- Z[(date_Time >= "2007-02-01") & (date_Time < "2007-02-03")]
png("plot3.png", width=480, height=480)
plot(Z[, date_Time], Z[, Sub_metering_1], type="l", ylab="Energy sub metering")
lines(Z[, date_Time], Z[, Sub_metering_2],col="red")
lines(Z[, date_Time], Z[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.off()
