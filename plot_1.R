setwd('~/Dropbox/Tobbes/Studier/Data Science/explore1')

source('explore1.R')

png(filename='plot1.png',width=480,height=480,units='px')

hist(power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kW)',col='red')

x<-dev.off()
