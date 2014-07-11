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


## Create plot 3 -- write to png file
png('plot3.png', width=480, height=480)
plot(power_subset$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", xaxt="n")
lines(power_subset$Sub_metering_2, type="l", col=2)
lines(power_subset$Sub_metering_3, type="l", col=4)
axis(1, at=c(1,nrow(power_subset)/2,nrow(power_subset)),labels=c("Thu","Fri","Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c('black','blue','red'), lty=1, cex=1)
dev.off()

