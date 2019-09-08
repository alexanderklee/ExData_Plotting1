# -- Read source file into data frame -- #
data <- read.table('exdata_data_household_power_consumption/household_power_consumption.txt', header=TRUE,sep=";")

# -- Convert Date column elements into actual Date objects -- #
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Get all Dates matching the 1st and 2nd of Feb -- #
trimmed_set <- data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"),]

# -- Need to get date and time in one data frame for plot --#
get_datetime <- paste(trimmed_set$Date,trimmed_set$Time)
get_datetime <- strptime(trimmed_set_datetime,format="%Y-%m-%d %H:%M:%S")

# -- Extract sub meter readings and convert to numberics
submeter1 <- as.numeric(trimmed_set$Sub_metering_1)
submeter2 <- as.numeric(trimmed_set$Sub_metering_2)
submeter3 <- as.numeric(trimmed_set$Sub_metering_3)

# -- Open PNG Device -- #
png(filename="plot3.png", width=480, height=480, bg="transparent")

# -- Execute initial plots for sub meter 1 -- #
plot(get_datetime,submeter1, type="l", col="black", xlab="", ylab="Energy sub metering")

# -- add sub meters 2 and 3 to the current canvas -- #
points(get_datetime, submeter2, type="l", col="red")
points(get_datetime, submeter3, type="l", col="blue")

# -- add the legend -- #
legend("topright",lwd=c(1, 1, 1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),border=c(1,4,1,1))

# -- close device -- #
dev.off()