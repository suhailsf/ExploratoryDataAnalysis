#Import Data
household_power_consumption <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")
data <- household_power_consumption

#Transform Data and Time Column
household_power_consumption[,1] <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption[,2] <- as.Date(household_power_consumption$Time,"%H/%M/%S")

#Subset required data
data1 <- subset(household_power_consumption, household_power_consumption$Date %in% as.Date(c("2007-02-01","2007-02-02")))

#Transform Global Active Power column from factor to numeric
data1[,3] <- as.numeric(as.character(data1[,3]))

#Create required histogram
hist(data1$Global_active_power, main = "Global Active Power", xlab =" Global Active Power (kilowatts)", col = "Red")

#Export Image
dev.copy(png, file="plot1.png",width = 480, height = 480)
dev.off()