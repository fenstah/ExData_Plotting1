library(data.table)

##check if subset data file exists
if(!file.exists("truncdata.csv"))
{
    ## if not then check if zip file exists
    if(!file.exists("household_power_consumption.zip"))
    {
        ## if doesnt exist download file
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
    }
    
    #check to see if original data file exists
    if(!file.exists("household_power_consumption.txt")) 
    {
        ##extract file from zip
        unzip("household_power_consumption.zip")
    }
    
    ##create a file with only the records needed
    truncdata<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
    truncdata<-truncdata[as.Date(truncdata$Date, format="%d/%m/%Y") <= "2007-02-02" & as.Date(truncdata$Date, format="%d/%m/%Y") >= "2007-02-01",]     #subset data to only use Feb 1 and 2 2007
    write.table(truncdata, file = "truncdata.csv", row.names=FALSE, col.names=TRUE, sep=",", quote=FALSE)
}


cleanedData <- function(data=NULL) {
    cleanedData <- attr(cleanedData,"cleanedData")
    if(is.null(cleanedData)) {
        cleanedData <-read.csv("truncdata.csv", header=T, na.strings="?") #, colClasses=c("Date", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
        cleanedData$Date<-as.Date(cleanedData$Date, "%d/%m/%Y")
    }
    ifelse(!is.null(data), x<-data, x<-cleanedData)  
    
    set <- function(y) {   #public set method for initializing variable
        x <<- y
        cleanedData <- x   
    }
    get <- function() x 
    attr(cleanedData, "cleanedData") <<- cleanedData
    list(set=set,get=get)     
}