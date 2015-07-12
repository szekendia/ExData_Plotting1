## Coursera : Exploratory Data Analysis : Week 01 : Course Project 1
## Created by: szekendia

## Load data
if (!exists("powerdata")) { source("DataLoad.R") }

## PLOT 4
png.file <- paste(subfolder, "plot4.png", sep="/")

## Set locale to English to provide identical axis labels
myLocale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")
## Sys.setlocale("LC_TIME", "Hungarian")

## Initialize PNG graphic device
png(filename = png.file,
    width = 480, height = 480,
    units = "px",
    pointsize = 12,
    bg = "transparent",
    res = NA,
    restoreConsole = TRUE,
    type = "windows")

## Define plot frames, resize texts and set margin
## [original: par(mar = c(5.1, 4.1, 4.1, 2.1))]
par(mfcol = c(2, 2), cex = 0.8, c(5, 4, 4, 2))

with(powerdata, {
    ## Upper left frame : Plot 2
    plot(Time, Global_active_power,
         type = "l",
         xlab = "",
         ylab = "Global Active Power")

    ## Lower left frame : Plot 3
    plot(Time, Sub_metering_1,
         ylab = "Energy sub metering",
         xlab = "",
         type = "l",
         col = "black")
        
        ## Sub_metering_2 : red
         lines(Time, Sub_metering_2,
               type = "l",
               col = "red")
        
        ## Sub_metering_3 : blue
         lines(Time, Sub_metering_3,
               type = "l",
               col = "blue")
        
        ## Legend to top-right corner
        legend("topright",
               lty = 1,
               bty = "n",
               col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
               )

    ## Upper right frame : Voltage by Datetime
    plot(Time, Voltage,
         type = "l",
         xlab = "datetime")
    
    ## Lower right frame : Global reactive power by Datetime
    plot(Time, Global_reactive_power,
         type = "l",
         xlab = "datetime")
    })

## Close PNG graphic device
dev.off()

## Resest LC_TIME locale
Sys.setlocale("LC_TIME", myLocale)