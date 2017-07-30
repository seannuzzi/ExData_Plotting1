#' utility.R
#'
#' @description
#' Definition of variables and functions used in all the files. Sourced
#' in each plotting script file used in this project.
#'
#' @docType package
#' @name utility
#' @author Steve Eannuzzi steven@eannuzzi.com
#'

# Define environment and download (as needed) and load data
# mySample will have the working dataset
init <- function() {
  #Clear workspace as needed
  # rm(list = ls())
  
  # Set directory and path info.  Put ourselves in the correct directory
  rootdir <-
    'F:/Users/Steve/Documents/ExData_Plotting1'
  setwd(rootdir)
  # download destination director and filenames
  destdir <- paste(rootdir, 'data',  sep = '/')
  destfilename <- 'householdpowerconsumption.zip'
  datafile <- paste(destdir, destfilename, sep = '/')
  
  # Download file if we do not have source zip
  if (!file.exists(datafile)) {
    if (!dir.exists(destdir)) {
      dir.create(destdir, FALSE)
    }
    print ('Downloading source data')
    myurl <-
      'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(myurl, datafile, mode = "wb")
    # and unzip the contents
    unzip(datafile, exdir = destdir)
  }
  else {
    print ("Using cached (on disk) source data")
  }
  
  # Read file and set NA to ?. File is semicolon delimited
  if (!exists('myData')) {
    myData <<- read.csv(
      file = paste(destdir, 'household_power_consumption.txt', sep = '/'),
      header = TRUE,
      sep = ";",
      na.strings = '?'
    )
    
    #Convert datetime columns
    myData[, 1] <<- as.Date(myData[, 1], "%d/%m/%Y")
    myData[, 2] <<-
      as.POSIXct(as.character(myData[, 2]), format = "%H:%M:%S")
    
    # New column that has consolidate date and timestamp for continuous plots over several days
    myData[, 'timestamp'] <<-
      as.POSIXct(paste(myData[, 1], strftime(myData[, 2], format = "%H:%M:%S")), format =
                   '%Y-%m-%d %H:%M:%S')
  }
  
  if (!exists('mySample')) {
    print("Generating subset of data")
    # Work with only 2007-02-01 and 2007-02-02
    mySample <<-
      subset(myData,
             myData$timestamp >= '2007-02-01' &
               myData$timestamp < '2007-02-03')
    
    # You could release the original/large dataset
    #if exists('myData') {
    #  rm(myData)
    #}
  }
  else {
    print ("Using cache subset data")
  }
  invisible(mySample)
}

# Make sure stuff looks good
sanityCheck <- function() {
  #Make sure no missing date or timestamps
  myData[!complete.cases(myData$Date),]
  myData[!complete.cases(myData$Time),]
  
  # Did data load correct?  Expecting 2,075,259
  if (nrow(myData) == 2075259) {
    print ("Loaded rows correctly")
  } else {
    print ("Row load mismatch")
  }
  
  # Did data load correct?  Expecting 9 + 1 columns
  if (ncol(myData) == 10) {
    print ("Loaded columns correctly")
  } else {
    print ("Column load mismatch")
  }
  
  
  # Memory Check
  print('Raw data size is:')
  print(object.size(myData), units = 'auto')
  # Make sure we have datetime and numbers from the read
  print('Check Date/Time as dates and new timestamp')
  str(myData)
  
  # 47 months in minutes is 2059000.  Are we close?
  print (paste(
    'Do we have almost all 47 months by minutes?  Days difference is: ',
    (nrow(myData) - 2059000) / 1440
  ))
}