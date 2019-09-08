
# -- Read source file into data frame -- #
data <- read.table('exdata_data_household_power_consumption/household_power_consumption.txt', header=TRUE,sep=";")

# -- Convert Date column elements into actual Date objects -- #
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Get all Dates matching the 1st and 2nd of Feb -- #
trimmed_set <- data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"),]

# -- Convert Global active power elements into numerics -- #
trimmed_set <- as.numeric(trimmed_set$Global_active_power)

# -- setup PNG Device -- #
png(filename="plot1.png", width=480, height=480, bg="transparent")

# -- Generate histogram using trimmed_set -- #
hist(x = trimmed_set,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency")

# -- Don't forget to turn PNG device off -- #
dev.off()