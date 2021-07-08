library(utils)
library(data.table)
library(dplyr)

data_source <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data_dest <- paste(getwd(), "/exdata_data_household_power_consumption.zip", sep = "")

download.file(data_source, data_dest)

unzip(data_dest)

list.files(getwd())

dataloc <- paste(getwd(), "/household_power_consumption.txt", sep= "")

introdata <- fread(dataloc, sep=";")

head(introdata)

introdata$Global_active_power <- as.double(introdata$Global_active_power)

introdata <- subset(introdata, Date == "2007/02-01" | Date == "2007-02-02")

introdata$Date <- as.Date(introdata$Date, "%Y/%m/%d")

introdata$Date <- paste(introdata$Date, introdata$Time)



introdata$Date <- strptime(introdata$Date, format = "%Y/%m/%d %H:%M:%S")

introdata$Time <- strptime(introdata$Time, "%H:%M:%OS")

introdata$Time <- as.POSIXct(introdata$Time,format="%H:%M:%S")

class(introdata$Date)

plot(introdata$Date, introdata$Global_active_power)

par(mar = c(6,10,4,10))

