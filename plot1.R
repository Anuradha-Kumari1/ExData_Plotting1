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

#Plotting Data
hist(data2[,"Global_active_power"], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Copy in PNG format
dev.copy(png, file = "plot1.png")
dev.off()
