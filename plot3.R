# read subset of data
datafile <- 'data/household_power_consumption.txt'
header <- read.table(datafile, header=T, sep=';', nrows=1)
data <- read.table(datafile, sep=';', stringsAsFactors=F, na.strings='?', skip=66637, nrows=2880)
names(data) <- names(header)

# convert date values
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S', tz='UTC')

# open PNG file
png('plot3.png')

# do plot
plot(data$Sub_metering_1 ~ data$datetime, type='l', xlab='', ylab='Energy sub metering')
lines(data$Sub_metering_2 ~ data$datetime, col='red')
lines(data$Sub_metering_3 ~ data$datetime, col='blue')

legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'))

# close PNG file
i <- dev.off()
