#read in data
new_wd <- "C:/Users/lazmin.zarin/OneDrive - National Grid/Courses/Exploratory Data Analysis/Week 1/"
setwd(new_wd)

consumption <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption$Time <- format(strptime(consumption$Time, format = "%H:%M:%S"),"%H:%M:%S")
data_cons <- subset(consumption, consumption$Date == "2007/02/01" | consumption$Date == "2007/02/02")
rm(consumption)

#create datetime column
sub_date_time <- paste(data_cons[,1], data_cons[,2])
sub_date_time <- data.frame(sub_date_time)
data_cons <- cbind(data_cons,sub_date_time)
data_cons$sub_date_time <- as.POSIXlt(format(data_cons$sub_date_time, format = "%d-%m-%Y %H:%M:%S"))

#plot the graph
png(filename = "plot3.png",
    width = 480, height = 480)


plot(data_cons$sub_date_time,data_cons$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(data_cons,lines(sub_date_time,as.numeric(Sub_metering_1)))
with(data_cons,lines(sub_date_time,as.numeric(Sub_metering_2),col="red"))
with(data_cons,lines(sub_date_time,as.numeric(Sub_metering_3),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()