#Data is obtained
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
#library to use
library(dplyr)
library(ggplot2)
#We prepare the data
SC1 <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEICC1 <- NEI[NEI$SCC %in% SC1$SCC,]
SN1 <- aggregate(Emissions ~ year + type, NEICC1, sum)
#graph
ggplot(SN1, aes(year, Emissions, col = type)) + geom_line() + geom_point( shape = 21, color = "black", fill="#69b3a2", size=2) + ggtitle("Coal combustion total US" ~ PM[2.5] ~ "Emissions by Year and type")
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
