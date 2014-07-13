loadData <- function() {
  
  fileName <- "household_power_consumption.txt"
  classes <- c("character", "character", rep("numeric", 7))
  
  print("Reading data...")
  
  data <- read.table(
            fileName, 
            header=TRUE,
            sep=";",            
            na.strings="?",
            colClasses=classes
        )
  
  # Convert the date into an actual date
  print("Converting time and date...")
  data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")

  # Subsetting the data...
  print("Subsetting...")
  data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))    
  
  # Done
  print("Finished reading data")
  return(data)
}