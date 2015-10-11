# packages
library(data.table)
library(lubridate)

setwd('~/Dropbox/Tobbes/Studier/Data Science/explore1')

if (!file.exists('source_1')) {
  dir.create('source_1')
}

if (!file.exists('source_1/power_consumption.txt')) {
  
  file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(file.url,destfile='source_1/power_consumption.zip')
  unzip('source_1/power_consumption.zip',exdir='source_1',overwrite=TRUE)
  
  # read only the 2 days
  variable.class<-c(rep('character',2),rep('numeric',7))
  power.consumption<-read.table('source_1/household_power_consumption.txt',header=TRUE,
                                sep=';',na.strings='?',colClasses=variable.class)
  power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
  
  
  # clean up
  cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
          'SubMetering1','SubMetering2','SubMetering3')
  colnames(power.consumption)<-cols
  power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
  power.consumption<-power.consumption[,c(10,3:9)]
  
  
  # write new
  write.table(power.consumption,file='source_1/power_consumption.txt',sep='|',row.names=FALSE)
} else {
  
  power.consumption<-read.table('source_1/power_consumption.txt',header=TRUE,sep='|')
  power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)
  
}

