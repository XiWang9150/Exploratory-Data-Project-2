# This is the script for plot2

# Setting up the work directory
setwd("E:/DataScience/Exploratory-Data-Project-2")

# Reading two rds files into memory
all_data <- readRDS("summarySCC_PM25.rds")
scc_data <- readRDS("Source_Classification_Code.rds")

# Filtering the data of Baltimore out of the full data set
data_2 <- all_data[all_data$fips == "24510", ]

# Before real plotting, creating a blank pic
png(filename = "plot2.png",width = 480, height = 480,units = "px") 

# Main part to compute total emission from year 1999 to year 2008 in Baltimore
all_emissions <- aggregate(data_2$Emissions, list(data_2$year), FUN = "sum")

# Plot the figure
plot(all_emissions, type = "l", xlab = "Year",
     main = "Total Emissions of Baltimore ( 1999 - 2008 )",  
     ylab = expression('Total PM2.5 Emission'))

# Done with plotting
dev.off() 
