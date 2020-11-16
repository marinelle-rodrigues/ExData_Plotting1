library(data.table)

#load dataset
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#format the date
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#subset the data to only the days you want
data<-subset(data,Date >= "2007-2-1" & Date < "2007-2-3")
data$datetime <- strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

#begin plot
par(mfrow=c(2,2))
png(file="plot4.png", width=480, height=480)
#Plot 1
with(data,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active df_sub (kilowatts)"))
#Plot 2
with(data,plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage"))
#Plot 3
with(data,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(data$datetime, as.numeric(as.character(data$Sub_metering_2)), type = "l", col = "red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1 ,col=c("black","red","blue"))
#Plot 4
with(data,plot(datetime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_df_sub"))
dev.off()
