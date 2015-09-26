setwd("Downloads/")

library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BaltimoreDf <- filter(NEI, fips == "24510")
total <- aggregate(BaltimoreDf$Emissions, by = list(BaltimoreDf$year), FUN = sum)

plot(x = total$Group.1, y = total$x, type = "o", col = "blue", ann = FALSE)
title(xlab = "years", ylab = "Total of Emissions", main = "Total Emissions per Year")
