# Coursera Data Science Specialization
# Course 4: Exploratory data analysis
# Week 1 assignment - plot1.R
# 2016-01-29

library(lubridate)

# Read data file, mind header, separator and "NA"
hpc_dfr <- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Convert combined date, time strings to POSIXct and add column to data frame
hpc_dfr$DateTime <- dmy_hms(paste(hpc_dfr$Date, hpc_dfr$Time))

# Time interval
datInt <- interval(ymd("2007-02-01"), ymd("2007-02-03"))

# Subsetting data for plotting
hpc <- hpc_dfr[hpc_dfr$DateTime %within% datInt, ]

# Initialize PNG device, 480x480 pixels
png(filename = "plot1.png", width = 480, height = 480)

# Plot histogram
hist(hpc$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close PNG device
dev.off()
