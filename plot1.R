graphics <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")
graphics$Date <- as.Date(graphics$Date,format="%d/%m/%Y")
gphics <- graphics[graphics$Date >= "2007-02-01" & graphics$Date <= "2007-02-02",]

par(mar=c(5.1, 4.1, 4.1, 8.1))
hist(gphics$Global_active_power, ylim = c(0,1200), xlim = c(0,6), xlab="Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.copy(png, file = "plot1.png")
dev.off()

