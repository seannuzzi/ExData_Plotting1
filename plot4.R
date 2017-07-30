#' plot4.R
#'
#' @description
#' Generate the fourth plot required for Project 1. The plot is contains
#' 4 different line plots. Two of the plots are the second and third plots
#' while the other two are line plots of Voltage and Global_reactive_power.
#'
#' @docType package
#' @name plot4
#' @author Steven Eannuzzi steven@eannuzzi.com
#'
# Load utility code and data

if (file.exists("utility.R")) {
  source("utility.R") # assumes the working directory contains this file.
} else {
  stop("working directory does not contain the utility.R")
}

# Read in the data.
init()

##Plot 4
png(
  file = "plot4.png",
  width = 480,
  height = 480,
  units = 'px'
)
# Parameters 2 rows by 2 columns
par(mfrow = c(2, 2))

#Plot 4.1
plot(
  mySample$timestamp,
  mySample$Global_active_power,
  type = 'l',
  ylab = 'Global Active Power',
  xlab = ''
)

#Plot 4.2
plot(
  mySample$timestamp,
  mySample$Voltage,
  type = 'l',
  ylab = "Voltage",
  xlab = 'datetime'
)

#Plot 4.3
plot(
  mySample$timestamp,
  mySample$Sub_metering_1,
  type = 'l',
  col = 'black',
  ylab = 'Energy sub metering',
  xlab = ''
)
lines(mySample$timestamp, mySample$Sub_metering_2, col = 'red')
lines(mySample$timestamp, mySample$Sub_metering_3, col = 'blue')
legend(
  'topright',
  legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
  lwd = 1,
  col = c('black', 'red', 'blue'),
  bty = 'n'
)

#Plot 4.4
plot(
  mySample$timestamp,
  mySample$Global_reactive_power,
  type = 'l',
  ylab = "Global_reactive_power",
  xlab = 'datetime'
)
dev.off()

print ("Completed Plot4 generation")
