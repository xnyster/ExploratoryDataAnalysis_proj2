# Plot 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


# The data for this assignment are available from the course web site as a single zip file:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
# This code assumes that the data files have been extracted into the working folder


# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Get data for the plot by summing up emission levels by year
plot1data <- aggregate(NEI$Emissions, list(NEI$year), sum)


# Plot required graph and save as a png file
png("plot1.png")
plot(plot1data, type = "l", main = "Total PM2.5 Emissions Across the Years", xlab = "Year", ylab = "Emissions", xaxt = "n")
axis (1, at = c(1999, 2002, 2005, 2008))
dev.off()





