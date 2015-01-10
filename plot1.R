power_consumption_all <- read.table("./household_power_consumption.txt", 
                                    na.strings = c("?", ""), 
                                    sep=";", 
                                    header=TRUE)

power_consumption <- subset(power_consumption_all, Date %in% c("1/2/2007", "2/2/2007"))

png(file = "plot1.png", width = 480, height = 480)

hist(power_consumption$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     ylim=c(0, 1200)
)
dev.off()