#Read data from .txt
data<-read.table("household_power_consumption.txt",
                  header=T,
                  sep=";",
                  na.strings="?")

#Convert the Date and Time variables to Date/Time classes in R
data$Date=as.Date(data$Date,
                  format="%d/%m/%Y")
                  
data$Time<-strptime(data$Time,
                    format="%H:%M:%S")
                    
#Convert Global_active_power from factor into numeric
data$Global_active_power<-as.numeric(
                                      as.character(
                                                    data$Global_active_power
                                                    )
                                    )
#We will only be using data from the dates 2007-02-01 and 2007-02-02
subdata <- subset(data, 
                      data$Date >= ("2007-02-01") & data$Date <= as.Date("2007-02-02"))
 
#Make the plot                     
hist(subdata$Global_active_power,
      col="red",
      xlab="Global Active Power(kilowatts)",
      main="Global Active Power")

#Save the plot      
dev.copy(png,file="plot1.png")
dev.off()
