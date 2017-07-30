#' plot1.R
#'
#' @description
#' #' Generate the second plot required for Project 1. The plot is a line plot
#' of global active power in kilowatts.
#'
#' @docType package
#' @name plot2
#' @author Steve Eannuzzi steven@eannuzzi.com
#'

# Load utility code and data

if (file.exists("utility.R")) {
  source("utility.R") # assumes the working directory contains this file.
} else {
  stop("working directory does not contain the utility.R")
}

# Read in the data.
init()

#Plot 2
png(
  file = "plot2.png",
  width = 480,
  height = 480,
  units = 'px'
)
plot(
  mySample$timestamp,
  mySample$Global_active_power,
  type = 'l',
  ylab = 'Global Active Power (kilowatts)',
  xlab = ''
)
dev.off()

print ("Completed Plot2 generation")
