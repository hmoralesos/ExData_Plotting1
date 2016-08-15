################################################################################
# Read complete dataset                                                        #
################################################################################

dataset<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
head(dataset,5)
str(dataset)
dim(dataset)

################################################################################
# Extract data from the dates 2007-02-01 and 2007-02-02                        #
################################################################################
data<-subset(dataset,Date=="1/2/2007"|Date=="2/2/2007")
head(data,5)
(n<-nrow(data))

################################################################################
# Plot 4                                                                       #
################################################################################

# Plot1
library(lubridate)
gap<-as.numeric(as.character(data$Global_active_power))
x<-1:n
days<-as.Date(data$Date,format="%d/%m/%Y",tz = "UTC")
days<-wday(days,label=TRUE)
summary(days)


# Save plots
png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize =
        12,bg = "white")
par(mfrow=c(2,2))
plot(x,gap,type="l",axes = FALSE,xlab="",ylab="Global Active Power (kilowatts)")
axis(side=1, at=c("1","1440","2880"), labels=c("Thu","Fri","Sat"))
axis(2)
box()

# plot 2
plot(x,as.numeric(as.character(data$Voltage)),type="l", axes = FALSE,
     xlab="datatime",ylab="Voltage")
axis(side=1, at=c("1","1440","2880"), labels=c("Thu","Fri","Sat"))
axis(2)
box() #- to make it look "as usual"

# plot 3
plot(x,as.numeric(as.character(data$Sub_metering_1)),axes = FALSE,xlab="",
     ylab="Energy sub metering",type="l")
axis(side=1, at=c("1","1440","2880"), labels=c("Thu","Fri","Sat"))
axis(2)
box() #- to make it look "as usual"
lines(as.numeric(as.character(data$Sub_metering_2)),col="red")
lines(as.numeric(as.character(data$Sub_metering_3)),col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1",
                                                              "Sub_metering_2",
                                                              "Sub_metering_3"))

# plot 4
plot(x,as.numeric(as.character(data$Global_reactive_power)),type="l",
     axes = FALSE,xlab="datatime",ylab="Global_reactive_power")
axis(side=1, at=c("1","1440","2880"), labels=c("Thu","Fri","Sat"))
axis(2)
box()
dev.off() #close png
