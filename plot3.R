## Coursera : Exploratory Data Analysis : Week 01 : Course Project 1
## Created by: szekendia

## Load data

if (!exists("powerdata")) { source("DataLoad.R") }

## PLOT 3
png.file <- paste(subfolder, "plot3.png", sep="/")

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

## REdefine margin [original: par(mar = c(5.1, 4.1, 4.1, 2.1))]
par(mar = c(5, 4, 4, 2))

## Sub_metering_1: black
with(powerdata,
     plot(Time, Sub_metering_1,
          ylab = "Energy sub metering",
          xlab = "",
          type = "l",
          col = "black")
     )

## Sub_metering_2 : red
with(powerdata,
     lines(Time, Sub_metering_2,
          type = "l",
          col = "red")
     )

## Sub_metering_3 : blue
with(powerdata,
     lines(Time, Sub_metering_3,
          type = "l",
          col = "blue")
     )

## Legend to top-right corner
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Close PNG graphic device
dev.off()

## Resest LC_TIME locale
Sys.setlocale("LC_TIME", myLocale)