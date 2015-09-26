# 6 - Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

library(dplyr)
library(ggplot2)

NEI <- readRDS("data/summarySCC_PM25.rds")

BaltimoreDf <- filter(NEI, fips == "24510" & type == "ON-ROAD")
BaltimoreDf$County <- "Baltimore City"

LosAngelesDf <- filter(NEI, fips == "06037" & type == "ON-ROAD")
LosAngelesDf$County <- "Los Angeles County"

MergedDf <- rbind(BaltimoreDf, LosAngelesDf)

total <- aggregate(MergedDf$Emissions, by = list(MergedDf$County, MergedDf$year), FUN = sum)
total <- rename(total, county = Group.1, year = Group.2, Emissions = x)

qplot(year, Emissions, color = county, data = total, geom = c("point", "smooth"))

png("plot6.png")

ggplot(data = total, aes(x = year, y = as.numeric(Emissions), color = county)) +
  geom_point() +
  geom_smooth() +
  xlab("Year") +
  ylab("Total emissions (tons)") +
  ggtitle("Total emissions from motor vehicles")

dev.off()
