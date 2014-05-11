mydata <- read.table("household_power_consumption.txt", header = T, sep = ';')
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
subsetdata <- subset(mydata, mydata$Date >= as.Date("2007-02-01", "%Y-%m-%d") & mydata$Date <= as.Date("2007-02-02", "%Y-%m-%d"))
subsetdata$Datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), format="%Y-%m-%d %T")
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)
png(filename ="plot2.png")
plot(subsetdata$Datetime, subsetdata$Global_active_power/1000*2, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()


