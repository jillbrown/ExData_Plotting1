housepower <- read.table("./household_power_consumption.txt", sep=";", skip=66637, nrow=2880)

househead <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colnames(housepower) <- househead

#plot1
png(file="plot1.png", width=480,height=480)
hist(housepower$Global_active_power, col="red", ylim=c(0,1200), main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()