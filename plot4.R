# 4 - Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(dplyr)
library(ggplot2)

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

isCoalCombustion <- grepl("*Coal", SCC$EI.Sector)
coalSources <- SCC[isCoalCombustion, ]

emissions <- NEI[(NEI$SCC %in% coalSources$SCC), ]

total <- aggregate(Emissions ~ year, data = emissions, FUN = sum)

png("plot4.png")

ggplot(data = total, aes(x = year, y = as.numeric(Emissions))) +
  geom_point() +
  geom_smooth() +
  xlab("Year") +
  ylab("Total emissions (tons)") +
  ggtitle("Total emissions in the USA from coal combustion")

dev.off()
