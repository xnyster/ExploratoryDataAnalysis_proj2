# Plot 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?


# The data for this assignment are available from the course web site as a single zip file:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
# This code assumes that the data files have been extracted into the working folder


# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Load required package
library(ggplot2)


# Determine SCC code for sources related to coal combustion
indices <- grep("Coal", SCC$EI.Sector)
codes <- unique(SCC[indices,1])

# Extract relevant data
NEI_coal <- NEI[NEI$SCC %in% codes,]

# Get data for the plot by summing up emission levels by year
plot4data <- aggregate(NEI_coal$Emissions, list(NEI_coal$year), sum)
names(plot4data) <- c("Year", "Emissions")


# Plot required graph and save as a png file
png("plot4.png")
plot4 <- ggplot(data = plot4data, aes(x = Year, y = Emissions)) + geom_line() + ggtitle("Emissions from Coal Combustion-Related Sources")
print(plot4)
dev.off()

