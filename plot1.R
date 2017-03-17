data <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- subset(data,Date>="2007-02-01" & Date <="2007-02-02")

data$Global_active_power <- as.numeric(data$Global_active_power)
hist(x=data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

