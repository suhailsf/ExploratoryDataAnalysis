#Import Data
household_power_consumption <- read.csv("~/Desktop/household_power_consumption.txt", sep=";",colClasses="character")
data <- household_power_consumption

#Transform Data Column
household_power_consumption[,1] <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

#Subset required data
data1 <- subset(household_power_consumption, household_power_consumption$Date %in% as.Date(c("2007-02-01","2007-02-02")))

#Tansform data and time
data1$DateTime <- strptime(paste(data1$Date,data1$Time), format = "%Y-%m-%d %H:%M:%S")

#Transform Global Active Power column from factor to numeric
data1[,7] <- as.numeric(data1[,7])
data1[,8] <- as.numeric(data1[,8])
data1[,9] <- as.numeric(data1[,9])

#Plot
plot(data1$DateTime, data1$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
lines(data1[,10],data1[,8], col = "red")
lines(data1[,10],data1[,9],col = "blue")
legend("topright", col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

#Export Image
dev.copy(png, file="plot3.png",width = 480, height = 480)
dev.off()