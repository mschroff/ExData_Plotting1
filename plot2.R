# set working directory
setwd("D:/todo/R/4 Exploratory Data Analysis/dataset/exdata_data_household_power_consumption")

# load date
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

# convert into numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
# add datetime
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# plot diagram
png("plot2.png", width=480, height=480) 
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off()