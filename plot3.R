# This is the script for plot3

# Setting up the work directory and useful library
setwd("E:/DataScience/Exploratory-Data-Project-2")
library(ggplot2)

# Reading two rds files into memory
all_data <- readRDS("summarySCC_PM25.rds")
scc_data <- readRDS("Source_Classification_Code.rds")

# Filtering the data of Baltimore out of the full data set
data_2 <- all_data[all_data$fips == "24510", ]

# Before real plotting, creating a blank pic
png(filename = "plot3.png",width = 480, height = 480,units = "px") 

# Plot the figure
g <- ggplot(data_2, aes(year, Emissions, color = type)) 
g + geom_line(stat = "summary", fun.y = "sum") + 
 ylab(expression('Total PM2.5 Emissions')) + 
 ggtitle("Total Emissions of Baltimore ( 1999 - 2008)") 

# Done with plotting
dev.off() 
