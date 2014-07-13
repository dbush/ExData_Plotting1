source("loadData.R")
data <- loadData()

print("Creating plot4.png...")

png("plot4.png", width=480, height=480)

# 2 rows, 2 columns
par(mfrow=c(2,2))

with(
  data,
  {
    plot(
      data$DateTime, data$Global_active_power,
      type="l",
      xlab="",
      ylab="Global Active Power")
    
    plot(
      data$DateTime, data$Voltage, 
      type="l",       
      xlab="datetime",
      ylab="Voltage")
    
    plot(
      data$DateTime, data$Sub_metering_1, 
      type="l", 
      xlab="",
      ylab="Energy sub metering")
    
    lines(data$DateTime, data$Sub_metering_2, col="red")
    lines(data$DateTime, data$Sub_metering_3, col="blue")
    
    legend(
      "topright",
      col=c("black", "red", "blue"),
      c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      lty=1,
      bty = "n")
 
    plot(
      data$DateTime, data$Global_reactive_power, 
      type="l",
      xlab="datetime", 
      ylab="Global_reactive_power")
  }
)


dev.off()

print("Done.")