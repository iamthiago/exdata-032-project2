# 2 - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?

library(dplyr)

NEI <- readRDS("data/summarySCC_PM25.rds")

BaltimoreDf <- filter(NEI, fips == "24510")
total <- aggregate(BaltimoreDf$Emissions, by = list(BaltimoreDf$year), FUN = sum)

png("plo2.png")

plot(x = total$Group.1, y = total$x, type = "o", col = "blue", ann = FALSE)
title(xlab = "years", ylab = "Total emissions (tons)", main = "Total Emissions in the Baltimore")

dev.off()
