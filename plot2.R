# read subset of data
datafile <- 'data/household_power_consumption.txt'
header <- read.table(datafile, header=T, sep=';', nrows=1)
data <- read.table(datafile, sep=';', stringsAsFactors=F, na.strings='?', skip=66637, nrows=2880)
names(data) <- names(header)

# convert date values
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S', tz='UTC')

# open PNG file
png('plot2.png')

# do plot
plot(data$Global_active_power ~ data$datetime, type='l', xlab='', ylab='Global Active Power (kilowatts)')

# close PNG file
i <- dev.off()
