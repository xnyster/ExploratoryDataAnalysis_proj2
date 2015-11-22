# Plot 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.


# The data for this assignment are available from the course web site as a single zip file:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
# This code assumes that the data files have been extracted into the working folder


# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Load required package
library(ggplot2)


# Extract data from Baltimore City, Maryland (fips == "24510")
NEI_baltimore <- NEI[NEI$fips == "24510",]

# Get data for the plot by summing up emission levels by year and type
plot3data <- aggregate(NEI_baltimore$Emissions, by = list(NEI_baltimore$year, NEI_baltimore$type), sum)
names(plot3data) <- c("Year", "Type", "Emissions")


# Plot required graph and save as a png file
png("plot3.png")
plot3 <- ggplot(data = plot3data, aes(x = Year, y = Emissions, colour = Type)) + geom_line() + ggtitle("Emissions from Baltimore City by Type")
print(plot3)
dev.off()
