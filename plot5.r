##Filtering Baltimore City and and proper SCC code
balt <- nei %>% filter(fips == "24510")
balt <- merge(balt, scc, by = "SCC")

veh <- grepl("vehicle", balt$Short.Name, ignore.case = TRUE)
veh <- balt[veh,]

##Summary of coal consumption by year
veh <- ddply(veh, "year", function(x) sum(x$Emissions))

##opening png device
png(filename = "plot5.png", width = 480, height = 480)

##Fourth plot
barplot(height = veh$V1, xlab = "Year", ylab = "Emissions", main = "Vehicle Emissions in USA", names.arg = c("1999", "2002", "2005", "2008"))

##Closing device
dev.off()
