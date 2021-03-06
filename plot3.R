source('C:/Repos/ExData_Plotting1/cleanedData.R')

datasource <-cleanedData()
data<-datasource$get()
data$Date <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")
png(filename = 'plot3.png', width = 500, height = 500, units = 'px')
with(data, plot(Date, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data, lines(Date, Sub_metering_2, type="l", col="red"))
with(data, lines(Date, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#dev.copy(png, file="plot3.png")   #removed this line because it caused issues with legend when copying to PNG
dev.off()
