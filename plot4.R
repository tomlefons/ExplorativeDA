# Peer Assessments
# Course Project 1
# Code to create the fourth plot

# Current work directory contains data file 'household_power_consumption.txt'
# Load data file using data from the dates 2007-02-01 and 2007-02-02
df<-read.table("household_power_consumption.txt", sep=";", skip=66637,
	nrow=2880,na.strings='?')
names(df)<-strsplit(readLines("household_power_consumption.txt",n=1),";")[[1]]

# Create column DT using POSIXct and set English weekdays
df$DT <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

# Create plot
par(mfrow=c(2,2))
par(mar=c(4.5, 4.5, 0.5, 0.5))

plot(df$DT, as.numeric(df$Global_active_power), 
     type="l", xlab="", ylab = "Global Active Power (kilowatts)"
     )

plot(df$DT, as.numeric(df$Voltage), 
     type="l", ylab = "Voltage", xlab = "datetime")

with (df,{plot(DT, Sub_metering_1, type="l",
	ylab = "Energy sub metering",	xlab ="")
	lines(DT, Sub_metering_2, col="red")
	lines(DT, Sub_metering_3, col="blue")})
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	lwd=1,  col=c('black','red','blue'))

plot(df$DT, as.numeric(df$Global_reactive_power), type="l",
     ylab = "Global_reactive_power", xlab = "datetime")

# Save plot to a png file
dev.copy(png,"plot4.png",units="px",height=480,width=480)
dev.off()

