## Coursera : Exploratory Data Analysis : Week 01 : Course Project 1
## Created by: szekendia

library(sqldf)

## ***********************************************************************
##                 Verify available memory (Windows OS only)
## ***********************************************************************
## systeminfo <- system("systeminfo /FO TABLE", intern = TRUE, wait = TRUE, show.output.on.console = TRUE, minimized = TRUE)


## ***********************************************************************
##                         Getting compressed data
## ***********************************************************************

## UC Irvine Machine Learning Repository: Electric power consumption [20Mb]
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

subfolder <- "./EDA"                                             ## Subfolder within the working directory
destfile <- paste(subfolder, "power_consumption_data_set.zip", sep="/")     ## Local, compressed destination filename including subfolder

if(!file.exists(subfolder)) {dir.create(subfolder)}              ## Create subfolder if not exists
download.file(fileURL, destfile, mode="wb")                      ## mode="wb" for compressed (binary) files

filelist <- unzip(destfile, list=TRUE)                           ## list compressed files
unzip(destfile, files=filelist$Name, exdir=subfolder)            ## extract (unzip) files
datasource <- paste(subfolder, filelist$Name, sep="/")           ## Local, extracted filename including subfolder


## ***********************************************************************
##                                Load data
## ***********************************************************************

options(warn=-1)

powerdata <- read.csv.sql(datasource,
                     sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                     header = TRUE,
                     sep = ";",
                     colClasses = c(rep("character", 2), rep("numeric",7))
                    )

options(warn=0)

## Convert date and time

powerdata$Time <- strptime(paste(powerdata$Date, powerdata$Time), "%d/%m/%Y %H:%M:%S")
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")

## ***********************************************************************
##                              Making plots
## ***********************************************************************

## Enable/Disable the following lines as required
## source("plot1.R")
## source("plot2.R")
## source("plot3.R")
## source("plot4.R")
