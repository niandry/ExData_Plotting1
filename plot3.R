data <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data,Date>="2007-02-01" & Date <="2007-02-02")

data$Global_active_power <- as.numeric(data$Global_active_power)
data$x <- paste(data$Date,data$Time)
data$x <- strptime(data$x,"%Y-%m-%d %H:%M:%S")

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
plot(x=data$x, y=data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(x=data$x, y=data$Sub_metering_2, col="red")
lines(x=data$x, y=data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2.5,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),adj = c(0.09, 0.05),cex=0.5)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
