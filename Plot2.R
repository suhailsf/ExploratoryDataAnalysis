#Import Data
household_power_consumption <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")
data <- household_power_consumption

household_power_consumption[,1] <- as.character(household_power_consumption[,1])
household_power_consumption[,2] <- as.character(household_power_consumption[,2])

#Transform Data Column
household_power_consumption[,1] <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

#Subset required data
data1 <- subset(household_power_consumption, household_power_consumption$Date %in% as.Date(c("2007-02-01","2007-02-02")))

#Tansform data and time
data1$DateTime <- strptime(paste(data1$Date,data1$Time), format = "%Y-%m-%d %H:%M:%S")

#Transform Global Active Power column from factor to numeric
data1[,3] <- as.numeric(as.character(data1[,3]))

#Plot
plot(data1$DateTime, data1$Global_active_power, type = "l", xlab ="", ylab = " Global Active Power (kilowatts)")

#Export Image
dev.copy(png, file="plot2.png",width = 480, height = 480)
dev.off()