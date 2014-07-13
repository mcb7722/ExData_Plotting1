#########################################
#####Read in and format the data set#####
#########################################

##store the txt file as 'data' object
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

##screen and select all data from 2/1/2007 and 2/2/2007, store in new variable
targetData<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
targetData<-data.frame(targetData) ##sets matrix as data.frame

##combine date and time into one column, renamed to Date_Time
targetData<-cbind(targetData,paste(targetData$Date,targetData$Time,sep=' '))
names(targetData)[10]<-"Date_Time"
##format the date & time using strptime function
targetData$Date_Time<-strptime(targetData$Date_Time,format="%d/%m/%Y %H:%M:%S")

##format all other columns to numeric
targetData[,3]<-as.numeric(as.character(targetData[,3]))
targetData[,4]<-as.numeric(as.character(targetData[,4]))
targetData[,5]<-as.numeric(as.character(targetData[,5]))
targetData[,6]<-as.numeric(as.character(targetData[,6]))
targetData[,7]<-as.numeric(as.character(targetData[,7]))
targetData[,8]<-as.numeric(as.character(targetData[,8]))
targetData[,9]<-as.numeric(as.character(targetData[,9]))

#####################################
#####creates png file for plot 4#####
#####################################
png(file="plot4.png",width=480,height=480)   ##creates plot4.png file

par(mfrow=c(2,2))
with(targetData,{
  plot(Date_Time,Global_active_power,type="l",ylab="Global Active Power",xlab="")
  plot(Date_Time,Voltage,,type="l",xlab="datetime",ylab="Voltage")
  plot(Date_Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  points(Date_Time,Sub_metering_1,type="l",col="black")
  points(Date_Time,Sub_metering_2,type="l",col="red")
  points(Date_Time,Sub_metering_3,type="l",col="blue")
  legend("topright",col=c("black","red","blue"),bty="n",lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Date_Time,Global_reactive_power,type="l",xlab="datetime")
  
})

dev.off()