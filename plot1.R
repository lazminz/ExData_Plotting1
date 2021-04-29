#read in data
new_wd <- "C:/Users/lazmin.zarin/OneDrive - National Grid/Courses/Exploratory Data Analysis/Week 1/"
setwd(new_wd)

consumption <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption$Time <- format(strptime(consumption$Time, format = "%H:%M:%S"),"%H:%M:%S")
data_cons <- subset(consumption, consumption$Date == "2007/02/01" | consumption$Date == "2007/02/02")
rm(consumption)

#plot the graph
png(filename = "plot1.png",
    width = 480, height = 480)

hist(as.numeric(data_cons$Global_active_power), col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()