# R code to create plot 2 

# Code to load and manipulate dataset 

setwd("C:/Users/Kedar/Desktop/Kedar/Coursera Courses/Exploratory Data Analysis/Week 1/exdata%2Fdata%2Fhousehold_power_consumption (1)")
mydata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
reform_data <- data.frame(Date = as.Date(mydata$Date,"%d/%m/%Y"),Time = mydata$Time, Global_active_power = as.numeric(mydata$Global_active_power), Global_reactive_power =  as.numeric(mydata$Global_reactive_power), Voltage = as.numeric(mydata$Voltage), Global_intensity = as.numeric(mydata$Global_intensity), Sub_metering_1 = as.numeric(mydata$Sub_metering_1), Sub_metering_2 = as.numeric(mydata$Sub_metering_2), Sub_metering_3 = as.numeric(mydata$Sub_metering_3))
data_use <- subset(reform_data, Date >= "2007-02-01" & Date <= "2007-02-02")
date_time <- paste(as.Date(data_use$Date), data_use$Time)
data_use$Date_time <- as.POSIXct(date_time)

# Code to create plot
plot(data_use$Date_time,data_use$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Code to create PNG
dev.copy(png, "plot2.png", height = 480, width = 480)

dev.off()