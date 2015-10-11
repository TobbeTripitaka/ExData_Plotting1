setwd('~/Dropbox/Tobbes/Studier/Data Science/explore1')

source('explore1.R')

png(filename='plot2.png',width=480,height=480,units='px')

plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

x<-dev.off()