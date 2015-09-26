# 3 - Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 

library(dplyr)
library(ggplot2)

NEI <- readRDS("data/summarySCC_PM25.rds")

BaltimoreDf <- filter(NEI, fips == "24510")
total <- aggregate(BaltimoreDf$Emissions, by = list(BaltimoreDf$type, BaltimoreDf$year), FUN = sum)
total <- rename(total, type = Group.1, year = Group.2, Emissions = x)

png("plot3.png")

ggplot(data = total, aes(x = year, y = as.numeric(Emissions), color = type)) +
  geom_point() +
  geom_smooth() +
  xlab("Year") +
  ylab("Total emissions (tons)") +
  ggtitle("Total emissions in Baltimore")

dev.off()
