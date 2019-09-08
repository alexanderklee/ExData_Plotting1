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

# -- converting voltage and global active+reactive power to numerics -- #
gap      <- as.numeric(trimmed_set$Global_active_power)
grp      <- as.numeric(trimmed_set$Global_reactive_power)
voltage  <- as.numeric(trimmed_set$Voltage)

# -- setting up PNG device -- #
png(filename="plot4.png", width=480, height=480, bg="transparent")

# -- setting up 2 x 2 canvas -- #
par(mfrow=c(2, 2))

# -- Plotting a total of 4 plots in the sequence to match quiz -- #
plot(get_datetime,gap,type="l", xlab="",ylab="Global Active Power")
plot(get_datetime,voltage,type="l",ylab="Voltage")
plot(get_datetime,submeter1,type="l",col="black", xlab="", ylab="Energy sub metering")
points(get_datetime,submeter2,type="l",col="Red")
points(get_datetime,submeter3,type="l",col="blue")
plot(get_datetime,grp, type="l",ylab="Global_reactive_power")

# -- closing PNG device -- #
dev.off()

