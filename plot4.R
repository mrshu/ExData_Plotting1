power_consumption_all <- read.table("./household_power_consumption.txt", 
                                    na.strings = c("?", ""), 
                                    sep=";", 
                                    header=TRUE)

power_consumption <- subset(power_consumption_all, Date %in% c("1/2/2007", "2/2/2007"))

power_consumption$DateTime <- as.POSIXct(paste(power_consumption$Date, power_consumption$Time), 
                                         format="%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2))
plot(power_consumption$DateTime, power_consumption$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

plot(power_consumption$DateTime, power_consumption$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(power_consumption$DateTime, power_consumption$Sub_metering_2, type = "l", col = "red")
lines(power_consumption$DateTime, power_consumption$Sub_metering_3, type = "l", col = "blue")

legend("topright", pch="-", col = c("black", "red", "blue"), inset = 0.01,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, box.lty = 0)
plot(power_consumption$DateTime, power_consumption$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(power_consumption$DateTime, power_consumption$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.off()