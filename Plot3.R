
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

#save plot

par(mfrow=c(1,1))
dev.copy(png,'plot3.png',width = 480, height = 480, units = "px", bg = "white")
with(db,{
  plot(db$DataTime,db$Sub_metering_1,type="l", ylab = "Energy sub metering", xlab = "",col="black")
  lines(db$DataTime,db$Sub_metering_2,col="red")
  lines(db$DataTime,db$Sub_metering_3,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col=c("black","red","blue"))
  })

dev.off()
