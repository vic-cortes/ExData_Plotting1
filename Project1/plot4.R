x <- read.table("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")
x[,1] <- as.Date(as.character(x[,1]),"%d/%m/%Y")
dat <- x[x[,1] >= as.Date("2007-02-01") & x[,1] <= as.Date("2007-02-02"),] #Seleccion de rango de fechas
newDate <- as.character(paste(dat[,1],dat[,2]))
newDate <- strptime(newDate,format = "%Y-%m-%d %H:%M:%S")

for(i in 3:9){
	dat[,i] <- as.numeric(as.character(dat[,i]))
}
png(file="plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(x = newDate ,y = dat[,3], typ = "l", ylab = "Global Active Power", xlab = "")
plot(x = newDate ,y = dat[,5], typ = "l", ylab = "Voltage", xlab = "datetime")
plot(x = newDate ,y = dat[,7], typ = "l", ylab = "Energy sub metering", xlab = "" )
lines(x = newDate , dat[,8], typ = "l", col = "red")
lines(x = newDate , dat[,9], typ = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty =c(1,1,1),col=c("black","red","blue"))
plot(x = newDate ,y = dat[,4], typ = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()