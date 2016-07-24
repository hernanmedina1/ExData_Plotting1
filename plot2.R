# plot2.R
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
png(filename = "plot2.png",
    width = 480, 
    height = 480, 
    units = "px", 
    pointsize = 12)
#
# plot global active power by measurement time
#
plot(hpc$timev,
     hpc$Global_active_power, 
     type='l',
     xlab=' ',
     ylab='Global Active Power (kilowats)')
#
# turn the png device off
#
dev.off()
