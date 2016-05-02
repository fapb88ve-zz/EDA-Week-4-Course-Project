##Filtering Baltimore City and Summary of Emissions by year

balt <- nei %>% filter(fips == "24510")

a <- ddply(balt, .variables = c("year", "type"), function(x) sum(x$Emissions))

##Opening png device
png(filename = "plot3.png", width = 480, height = 480)

##Third plot
library(ggplot2)

plot3 <- ggplot(a, aes(year, Emissions, color = type))

plot3 <- plot3 + geom_line() + xlab("Year") + ylab(expression("Emissions")) + ggtitle("Baltimore City emissions per year (All sources nad Types)")
print(plot3)
dev.off()
