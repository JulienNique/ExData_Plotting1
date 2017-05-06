library(readr)
library(dplyr)
library(lubridate)

## Get the data from the working directory
hpc <- read_delim("./household_power_consumption.txt", delim = ";", na = "?", col_types = "ctnnnnnnn")
hpc <- mutate(hpc, Date = dmy(Date))
data <- filter(hpc, Date %in% c(dmy("01022007"), dmy("02022007")))

## Add the POSIXct variable "Date_time" used for plotting
data <- mutate(data, Date_time = ymd_hms(paste(Date, Time)))

## Plot the four graphics in the screen device
par(mfrow = c(2,2), mar = c(4,4,1,1))
with(data, plot(Global_active_power ~ Date_time, type = "l", main = "", xlab = "",
                ylab = "Global Active Power"))

with(data, plot(Voltage ~ Date_time, type = "l", main = "", xlab = "datetime",
                ylab = "Voltage"))

with(data, plot(Sub_metering_1 ~ Date_time, type = "l", main = "", xlab = "",
                ylab = "Energy sub metering"))
with(data,lines(Sub_metering_2 ~ Date_time, col = "red"))
with(data,lines(Sub_metering_3 ~ Date_time, col = "blue"))
legend("topright", lty = 1, col = c('black', 'blue', 'red'),
       bty = 'n', cex = 0.7,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

with(data, plot(Global_reactive_power ~ Date_time, type = "l", main = "",
                xlab = "datetime", ylab = "Global_reactive_power"))

## Copy the screen device to a png file
dev.copy(device = png, file = "plot4.png")
dev.off()