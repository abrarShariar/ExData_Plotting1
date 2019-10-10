data <- read.table("dataset/household_power_consumption.txt", sep=";", header=TRUE)
data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")
sub_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
# convert factor to numeric
sub_meter_1 <- as.numeric(as.character(sub_data$Sub_metering_1))
sub_meter_2 <- as.numeric(as.character(sub_data$Sub_metering_2))
sub_meter_3 <- as.numeric(as.character(sub_data$Sub_metering_3))

png(file = "plot3.png")
# overlay 
collist <- c("black", "red", "blue")
barplot(sub_meter_1, ylim=c(0,40), border="black", ylab="Energy sub metering")
par(new = T)
barplot(sub_meter_2, ylim=c(0,40), border ="red")
par(new = T)
barplot(sub_meter_3, ylim=c(0,40), border ="blue")
# add axis and labels
axis(side=1, at=c(1,length(sub_meter_1)/2, length(sub_meter_1)), tick=TRUE, labels=c("Thu","Fri", "Sat"))

# legends
opar = par(oma = c(0,0,0,0), mar = c(0,0,0,0), new = TRUE)
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), y.intersp = 2, col=collist,lty=1, yjust = 0)
par(opar)
# Reset par

dev.off()

