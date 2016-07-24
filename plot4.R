# plot4.R
#
# Source data: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# downloaded and unzipped into subfolder of working directory in local machine
#
# read and select two days: 2007-02-01 and 2007-02-02
#
hpc <- read.table('./exdata_data_household_power_consumption/household_power_consumption.txt',
                stringsAsFactors = FALSE,
                header = TRUE,
                na.strings = '?',
                sep=';',
                dec='.')
hpc <- subset(hpc, Date %in% c('1/2/2007', '2/2/2007'))
#
# Convert dates and times from strings to date and datetime variables
#
hpc$datev <- as.Date(hpc$Date, '%d/%m/%Y')
hpc$timev <- strptime(paste(hpc$Date,hpc$Time), '%d/%m/%Y %H:%M:%S')
# 
# Prepare png graphics device
#
png(filename = "plot4.png",
    width = 480, 
    height = 480, 
    units = "px", 
    pointsize = 12)
#
# create four plots in one file, two rows with two plots per row
# plot sub meterings by measurement time overlayed in one plot, with a legend
#
par(mfrow = c(2, 2))
#
# plot global active power by measurement time
#
plot(hpc$timev,
     hpc$Global_active_power, 
     type='l',
     xlab=' ',
     ylab='Global Active Power')
#
# plot voltage by measurement time
#
plot(hpc$timev,
     hpc$Voltage, 
     type='l',
     xlab='datetime',
     ylab='Voltage')
#
# plot energy sub metering
#
plot(hpc$timev,
     hpc$Sub_metering_1, 
     type='l',
     xlab=' ',
     ylab=' ',
     ylim=c(0,max(hpc$Sub_metering_1)),
     axes=FALSE)
par(new=TRUE)
plot(hpc$timev,
     hpc$Sub_metering_2, 
     type='l',
     xlab=' ',
     ylab=' ',
     col='red',
     ylim=c(0,38),
     axes=FALSE)
par(new=TRUE)
plot(hpc$timev,
     hpc$Sub_metering_3, 
     type='l',
     xlab=' ',
     ylim=c(0,38),
     yaxp=c(0,40,4),
     col='blue',
     ylab='Energy sub metering')
legend('topright',
       lty=1,
       col=c('black','red','blue'),
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       bty='n')
#
# plot global reactive power by measurement time
#
plot(hpc$timev,
     hpc$Global_reactive_power, 
     type='l',
     xlab='datetime',
     ylab='Global_reactive_power')
#
# turn the png device off
#
dev.off()
