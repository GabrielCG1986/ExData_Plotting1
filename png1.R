#Load the dataset to get the data.

df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Transfor the column with dates (a character vector) into a Date object.

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

#Select the dates we're interested in.

df2 <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

#Let's open the graphic device "png"

png(filename = "plot1.png")

#And let's plot!

hist(as.numeric(df2$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

#Don't forget to close the device!

dev.off()