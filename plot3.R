power_consumption_all <- read.table("./household_power_consumption.txt", 
                                    na.strings = c("?", ""), 
                                    sep=";", 
                                    header=TRUE)

power_consumption <- subset(power_consumption_all, Date %in% c("1/2/2007", "2/2/2007"))

power_consumption$DateTime <- as.POSIXct(paste(power_consumption$Date, power_consumption$Time), 
                                         format="%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480)


plot(power_consumption$DateTime, power_consumption$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(power_consumption$DateTime, power_consumption$Sub_metering_2, type = "l", col = "red")
lines(power_consumption$DateTime, power_consumption$Sub_metering_3, type = "l", col = "blue")

legend("topright", pch="-", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.off()