data <- read.table("dataset/household_power_consumption.txt", sep=";", header=TRUE)
data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")
sub_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

# for taking decimal places when converting with as.numeric
options(digits=9)
png(file = "plot1.png")
hist(as.numeric(as.character(sub_data$Global_active_power)),xlab = "Global Active Power (killowatts)",ylab="Frequency", col="red", main="Global Active Power")
dev.off()


