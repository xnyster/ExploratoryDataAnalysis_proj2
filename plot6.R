# Plot 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?


# The data for this assignment are available from the course web site as a single zip file:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
# This code assumes that the data files have been extracted into the working folder


# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Load required package
library(ggplot2)


# Determine SCC code for sources related to motor vehicles
indices <- grep("Vehicles", SCC$EI.Sector)
codes <- unique(SCC[indices,1])

# Extract relevant data
NEI_motor <- NEI[NEI$SCC %in% codes & NEI$fips %in% c("24510", "06037"),]

# Get data for the plot by summing up emission levels by year
plot6data <- aggregate(NEI_motor$Emissions, list(NEI_motor$year, NEI_motor$fips), sum)
names(plot6data) <- c("Year", "City", "Emissions")


# Plot required graph and save as a png file
png("plot6.png")
plot6 <- ggplot(data = plot6data, aes(x = Year, y = Emissions, colour = City)) + geom_line() + ggtitle("Emissions from Motor Vehicle Sources\nfor Baltimore City and Los Angeles County") + scale_colour_manual(labels = c("Los Angeles County", "Baltimore City"), values = c("blue", "red"))
print(plot6)
dev.off()
