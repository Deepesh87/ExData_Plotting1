power=read.table("household_power_consumption.txt",header=T,na.strings = "?",sep=";",stringsAsFactors = FALSE)
str(power)
power$DateTime=strptime(paste(power$Date,power$Time,sep=" "),format ="%d/%m/%Y %H:%M:%S")
str(power)

power=subset(power,(as.Date(power$DateTime))>="2007-02-01" & (as.Date(power$DateTime))<="2007-02-02")
str(power)
power$Weekday=wday(power$Date,label = T)
str(power)

png(file="plot2.png")
plot( power$DateTime,power$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()


