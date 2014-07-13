#importing data
data <- read.table("household_power_consumption.txt",  header=TRUE, sep=";", quote = "", na.strings="?")
#formatting date and time variables
data$Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(data$Datetime, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#subsetting data to the days of 2007 Feb 1 and 2
subdata <- data[data$Date == "2007-02-01"|data$Date == "2007-02-02",]
#specifing output device
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")
#Setting locale time to English
Sys.setlocale("LC_TIME", "English")
# plotting data
plot(subdata$Datetime, subdata$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# writing out the plot file
dev.off()