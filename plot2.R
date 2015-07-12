## Coursera : Exploratory Data Analysis : Week 01 : Course Project 1
## Created by: szekendia

## Load data

if (!exists("powerdata")) { source("DataLoad.R") }

## PLOT 2
png.file <- paste(subfolder, "plot2.png", sep="/")

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

## Redefine margin [original: par(mar = c(5.1, 4.1, 4.1, 2.1))]
par(mar = c(5, 4, 4, 2))

## Generate plot
plot(powerdata$Time, powerdata$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Close PNG graphic device
dev.off()

## Resest LC_TIME locale
Sys.setlocale("LC_TIME", myLocale)