# This script will plot the first plot in the Peer Reviewed Assignment for Week 1 of Exploratory Data Analysis

# First we need to download the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")

# Next we need to unzip this file
unzip("data.zip")

# Finally load the data into R
energyConsumptionData<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Now convert the date column into the datetime format
energyConsumptionData$Date <- as.Date(energyConsumptionData$Date, format="%d/%m/%Y")

# Subset the data to the desired dates
dataSubset <- subset(energyConsumptionData, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

# Now create the Plot1.png file
png("Plot1.png",width=480,height=480) # Note that 480 is the default value for the height/width parameters

# Plot the desired Histogram
hist(dataSubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Close the graphical device
graphics.off() 