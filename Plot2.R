
## Objective is to plot a line graph of Global Active Power from household_power_consumption file on the
## y-axis, and time (weekdays) on the x-axis.
## 1. Read in data "household_power_consumption.txt" and view high level summary of the data set.
rawdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";"
                   , na.strings = "?")
head(rawdata)
summary(rawdata)
names(rawdata)
class(rawdata$Date)

## 2. Convert data$Date as date
rawdata$Date <- as.Date(as.character(rawdata$Date), format = "%d/%m/%Y")
class(rawdata$Date)

head(rawdata)

## 3. Subset data to only contain 2007-02-01 and 2007-02-02 and save as dataFeb
dataFeb <- subset(rawdata, rawdata$Date >= "2007-02-01" & rawdata$Date <= "2007-02-02")

dataFeb$Time <- as.POSIXct(as.character(paste(dataFeb$Date, dataFeb$Time, sep = " "))) ## convert to proper Time format


## 4. Plot the line graph of Global Active Power on screen, then copy it to png.
plot(dataFeb$Time, dataFeb$Global_active_power, type="l"
     ,xlab=""
     ,ylab="Global Active Power (kilowatts)"
     ,main="") 

dev.copy(png,'Rplot2.png') ## Returns plot in working directory as a png file.
dev.off()

## 5. Reset for the next plot
dev.off() ## redoing current plot requires to shut off graphing device and reset
dev.set(2) ## resetting device after setting it off, may need to run it a few times.
dev.off()
