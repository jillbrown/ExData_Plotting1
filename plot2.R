housepower <- read.table("./household_power_consumption.txt", sep=";", skip=66637, nrow=2880)

househead <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colnames(housepower) <- househead

housepower$Time2 <- strptime(housepower$Time, format = "%H:%M:%S")
housepower$Date2 <- strptime(housepower$Date, format = "%d/%m/%Y")
Timedate <- strptime(paste(housepower$Date, housepower$Time), "%d/%m/%Y %H:%M:%S")
housepower$Timedate <- as.POSIXct(Timedate)

#plot2
png(file="plot2.png", width=480,height=480)
par(mfrow=c(1,1))
plot(housepower$Timedate, housepower$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()