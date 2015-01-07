#Read the data
data<-read.table("household_power_consumption.txt",header=T,sep=";")

#Convert the Date and Time variables to Date/Time classes in R
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Make a 2x2 plots
par(mfrow=c(2,2))

#We will only be using data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(data,as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

#Change the factor variables to numeric
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
subdata$Global_reactive_power<-as.numeric(as.character(subdata$Global_reactive_power))
subdata$Voltage<-as.numeric(as.character(subdata$Voltage))
subdata$Sub_metering_1<-as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3<-as.numeric(as.character(subdata$Sub_metering_3))

#1st polt
with(subdata, plot(DateTime, Global_active_power,pch=NA,xlab="",ylab="Global Active Power (kilowatts)"))
with(subdata, lines(DateTime, Global_active_power))

#2nd plot
with(subdata,plot(DateTime, Voltage, pch=NA, xlab="datetime", ylab="Voltage"))
with(subdata,lines(DateTime, Voltage))

#3rd plot and its legend
with(subdata, plot(DateTime, Sub_metering_1, type = "l", main = "", ylab = "Energy sub metering", xlab = ""))
with(subdata, lines(DateTime, Sub_metering_2, col="red"))
with(subdata, lines(DateTime, Sub_metering_3, col="blue"))

#4th plot
with(subdata,plot(DateTime, Global_reactive_power, pch=NA, xlab="datetime", ylab="Global_reactive_power"))
with(subdata,lines(DateTime, Global_reactive_power))

#Save the png file

dev.copy(png,file="plot4.png")
dev.off()

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty ="n")
