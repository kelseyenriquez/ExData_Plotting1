mydata <- read.table("household_power_consumption.txt", header = T, sep = ';')
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
subsetdata <- subset(mydata, mydata$Date >= as.Date("2007-02-01", "%Y-%m-%d") & mydata$Date <= as.Date("2007-02-02", "%Y-%m-%d"))
subsetdata$Time <- strptime(subsetdata$Time, "%T")
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)
png(filename = "plot1.png")
hist(subsetdata$Global_active_power/1000*2, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()


