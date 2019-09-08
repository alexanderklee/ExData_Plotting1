# -- Read source file into data frame -- #
data <- read.table('exdata_data_household_power_consumption/household_power_consumption.txt', header=TRUE,sep=";")

# -- Convert Date column elements into actual Date objects -- #
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Get all Dates matching the 1st and 2nd of Feb -- #
trimmed_set <- data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"),]

# -- Need to get date and time in one data frame for plot --#
get_datetime <- paste(trimmed_set$Date,trimmed_set$Time)
get_datetime <- strptime(trimmed_set_datetime,format="%Y-%m-%d %H:%M:%S")

# -- Converting Global active power into a numeric
trimmed_set <- as.numeric(trimmed_set$Global_active_power)

# -- Setting up PNG device -- #
png(filename="plot2.png", width=480, height=480, bg="transparent")

# -- Execute plot routine -- #
plot(get_datetime, trimmed_set, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# -- Closing device -- #
dev.off()

