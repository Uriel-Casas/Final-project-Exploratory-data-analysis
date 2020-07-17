#Data is obtained
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#library to use
library(dplyr)
#we check for years other than 1999, 2002, 2005, and 2008
filter(NEI, year != 1999 & year != 2002 & year != 2005 & year != 2008)
#we create a table with the indicated years
NEI1 <- tapply(NEI$Emissions, NEI$year, sum)
#graph
plot(names(NEI1), NEI1, type = "l", xlab = "Year", ylab = "Emissions", col = topo.colors(10), main = expression("Total US" ~ PM[2.5] ~ "Emissions by Year"))
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
