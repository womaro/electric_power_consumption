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

introdata$Global_active_power <- as.double(introdata$Global_active_power)

introdata$Date <- as.Date(introdata$Date, "%d/%m/%Y")

introdata <- subset(introdata, Date == "2007-02-01" | Date == "2007-02-02")

hist(introdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main =  "Global Active Power")

dev.copy(png, file = "plot1.PNG")
dev.off()