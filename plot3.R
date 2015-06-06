# plot graph 3 as instructions

plot3 <- function(){        
        # subset original data into two columns
        data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
        data$Date <- as.Date(as.character(data$Date), format = "%d/%m/%Y")
        data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
        data <- with(data, cbind(paste(as.character(Date), as.character(Time), sep=" "), Sub_metering_1, Sub_metering_2, Sub_metering_3))
        data <- as.data.frame(data)
        names(data)[1] <- "Time"
        data$Time <- strptime(data$Time, format = "%Y-%m-%d %H:%M:%S")
        data[,2] <- as.numeric(levels(data[,2])[data[,2]])
        data[,3] <- as.numeric(levels(data[,3])[data[,3]])
        data[,4] <- as.numeric(levels(data[,4])[data[,4]])
        
        # plot the graph
        png(file = "plot3.png")
        with(data, plot(Time, Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab = ""))
        with(data, lines(Time, Sub_metering_1, col = "black"))
        with(data, lines(Time, Sub_metering_2, col = "red"))
        with(data, lines(Time, Sub_metering_3, col = "blue"))
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = 1, col = c("black", "red", "blue")) 
        dev.off()
        
        
        
}