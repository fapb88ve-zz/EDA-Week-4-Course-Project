##Filtering Baltimore City and LAC, and adding SCC
bala <- nei %>% filter(fips == "24510" | fips == "06037")

bala <- merge(bala, scc, by = "SCC")

##Filtering Correct SCC for vehicle

veh <- grepl("vehicle", bala$Short.Name, ignore.case = TRUE)

##Summary by year and fips
bala <- bala[veh,]
bala <- ddply(bala, c("year", "fips"), function(x) sum(x$Emissions))

balt <- bala %>% filter(fips == 24510)
lac <- bala %>% filter(fips == "06037")

##Opening png device
png(filename = "plot6.png", width = 480, height = 480)

##Second plot
par(mfrow = c(1,2))
plot(balt$year, balt$V1, xlab = "Year", ylab = "Emissions", main = "Baltimore City Vehicle Vehicle emissions per year")
plot(lac$year, lac$V1, xlab = "Year", ylab = "Emissions", main = "LA County Vehicle Vehicle emissions per year")
##Closing device
dev.off()
