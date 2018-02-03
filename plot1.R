# set working directory
setwd("D:/todo/R/4 Exploratory Data Analysis/dataset/exdata_data_household_power_consumption")

# load date
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

# convert into numeric
globalActivePower <- as.numeric(data$Global_active_power) 

# plot histogram
png("plot1.png", width=480, height=480) 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off()