#Loading data
pcb <- read.table("./data/household_power_consumption.txt", head=TRUE, sep =";", na.string="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#Subsetting
pcb <- subset(pcb, Date=="1/2/2007"| Date=="2/2/2007")
#Add date-time column
pcb$datetime <- paste(pcb$Date,pcb$Time)
pcb$datetime <- strptime(pcb$datetime, "%d/%m/%Y %H:%M:%S")
#Creating plot device
png("plot2.png", width = 480, height = 480, unit = "px", bg = "transparent")
#Draw plot
with(pcb, plot(datetime, Global_active_power, type="l",ann=FALSE))
#Add title
title(ylab="Global Active Power (kilowatts)")
dev.off()