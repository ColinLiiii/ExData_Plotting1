#Read the data
data<-read.table("household_power_consumption.txt",header=T,sep=";")

##Convert the Date and Time variables to Date/Time classes in R
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Convert Sub_metering_1/2/3 from factor into numeric
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))

#Get the subset of the data which is required
subdata <- subset(data,as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

#Make the plot & the legend
plot( subdata$DateTime, subdata$Sub_metering_1, type = "l", main = "", ylab = "Energy sub metering", xlab = "")
with(subdata, lines(DateTime, Sub_metering_2, col="red"))
with(subdata, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",lty=1,col=c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Save the png file
dev.copy(png,file="plot3.png")
dev.off()
