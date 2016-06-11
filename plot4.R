library(lattice)

housepower <- read.table("./household_power_consumption.txt", sep=";", skip=66637, nrow=2880)

househead <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colnames(housepower) <- househead

housepower$Time2 <- strptime(housepower$Time, format = "%H:%M:%S")
housepower$Date2 <- strptime(housepower$Date, format = "%d/%m/%Y")
Timedate <- strptime(paste(housepower$Date, housepower$Time), "%d/%m/%Y %H:%M:%S")
housepower$Timedate <- as.POSIXct(Timedate)

#plot4
png(file="plot4.png", width=480,height=480)

par(mfrow=c(2,2))

#panel1
plot(housepower$Timedate, housepower$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")

#panel2
plot(housepower$Timedate, housepower$Voltage, type="l", ylab="Voltage",xlab="datetime")

#panel3
plot(housepower$Timedate, housepower$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(housepower$Timedate, housepower$Sub_metering_2, col="red")
lines(housepower$Timedate, housepower$Sub_metering_3, col="blue")
legend(legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), "topright")

#panel4
plot(housepower$Timedate, housepower$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()