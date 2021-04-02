library("data.table")
Y<- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
Y[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
Y[, date_Time := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
Y<- Y[(date_Time <="2007-02-02") & (date_Time>= "2007-02-01") ]
png("plot2.png", width=480, height=480)
plot(x =Y[, date_Time], ylab="Global active power (kilowatts)",y = Y[, Global_active_power] )
dev.off()
