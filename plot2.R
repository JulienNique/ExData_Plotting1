library(readr)
library(dplyr)
library(lubridate)

## Get the data from the working directory
hpc <- read_delim("./household_power_consumption.txt", delim = ";", na = "?", col_types = "ctnnnnnnn")
hpc <- mutate(hpc, Date = dmy(Date))
data <- filter(hpc, Date %in% c(dmy("01022007"), dmy("02022007")))
data <- mutate(data, Date_time = ymd_hms(paste(Date, Time)))

## Plot into the screen device
par(mfrow = c(1,1))
with(data, plot(Global_active_power ~ Date_time, type = "l", main = "", xlab = "",
                ylab = "Global Active Power (kilowatts)"))

## Copy the screen device to a png file
dev.copy(device = png, file = "plot2.png")
dev.off()