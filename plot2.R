library(data.table)

#load dataset
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#format the date
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#subset the data to only the days you want
data<-subset(data,Date >= "2007-2-1" & Date < "2007-2-3")
data$datetime <- strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#begin plot
par()
png("plot2.png", width=480, height=480)
plot(data$datetime, data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab = " ")
dev.off()

