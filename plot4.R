#Loading data
pcb <- read.table("../data/household_power_consumption.txt", head=TRUE, sep =";", na.string="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#Subsetting
pcb <- subset(pcb, Date=="1/2/2007"| Date=="2/2/2007")

pcb$datetime <- paste(pcb$Date,pcb$Time)
pcb$datetime <- strptime(pcb$datetime, "%d/%m/%Y %H:%M:%S")
png("plot4.png", width = 480, height = 480, unit = "px", bg = "transparent")
#Creating plot device
par(mfrow=c(2,2))
with(pcb, {
  #Left upper
  plot(datetime, Global_active_power, type="l",ann=FALSE)
  title(ylab="Global Active Power")
  #Right upper
  plot(datetime, Voltage, type="l",ylab="Voltage")
  #Left lower 
  plot(pcb$datetime, pcb$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(pcb$datetime, pcb$Sub_metering_2, col="red")
  lines(pcb$datetime, pcb$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
  #Right lower
  plot(datetime, Global_reactive_power, type="l",ylab="Global_reactive_power")
})
dev.off()