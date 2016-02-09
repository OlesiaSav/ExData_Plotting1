
library(Hmisc)
setwd ("C:/My documents/Study R/course2" )


data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", stringsAsFactors = F)

#check system time in R
Sys.time()

#set US locale
Sys.setlocale("LC_ALL", "US")

#compute Data and Time
data$DataTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")


#convert data from file to format R
data$Date=strptime(data$Date, format="%d/%m/%Y")


#filter data
db <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ] 


par(mfrow=c(2,2), mar=c(4,4,4,2))
dev.copy(png,'plot4.png')
plot(db$DataTime, db$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
plot(db$DataTime, db$Voltage , type="l", ylab = "Voltage", xlab = "datetime")


with(db,{
  plot(db$DataTime,db$Sub_metering_1,type="l", ylab = "Energy sub metering", xlab = "",col="black")
  lines(db$DataTime,db$Sub_metering_2,col="red")
  lines(db$DataTime,db$Sub_metering_3,col="blue")
  legend("topright",
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty = c(1,1,1),col=c("black","red","blue"),
         bty = "n")
})

plot(db$DataTime, db$Global_reactive_power , type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
