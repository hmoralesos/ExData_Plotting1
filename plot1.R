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
# Plot 1                                                                       #
################################################################################

# Column Global_active_power
plot1<-as.numeric(as.character(data$Global_active_power))

# Save plot
png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize =
        12,bg = "white")
hist(plot1,main="Global Active Power", xlab="Global Active Power (kilowatts)",
     col="red")
dev.off() # close png
