##SCC code related to coal consumption
codescc <- scc[,c(1, 3)]
nei1 <- nei %>% select(SCC, Emissions, year)

nei1 <- merge(nei1, codescc, by = "SCC")


##Filtering Emission information related to coal consumption
library(plyr)
library(dplyr)
coal <- grepl("coal", nei1$Short.Name, ignore.case = TRUE)
coal <- nei1[coal,]

##Summary of coal emission by year
coal <- ddply(coal, "year", function(x) sum(x$Emissions))

##opening png device
png(filename = "plot4.png", width = 480, height = 480)

##Fourth plot
barplot(height = coal$V1, xlab = "Year", ylab = "Emissions", main = "Coal Emissions in USA", names.arg = c("1999", "2002", "2005", "2008"))

##Closing device
dev.off()
