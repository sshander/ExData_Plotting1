graphics <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")
graphics$Date <- as.Date(graphics$Date,format="%d/%m/%Y")
gphics <- graphics[graphics$Date >= "2007-02-01" & graphics$Date <= "2007-02-02",]

gphics$DateTime <-as.POSIXct(paste(gphics$Date, gphics$Time), format="%Y-%m-%d %H:%M:%S")
par(mar=c(2.1,4.1,2.1,2.1))
plot(gphics$DateTime, gphics$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file = "plot2.png")
dev.off()
