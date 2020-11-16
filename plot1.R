  library(data.table)
  data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  data<-subset(data,Date >= "2007-2-1" & Date < "2007-2-3")
  png("plot1.png", width=480, height=480)
  hist(as.numeric(data$Global_active_power),main="Global Active Power",
       xlab="Global Active Power (kilowatts)",col="red",breaks = 14)
  dev.off()