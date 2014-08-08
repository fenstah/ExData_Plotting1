source('C:/Repos/ExData_Plotting1/cleanedData.R')

datasource <-cleanedData()
data<-datasource$get()
png(filename = 'plot1.png', width = 500, height = 500, units = 'px')
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
#dev.copy(png, file="plot1.png")   #copy to PNG file
dev.off()
