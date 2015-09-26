# 5 - How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(dplyr)
library(ggplot2)

NEI <- readRDS("data/summarySCC_PM25.rds")

BaltimoreDf <- filter(NEI, fips == "24510" & type == "ON-ROAD")

total <- aggregate(Emissions ~ year, data = BaltimoreDf, FUN = sum)

png("plot5.png")

ggplot(data = total, aes(x = year, y = as.numeric(Emissions))) +
  geom_point() +
  geom_smooth() +
  xlab("Year") +
  ylab("Total emissions (tons)") +
  ggtitle("Total emissions in Baltimore from motor vehicles")

dev.off()
