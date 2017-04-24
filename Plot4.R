## Objective is to plot 4 graphs in a 2 by 2 matrix format 
## Plot1: y = Global_active_power, x = Time
## Plot2: y = Voltage, x = Time
## Plot3: y = ub_metering_1, 2, 3, x = Time
## Plot4: y = Global_reactive_power, x = Time


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


## 4a. Plot the line graph of Global Active Power on screen
par(mfrow=c(2,2))

plot(dataFeb$Time, dataFeb$Global_active_power, type="l"
     ,xlab=""
     ,ylab="Global Active Power (kilowatts)"
     ,main="") 

## 4b. Plot the line graph of Voltage on screen
plot(dataFeb$Time, dataFeb$Voltage, type="l"
     ,xlab="datetime"
     ,ylab="Voltage"
     ,main="") 

## 4c. Plot the lines of Sub_metering_1,2,3 on screen
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

legend(as.POSIXct("2007-02-02 12:00:00"), 40
       ,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,col=c("black","red","blue")
       ,cex=0.45
)


## 4d. Plot the lines of GLobal_reactive_power on screen, then copy it to png.
plot(dataFeb$Time, dataFeb$Global_reactive_power, type="l"
     ,xlab="datetime"
     ,ylab="Global_reactive_power"
     ,main="") 


dev.copy(png,'Rplot4.png') ## Returns plot in working directory as a png file.
dev.off()

## 5. Reset for the next plot
dev.off() ## redoing current plot requires to shut off graphing device and reset
dev.set(2) ## resetting device after setting it off, may need to run it a few times.
dev.off()
