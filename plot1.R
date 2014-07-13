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
#####creates png file for plot 1#####
#####################################
png(file="plot1.png",width=480,height=480)   ##creates plot1.png file
##creates the historgram of global active power, colored red
hist(targetData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()     ##closes the png file type
