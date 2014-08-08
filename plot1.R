source('C:/Repos/ExData_Plotting1/cleanedData.R')

datasource <-cleanedData()
data<-datasource$get()
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")   #copy to PNG file
