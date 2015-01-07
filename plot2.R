#Read data from .txt
data<-read.table("household_power_consumption.txt",
                  header=T,
                  sep=";",
                  na.strings="?"
                  )

#Convert the Date and Time variables to Date/Time classes in R                  
data$DateTime <- strptime(
                          paste(data$Date, data$Time), 
                          format= "%d/%m/%Y %H:%M:%S"
                          )

#Convert Global_active_power from factor into numeric
data$Global_active_power<-as.numeric(
                                      as.character(data$Global_active_power)
                                      )

#We will only be using data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(data,as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

#Make the plot
plot(subdata$DateTime, subdata$Global_active_power,
      pch=NA,
      xlab="",
      ylab="Global Active Power (kilowatts)")
lines(subdata$DateTime, subdata$Global_active_power)

#Save the plot      
dev.copy(png,file="plot2.png")
dev.off()

dev.copy(png,file="plot2.png")
dev.off()
