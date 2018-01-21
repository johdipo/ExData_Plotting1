# Reading the data
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
data <- read.table(file = "household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")


#Formatting the data
data$Time <- strptime(data$Time, format = "%H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Filtering the data
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Constructing the plot
par(mfrow = c(1,1), pin = c(5,5)) ##Setting a squared plot
with(data, hist(Global_active_power, col = "red", 
                xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

#Exporting the plot
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()