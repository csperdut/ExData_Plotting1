# Setting the working directory
setwd("~/Desktop/Big Data/R")

# read the textfile in csv with ; as separator
dt=read.csv('household_power_consumption.txt',header=T, sep=';') # Project 1

# merge date and time into a single column in char
dt$Datetime = paste(as.character(dt[,1]) , dt[,2])  

# convert the Date column's datatype to date
dt[,1]=as.Date(dt$Date,'%d/%m/%Y')  

#select the date range requested
dt = subset(dt, Date == '2007-02-01' | Date == '2007-02-02') 

# convert the Global Active Power's datatype to numbers
dt[,3] = as.numeric(as.character(dt[,3])) 

# create a datetime
dt$dt <- strptime(dt$Datetime, '%d/%m/%Y %H:%M') 

# Convert Sub_metering to numbers
dt$Sub_metering_1 <- (as.numeric(as.character(dt$Sub_metering_1))) 
dt$Sub_metering_2 <- (as.numeric(as.character(dt$Sub_metering_2)))
dt$Sub_metering_3 <- (as.numeric(as.character(dt$Sub_metering_3)))
dt$Voltage <- (as.numeric(as.character(dt$Voltage)))
dt$Global_reactive_power <- (as.numeric(as.character(dt$Global_reactive_power)))

#plot 4
par(mfrow=c(2,2), cex=0.75)
plot(dt$dt,dt$Global_active_power,ylab='Global Active Power',xlab='',type='line')
plot(dt$dt,dt$Voltage,ylab='Voltage',xlab='datetime',type='line')
plot(dt$dt,dt$Sub_metering_1,ylab='Energy sub metering',xlab='',type='line')
lines(dt$dt,dt$Sub_metering_2,col='red')
lines(dt$dt,dt$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1      ','Sub_metering_2      ','Sub_metering_3      '), col=c('black','red','blue'), bty="n",lty=1,lwd=1.5,xjust=1,y.intersp=0.6)
plot(dt$dt,dt$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='line')
dev.copy(png,'plot4.png',width=480,height=480)
dev.off()
