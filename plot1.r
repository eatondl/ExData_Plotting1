## Set Working Directory
setwd("C:\\Users\\Davide\\Documents\\power")

opar=par(ps=12)

## Read Power File
power <- read.table(file="household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Convert Date and Time Field
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power$Time <- strptime(power$Time, format="%H:%M:%S")

## Subset Data for Feb 1 and 2 2007
power_subset <- subset(power, (power$Date=="2007-02-01" | power$Date=="2007-02-02" ))

## Create Plot 1 - histogram
## Write output to plot1.png
png('plot1.png', width=480, height=480)
hist(power_subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


