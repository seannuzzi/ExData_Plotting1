#' plot3.R
#'
#' @description
#' Generate the third plot required for Project 1. The plot is a line plot
#' of sub-metering data, one line per submeter type.
#'
#' @docType package
#' @name plot3
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

#plot 3
png(
  file = "plot3.png",
  width = 480,
  height = 480,
  units = 'px'
)
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
  col = c('black', 'red', 'blue')
)
dev.off()

print ("Completed Plot3 generation")
