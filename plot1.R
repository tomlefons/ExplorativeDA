# Peer Assessments
# Course Project 1
# Code to create the first plot (Histogram of Global Active Power)

# Current work directory contains data file 'household_power_consumption.txt'
# Load data file using data from the dates 2007-02-01 and 2007-02-02
df<-read.table("household_power_consumption.txt", sep=";", skip=66637,
	nrow=2880,na.strings='?')
names(df)<-strsplit(readLines("household_power_consumption.txt",n=1),";")[[1]]

# Create column DT using POSIXct
df$DT <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

# Create histogram
hist(as.numeric(df$Global_active_power), col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

# Save plot to a png file
dev.copy(png,"plot1.png",units="px",height=480,width=480,bg="white")
# white background was chosen for better visibility 
# on github instead of  bg = "transparent" 
dev.off()
