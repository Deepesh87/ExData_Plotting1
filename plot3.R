power=read.table("household_power_consumption.txt",header=T,na.strings = "?",sep=";",stringsAsFactors = FALSE)
str(power)
power$DateTime=strptime(paste(power$Date,power$Time,sep=" "),format ="%d/%m/%Y %H:%M:%S")
str(power)

power=subset(power,(as.Date(power$DateTime))>="2007-02-01" & (as.Date(power$DateTime))<="2007-02-02")
str(power)
power$Weekday=wday(power$Date,label = T)
str(power)
windows()
png(file="plot3.png")
plot( power$DateTime,power$Sub_metering_1,type="l",ylab = "Global Active Power (kilowatts)",xlab = "",col="black")
lines( power$DateTime,power$Sub_metering_2,type="l",ylab = "Global Active Power (kilowatts)",xlab = "",col="red")
lines( power$DateTime,power$Sub_metering_3,type="l",ylab = "Global Active Power (kilowatts)",xlab = "",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"))
dev.off()


