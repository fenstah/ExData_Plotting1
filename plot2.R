source('C:/Repos/ExData_Plotting1/cleanedData.R')

datasource <-cleanedData()
data<-datasource$get()
data$Date <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")
plot(data$Date, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")   #copy to PNG file
dev.off()
