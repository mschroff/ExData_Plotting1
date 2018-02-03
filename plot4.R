# set working directory
setwd("D:/todo/R/4 Exploratory Data Analysis/dataset/exdata_data_household_power_consumption")

# load date
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

# convert into numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
# add datetime
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# base frame
png("plot4.png", width=480, height=480) 
par(mfcol = c(2,2))

# 1. diagram 
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

# 2. diagram
plot(data$datetime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering") 
points(data$datetime, data$Sub_metering_1, type="l")
points(data$datetime, data$Sub_metering_2, col="red", type="l")
points(data$datetime, data$Sub_metering_3, col="blue", type="l")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,lwd=1)

# 3. diagram 
plot(data$datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage") 

# 4. diagram 
plot(data$datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 

dev.off()