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

## Create plot 2 -- write to png file
png('plot2.png', width=480, height=480)
plot(power_subset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l", xaxt="n")
axis(1, at=c(1,nrow(power_subset)/2,nrow(power_subset)),labels=c("Thu","Fri","Sat"))
dev.off()
