# plot graph 4 as instructions

plot4 <- function(){
        # preprocess data
        data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
        data$Date <- as.Date(as.character(data$Date), format = "%d/%m/%Y")
        data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
        data <- with(data, cbind(paste(as.character(Date), as.character(Time), sep=" "),Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3))
        data <- as.data.frame(data)
        names(data)[1] <- "Time"
        data$Time <- strptime(data$Time, format = "%Y-%m-%d %H:%M:%S")
        asnumeric <- function(x){
                x <- as.numeric(levels(x)[x])
        }
        for(i in 2:7){
                data[,i] <- asnumeric(data[,i])
        }
        
        # plot gragh
        png(file = "plot4.png")
        par(mfrow = c(2,2),mar = c(4, 4, 2, 1), oma = c(0,0,2,0))
        
        # plot upleft
        with(data, plot(Time, Global_active_power, type = "n", ylab = "Global Active Power", xlab = ""))
        with(data, lines(Time, Global_active_power))
        # plot upright
        with(data, plot(Time, Voltage, type = "n", xlab = "datetime"))
        with(data, lines(Time, Voltage))        
        # plot bottomleft
        with(data, plot(Time, Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab = ""))
        with(data, lines(Time, Sub_metering_1, col = "black"))
        with(data, lines(Time, Sub_metering_2, col = "red"))
        with(data, lines(Time, Sub_metering_3, col = "blue"))
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = 1, col = c("black", "red", "blue"), cex = 0.75, bty = "n") 
        # plot bottomright
        with(data, plot(Time, Global_reactive_power, type = "n", xlab = "datetime"))
        with(data, lines(Time, Global_reactive_power)) 
        
        dev.off()
        
        
}