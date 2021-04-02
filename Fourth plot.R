library("data.table")
A<- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
A[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
A[, date_Time := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
A <- A[(date_Time >= "2007-02-01") & (date_Time < "2007-02-03")]
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(A[, date_Time], A[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
plot(A[, date_Time],A[, Voltage], type="l", xlab="date_time", ylab="Voltage")
plot(A[, date_Time], A[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(A[, date_Time], A[, Sub_metering_2], col="red")
lines(A[, date_Time], A[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")) 
plot(A[, date_Time], A[,Global_reactive_power], type="l", xlab="date_time", ylab="Global reactive power")
dev.off()
