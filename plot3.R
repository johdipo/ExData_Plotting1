# Reading the data
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
data <- read.table(file = "household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

#Formatting the data
data$TimeDate <- as.POSIXct(paste(data$Date, " ", data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Filtering and subtetting the data
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Constructing the plot
par(mfrow = c(1,1),  pin = c(5,5)) ##Setting a squared plot
with(data, plot(x = TimeDate, y = Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")) ##Initiating the graph and plotting first group
with(data, points(y = Sub_metering_2, x = TimeDate, type = "line", col = "red")) ##Adding second group
with(data, points(y = Sub_metering_3, x = TimeDate, type = "line", col = "blue")) ##Adding third group
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1, ncol = 1.1) ##Adding the legend

#Exporting the plot
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()