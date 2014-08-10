graphics <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")
graphics$Date <- as.Date(graphics$Date,format="%d/%m/%Y")
gphics <- graphics[graphics$Date >= "2007-02-01" & graphics$Date <= "2007-02-02",]

gphics$DateTime <-as.POSIXct(paste(gphics$Date, gphics$Time), format="%Y-%m-%d %H:%M:%S")
gphics$Voltage <-as.numeric(gphics$Voltage)
par(mfrow = c(2,2))
par(mar =c(4,4,2,1))

plot(gphics$DateTime, gphics$Global_active_power, type="l", ylab="Global Active Power", xlab="")

with(gphics, plot(DateTime, Voltage, type="l", xlab="dateframe", ylab="Voltage"))


with(gphics, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(gphics, lines(DateTime, Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", col="red"))
with(gphics, lines(DateTime, Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", col="blue"))
legend(1170398890, 38, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5, bty="n")

with(gphics, plot(DateTime, Global_reactive_power, type="l", xlab="dateframe", ylab="Global_reactive_power"))
dev.copy(png, file = "plot4.png")
dev.off()

