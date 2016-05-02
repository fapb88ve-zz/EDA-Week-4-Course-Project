##Summary of Emissions by year
years <- ddply(nei, "year", function(x) sum(x$Emissions))

##Opening png device
png(filename = "plot1.png", width = 480, height = 480)

##First plot
barplot(height = years$V1, xlab = "Year", ylab = "Emissions", main = "Total emissions per year (All sources)", names.arg = c("1999", "2002", "2005", "2008"))

##Closing device
dev.off()
