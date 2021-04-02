library("data.table")
x <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
x[,Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
x[,Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
x<- x[(Date<= "2007-02-02" ) & (Date >= "2007-02-01")]
png("Plot1(histogram).png", width=480, height=480)
hist(x[,Global_active_power],xlab="Global active power(kilowatts)", ylab="Frequency", main="Global active power", col="Red")
dev.off()
