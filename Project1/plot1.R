x <- read.table("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")
x[,1] <- as.Date(as.character(x[,1]),"%d/%m/%Y")
dat <- x[x[,1] >= as.Date("2007-02-01") & x[,1] <= as.Date("2007-02-02"),] 
for(i in 3:9){
	dat[,i] <- as.numeric(as.character(dat[,i]))
}
png(file="plot1.png",width = 480, height = 480, units = "px")
hist(dat[,3],col="red", main="Global Active Power",xlab = "Global Active Power (Kilowatts)")
dev.off()