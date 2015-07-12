## Coursera : Exploratory Data Analysis : Week 01 : Course Project 1
## Created by: szekendia

## Load data

if (!exists("powerdata")) { source("DataLoad.R") }

## PLOT 1
png.file <- paste(subfolder, "plot1.png", sep="/")

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

## Generate histogram
hist(powerdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Close PNG graphic device
dev.off()