#Reading the data
data <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", 
                   header = TRUE)
data2 <- data

#Formatting date and time columns
data2$Date <- dmy(data2$Date)
data2 <- data[data2$Date == "2007-02-01"| data2$Date == "2007-02-02",]
fulltime <- dmy_hms(paste(data2$Date, data2$Time, sep =" "))
data2$Time <- hms(data2$Time)
data2 <- cbind(data2, fulltime)

# Initialize the device
png("plot3.png", width=480, height=480)

#Plotting data
with(data2, plot(fulltime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "Day"))
with(data2, lines(fulltime, Sub_metering_2, col = "red"))
with(data2, lines(fulltime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()
