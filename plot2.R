# Plot 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.


# The data for this assignment are available from the course web site as a single zip file:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
# This code assumes that the data files have been extracted into the working folder


# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Extract data from Baltimore City, Maryland (fips == "24510")
NEIplot2 <- NEI[NEI$fips == "24510",]

# Get data for the plot by summing up emission levels by year
plot2data <- aggregate(NEIplot2$Emissions, list(NEIplot2$year), sum)


# Plot required graph and save as a png file
png("plot2.png")
par(las = 1)
plot(plot2data, type = "l", main = "PM2.5 Emissions in Baltimore City, Maryland", xlab = "Year", ylab = "Emissions", xaxt = "n")
axis (1, at = c(1999, 2002, 2005, 2008))
dev.off()

