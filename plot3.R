graphics <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")
graphics$Date <- as.Date(graphics$Date,format="%d/%m/%Y")
gphics <- graphics[graphics$Date >= "2007-02-01" & graphics$Date <= "2007-02-02",]

gphics$DateTime <-as.POSIXct(paste(gphics$Date, gphics$Time), format="%Y-%m-%d %H:%M:%S")
par(mar=c(2.1,4.1,2.1,2.1))
windows()
with(gphics, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(gphics, lines(DateTime, Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", col="red"))
with(gphics, lines(DateTime, Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.9)

dev.copy(png, file = "plot3.png")
dev.off()
