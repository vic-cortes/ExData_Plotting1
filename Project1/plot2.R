x <- read.table("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")
x[,1] <- as.Date(as.character(x[,1]),"%d/%m/%Y")
dat <- x[x[,1] >= as.Date("2007-02-01") & x[,1] <= as.Date("2007-02-02"),] #Seleccion de rango de fechas
newDate <- as.character(paste(dat[,1],dat[,2]))
newDate <- strptime(newDate,format = "%Y-%m-%d %H:%M:%S")

for(i in 3:9){
	dat[,i] <- as.numeric(as.character(dat[,i]))
}

png(file="plot2.png",width = 480, height = 480, units = "px")
plot(x = newDate ,y = dat[,3], typ = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
