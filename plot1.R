setwd("Downloads/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total <- aggregate(NEI$Emissions, by = list(NEI$year), FUN = sum)

plot(x = total$Group.1, y = total$x, type = "o", col = "blue", ann = FALSE)
title(xlab = "years", ylab = "Total of Emissions", main = "Total Emissions per Year")

