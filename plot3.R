df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

format(object.size(df), units = "MB", standard = "SI")

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")


df2 <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]
df2$Time <- strptime(df2$Time, format="%H:%M:%S")

df2[1:1440, "Time"] <- format(df2[1:1440, "Time"],"2007-02-01 %H:%M:%S")
df2[1441:2880, "Time"] <- format(df2[1441:2880, "Time"],"2007-02-02 %H:%M:%S")

plot(df2$Time, df2$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering",
     main = "Energy sub-metering")
lines(df2$Time, as.numeric(df2$Sub_metering_1))
lines(df2$Time, as.numeric(df2$Sub_metering_2), col = "red")
lines(df2$Time, as.numeric(df2$Sub_metering_3), col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

