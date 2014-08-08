#Loading data
pcb <- read.table("./data/household_power_consumption.txt", head=TRUE, sep =";", na.string="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#Subsetting
pcb <- subset(pcb, Date=="1/2/2007"| Date=="2/2/2007")
pcb$datetime <- paste(pcb$Date,pcb$Time)
pcb$datetime <- strptime(pcb$datetime, "%d/%m/%Y %H:%M:%S")
#Creating plot device
png("plot3.png", width = 480, height = 480, unit = "px", bg = "transparent")
#Draw plot
plot(pcb$datetime, pcb$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(pcb$datetime, pcb$Sub_metering_2, col="red")
lines(pcb$datetime, pcb$Sub_metering_3, col="blue")
#Add legend
legend("topright", col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
dev.off()