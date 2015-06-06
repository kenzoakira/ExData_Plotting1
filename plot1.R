# plot graph 1 as insturction

plot1 <- function(){
        data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
        data$Date <- as.Date(as.character(data$Date), format = "%d/%m/%Y")
        data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
        
        png(file = "plot1.png")
        with(data, hist(Global_active_power,col = "red", 
                        main = "Global Active Power", 
                        xlab = "Global Active Power (kilowatts)"))
        dev.off()
      
}