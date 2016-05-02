##Filtering Baltimore City and Summary of Emissions by year
balt <- nei %>% filter(fips == "24510")

balt <- ddply(balt, "year", function(x) sum(x$Emissions))

##Opening png device
png(filename = "plot2.png", width = 480, height = 480)

##Second plot
barplot(height = balt$V1, xlab = "Year", ylab = "Emissions", main = "Baltimore City emissions per year (All sources)", names.arg = c("1999", "2002", "2005", "2008"))

##Closing device
dev.off()
