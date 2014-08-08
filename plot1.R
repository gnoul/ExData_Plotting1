#Loading data
pcb <- read.table("../data/household_power_consumption.txt", head=TRUE, sep =";", na.string="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#Subsetting
pcb <- subset(pcb, Date=="1/2/2007"| Date=="2/2/2007")
gp <- pcb$Global_active_power
#Create Plot
png("plot1.png", width = 480, height = 480, unit = "px", bg = "transparent")
hist(gp, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
