# Coursera Data Science Specialization
# Course 4: Exploratory data analysis
# Week 1 assignment - plot3.R
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
png(filename = "plot3.png", width = 480, height = 480)

# Plot range to initialize figure
xrange <- range(hpc$DateTime)
yrange <- with(hpc, range(Sub_metering_1, Sub_metering_2, Sub_metering_3))

# Initialize plot and add y-label
plot(xrange, yrange, type = "n", xlab = "", ylab = "Energy sub metering")

# Add points for each series
points(hpc$DateTime, hpc$Sub_metering_1, type = "l", col = "black")
points(hpc$DateTime, hpc$Sub_metering_2, type = "l", col = "red")
points(hpc$DateTime, hpc$Sub_metering_3, type = "l", col = "blue")

# Add legend
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close PNG device
dev.off()
