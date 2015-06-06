# plot graph 2 as instruction

plot2 <- function(){
        # subset original data into two columns
        data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
        data$Date <- as.Date(as.character(data$Date), format = "%d/%m/%Y")
        data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
        data <- with(data, cbind(paste(as.character(Date), as.character(Time), sep=" "), Global_active_power))
        data <- as.data.frame(data)
        names(data)[1] <- "Time"
        data$Time <- strptime(data$Time, format = "%Y-%m-%d %H:%M:%S")
        data[,2] <- as.numeric(levels(data[,2])[data[,2]])
        
        # plot and save the graph
        png(file = "plot2.png")
        with(data, plot(Time, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = ""))
        with(data, lines(Time, Global_active_power))
        dev.off()
        
}