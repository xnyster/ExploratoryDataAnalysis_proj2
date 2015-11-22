# Plot 5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 


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
NEI_motor <- NEI[NEI$SCC %in% codes & NEI$fips == "24510",]

# Get data for the plot by summing up emission levels by year
plot5data <- aggregate(NEI_motor$Emissions, list(NEI_motor$year), sum)
names(plot5data) <- c("Year", "Emissions")


# Plot required graph and save as a png file
png("plot5.png")
plot5 <- ggplot(data = plot5data, aes(x = Year, y = Emissions)) + geom_line() + ggtitle("Emissions from Motor Vehicle Sources in Baltimore City")
print(plot5)
dev.off()
