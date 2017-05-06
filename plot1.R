library(readr)
library(dplyr)
library(lubridate)

## Get the data from the working directory
hpc <- read_delim("./household_power_consumption.txt", delim = ";", na = "?", col_types = "ctnnnnnnn")
hpc <- mutate(hpc, Date = dmy(Date))
data <- filter(hpc, Date %in% c(dmy("01022007"), dmy("02022007")))

## Plot into the screen device
par(mfrow = c(1,1))
with(data, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", 
                main = "Global Active Power", col = "red"))

## Copy the screen device to a png file
dev.copy(device = png, file = "plot1.png")
dev.off()