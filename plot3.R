#Data is obtained
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question. library(ggplot2)
#library to use
library(dplyr)
library(ggplot2)
#we filter the information from baltimore, maryland
BNEI <- filter(NEI, fips == 24510)
#We create a data frame that summarizes the information for each year and each type
BNEIT <- aggregate(Emissions ~ year + type, BNEI, sum)
#graph
ggplot(BNEIT, aes(year, Emissions, col = type)) + geom_line() + geom_point( shape = 21, color = "black", fill="#69b3a2", size=2) + ggtitle("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year and type")
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
