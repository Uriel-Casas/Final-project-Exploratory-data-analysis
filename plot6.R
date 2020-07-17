#Data is obtained
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == “06037”). Which city has seen greater changes over time in motor vehicle emissions?
#library to use
library(dplyr)
library(ggplot2)
#We prepare the data
MBLA <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
MBLAGG <- aggregate(Emissions ~ year + fips, MBLA, sum)
#graph
ggplot(MBLAGG, aes(year, Emissions, col = fips)) + geom_line() + geom_point( shape = 21, color = "black", fill="#69b3a2", size=2) + ggtitle("Baltimore and Los Angeles" ~ PM[2.5] ~ "Emissions by Year and type") +       scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) 
dev.copy(png,"plot6.png", width=480, height=480)
dev.off()
