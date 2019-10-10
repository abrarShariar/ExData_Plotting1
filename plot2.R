data <- read.table("dataset/household_power_consumption.txt", sep=";", header=TRUE)
data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")
sub_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

global_active_power <- as.numeric(as.character(sub_data$Global_active_power))
# plotting and adding axis stuffs
png(file = "plot2.png")

mp <- barplot(global_active_power, axes=F, ylim=c(0,7), ylab="Global Active Power (kilowatts)")
axis(side=2, seq(from=0,to=10,by=2))
axis(side=1, at=c(1,length(global_active_power)/2, length(global_active_power)), tick=TRUE, labels=c("Thu","Fri", "Sat"))

dev.off()
