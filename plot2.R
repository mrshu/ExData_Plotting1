power_consumption_all <- read.table("./household_power_consumption.txt", 
                                    na.strings = c("?", ""), 
                                    sep=";", 
                                    header=TRUE)

power_consumption <- subset(power_consumption_all, Date %in% c("1/2/2007", "2/2/2007"))

power_consumption$DateTime <- as.POSIXct(paste(power_consumption$Date, power_consumption$Time), 
                                         format="%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480)

plot(power_consumption$DateTime, power_consumption$Global_active_power, xlab = "", type = "l",
     ylab = "Global Active Power (kilowatts)")
dev.off()