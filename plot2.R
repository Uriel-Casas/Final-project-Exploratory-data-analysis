#Data is obtained
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
#library to use
library(dplyr)
#we filter the information from baltimore, maryland
BNEI <- filter(NEI, fips == 24510)
#we create a table with the indicated years
BNEI2 <- tapply(BNEI$Emissions, BNEI$year, sum)
#graph
plot(names(BNEI2), BNEI2, type = "l", xlab = "Year", ylab = "Emissions", col = topo.colors(10), main = expression("Total US" ~ PM[2.5] ~ "Emissions by Year"))
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
