## Objective is to plot a histogram of Global Active Power from household_power_consumption file.
## 1. Read in data "household_power_consumption.txt" and view high level summary of the data set.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";"
                   , na.strings = "?")
head(data)
summary(data)
names(data)
class(data$Date)

## 2. Convert data$Date as date and data$Time as time
data$Date <- as.Date(as.character(data$Date), format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")

## 3. Subset data to only contain 2007-02-01 and 2007-02-02 and save as dataFeb
dataFeb <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

## 4. Plot the historgram of Global Active Power on screen, then copy it to png.
plot1.png <- hist(dataFeb$Global_active_power, main = "Global Active Power", col = "red"
                  ,xlab = "Global Active Power (kilowatts)") ## Returns plot on screeen

dev.copy(png,'Rplot1.png') ## Returns plot in working directory as a png file.
dev.off()

## 5. Reset for the next plot
dev.off() ## redoing current plot requires to shut off graphing device and reset
dev.set(2) ## resetting device after setting it off, may need to run it a few times.
dev.off()