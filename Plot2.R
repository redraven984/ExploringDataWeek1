# This script will plot the second plot in the Peer Reviewed Assignment for Week 1 of Exploratory Data Analysis

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

# now combine the date and time to achieve the day on the x axis (as shown in the plot)
combinedTime <- paste(as.Date(data$Date), data$Time) # this results in a character vector

# now translate the character vector to a double vector for plotting
doubleTimeVect<- as.POSIXct(combinedTime)

# Now create the Plot1.png file
png("Plot2.png",width=480,height=480) # Note that 480 is the default value for the height/width parameters

# Plot the desired line plot
plot(doubleTimeVect,dataSubset$Global_active_power, ylab="Global Active Power (kilowatts)",xlab="", col="black",type="l") # specify type l to get a line plot

# Close the graphical device
graphics.off() 