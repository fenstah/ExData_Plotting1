source('C:/Repos/ExData_Plotting1/cleanedData.R')

datasource <-cleanedData()
data<-datasource$get()
data$Date <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")
png(filename = 'plot4.png', width = 500, height = 500, units = 'px')
par(mfrow=c(2,2))   #two columns and two rows
with(data, {
    plot(data$Date, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    plot(data$Date, data$Voltage, type="l", ylab="Voltage", xlab="datetime")
    {
        with(data, plot(Date, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
        with(data, lines(Date, Sub_metering_2, type="l", col="red"))
        with(data, lines(Date, Sub_metering_3, type="l", col="blue"))
        legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    }
    plot(data$Date, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")    
    })
#dev.copy(png, file="plot4.png")   ##removed this line because it caused issues with legend when copying to PNG
dev.off()
