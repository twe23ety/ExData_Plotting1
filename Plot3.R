## Objective is to plot 3-lines in one graph with weekday as the x-axis 
## y-axis as Sub_metering_1, colour black
## y-axis as Sub_metering_2, colour red
## y-axis as Sub_metering_3, colour blue
## y-axis labelled as "Energy sub metering"
## legend on top right corner

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


## 4. Plot the lines of Sub_metering_1,2,3 on screen, then copy it to png.
plot(dataFeb$Time, dataFeb$Sub_metering_1, type="l"
     ,xlab=""
     ,ylab="Energy sub metering"
     ,main="") 

lines(dataFeb$Time, dataFeb$Sub_metering_2, type="l"
     ,xlab=""
     ,ylab="Energy sub metering"
     ,main=""
     ,col="red") 

lines(dataFeb$Time, dataFeb$Sub_metering_3, type="l"
     ,xlab=""
     ,ylab="Energy sub metering"
     ,main=""
     ,col="blue") 

legend("topright"
       ,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,col=c("black","red","blue")
       )

dev.copy(png,'Rplot3.png') ## Returns plot in working directory as a png file.
dev.off()

## 5. Reset for the next plot
dev.off() ## redoing current plot requires to shut off graphing device and reset
dev.set(2) ## resetting device after setting it off, may need to run it a few times.
dev.off()
