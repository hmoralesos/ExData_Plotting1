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
# Plot 2                                                                       #
################################################################################
# library
library(lubridate)

# Column Global_active_power
gap<-as.numeric(as.character(data$Global_active_power))
x<-1:n
days<-as.Date(data$Date,format="%d/%m/%Y",tz = "UTC")
days<-wday(days,label=TRUE)
summary(days)

# Save plot
png(filename = "plot2.png",width = 480, height = 480, units = "px", pointsize =
        12,bg = "white")

plot(x,gap,type="l",axes = FALSE,xlab="",ylab="Global Active Power (kilowatts)")
axis(side=1, at=c("1","1440","2880"), labels=c("Thu","Fri","Sat"))
axis(2)
box()
dev.off() # close png
