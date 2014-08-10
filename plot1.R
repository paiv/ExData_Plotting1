# read subset of data
datafile <- 'data/household_power_consumption.txt'
header <- read.table(datafile, header=T, sep=';', nrows=1)
data <- read.table(datafile, sep=';', stringsAsFactors=F, na.strings='?', skip=66637, nrows=2880)
names(data) <- names(header)

# open PNG file
png('plot1.png')

# do plot
hist(data$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')

# close PNG file
i <- dev.off()
