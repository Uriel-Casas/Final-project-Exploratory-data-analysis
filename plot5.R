#Data is obtained
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
#library to use
library(dplyr)
library(ggplot2)
#We prepare the data
NEIBM <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
NEIBMF <- aggregate(Emissions ~ year, NEIBM, sum)
#graph
ggplot(NEIBMF, aes(year, Emissions)) + geom_line() + geom_point( shape = 21, color = "black", fill="#69b3a2", size=2) + ggtitle("BALTIMORE" ~ PM[2.5] ~ "Emissions by Year and type")
dev.copy(png,"plot5.png", width=480, height=480)
dev.off()
