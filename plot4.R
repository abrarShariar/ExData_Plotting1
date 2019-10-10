



data <- read.table("dataset/household_power_consumption.txt", sep=";", header=TRUE)
data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")
sub_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

png(file = "plot4.png")
par(mfrow=c(2,2))
#top-left graph
global_active_power <- as.numeric(as.character(sub_data$Global_active_power))
barplot(global_active_power, axes=F, ylim=c(0,7), ylab="Global Active Power")
axis(side=2, seq(from=0,to=10,by=2))
axis(side=1, at=c(1,length(global_active_power)/2, length(global_active_power)), tick=TRUE, labels=c("Thu","Fri", "Sat"))

# par(bg="white")
# top-right graph
# red <- rgb(0, 0, 0, alpha=0.1)
voltage <- as.numeric(as.character(sub_data$Voltage))
barplot(voltage, axes=F, ylim=c(230,250), ylab="Voltage", xlab="datetime", xpd=FALSE)
axis(side=2, seq(from=230,to=250,by=4))
axis(side=1, at=c(1,length(voltage)/2, length(voltage)), tick=TRUE, labels=c("Thu","Fri", "Sat"))


# bottom left graph
# convert factor to numeric
sub_meter_1 <- as.numeric(as.character(sub_data$Sub_metering_1))
sub_meter_2 <- as.numeric(as.character(sub_data$Sub_metering_2))
sub_meter_3 <- as.numeric(as.character(sub_data$Sub_metering_3))
collist <- c("black", "red", "blue")
barplot(sub_meter_1, ylim=c(0,40), border="black", ylab="Energy sub metering")
par(new = T)
barplot(sub_meter_2, ylim=c(0,40), border ="red")
par(new = T)
barplot(sub_meter_3, ylim=c(0,40), border ="blue")
# add axis and labels
axis(side=1, at=c(1,length(sub_meter_1)/2, length(sub_meter_1)), tick=TRUE, labels=c("Thu","Fri", "Sat"))

# legends
#opar = par(oma = c(0,0,2,10), mar = c(0,0,0,0), new = TRUE)
#legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), y.intersp = 2, col=collist,lty=1, yjust = 0)

#par(opar)

#bottom right graph
reactive_power <- as.numeric(as.character(sub_data$Global_reactive_power))
barplot(reactive_power, axes=F, ylim=c(0.0,0.5), ylab="Global_reactive_power", xlab="datetime")
axis(side=2, seq(from=0.0,to=0.5,by=0.1))
axis(side=1, at=c(1,length(reactive_power)/2, length(reactive_power)), tick=TRUE, labels=c("Thu","Fri", "Sat"))

dev.off()

