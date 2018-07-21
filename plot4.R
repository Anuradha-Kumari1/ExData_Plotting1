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
png("plot4.png", width=480, height=480)

#Dividing the screen into 4 parts
par(mfrow = c(2,2), mar = c(4,3.8,2,0.5))

#Plotting the 1st plot
with(data2, plot(fulltime, Global_active_power, type ="l", 
                 ylab = "Global Active Power (kilowatts)", xlab = "Day"))

#Plotting the 2nd plot
with(data2, plot(fulltime, Voltage, type ="l", ylab = "Voltage", xlab = "Day"))

#Plotting the 3rd plot
with(data2, plot(fulltime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "Day"))
with(data2, lines(fulltime, Sub_metering_2, col = "red"))
with(data2, lines(fulltime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plotting the 4th plot
with(data2, plot(fulltime, Global_reactive_power, type ="l", 
                 ylab = "Global Reactive Power (kilowatts)", xlab = "Day"))

# Close the device
dev.off()
