#' plot1.R
#'
#' @description
#' Generate the first plot required for Project 1. The plot is a histogram
#' of global active power in kilowatts.
#'
#' @docType package
#' @name plot1
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
sanityCheck()

#Plot 1
png(
  file = "plot1.png",
  width = 480,
  height = 480,
  units = 'px'
)
hist(
  mySample$Global_active_power,
  col = 'red',
  xlab = 'Global Active Power (kilowatts)',
  main = 'Global Active Power'
)
dev.off()
print ("Completed Plot1 generation")
