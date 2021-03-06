
# Setting the working directory
setwd("~/Desktop/Big Data/R")

# read the textfile in csv with ; as separator
dt=read.csv('household_power_consumption.txt',header=T, sep=';') 

# merge date and time into a single column in char
dt$Datetime = paste(as.character(dt[,1]) , dt[,2])  

# convert the Date column's datatype to date
dt[,1]=as.Date(dt$Date,'%d/%m/%Y')  

#select the date range requested
dt = subset(dt, Date == '2007-02-01' | Date == '2007-02-02') 

# convert the Global Active Power's datatype to numbers
dt[,3] = as.numeric(as.character(dt[,3])) 

#plot 1
png('plot1.png',width=480,height=480)
hist(dt[,3],col='red',xlab='Global Active Power (kilowatts)', ylab='Frequency',main='Global Active Power')
dev.off()

