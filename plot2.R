# Peer Assessments
# Course Project 1
# Code to create the second plot

# Current work directory contains data file 'household_power_consumption.txt'
# Load data file using data from the dates 2007-02-01 and 2007-02-02
df<-read.table("household_power_consumption.txt", sep=";", skip=66637,
	nrow=2880,na.strings='?')
names(df)<-strsplit(readLines("household_power_consumption.txt",n=1),";")[[1]]

# Create column DT using POSIXct and set English weekdays
df$DT <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

# Create plot
plot(df$DT, as.numeric(df$Global_active_power), 
     type="l", xlab="",
     ylab = "Global Active Power (kilowatts)"
     )

# Save plot to a png file
dev.copy(png,"plot2.png",units="px",height=480,width=480)
dev.off()

