# This is the script for plot5

# Setting up the work directory
setwd("E:/DataScience/Exploratory-Data-Project-2")
library(ggplot2)

# Reading two rds files into memory
all_data <- readRDS("summarySCC_PM25.rds")
scc_data <- readRDS("Source_Classification_Code.rds")

# Filtering the data of Baltimore out of the full data set
data_2 <- all_data[all_data$fips == "24510", ]

# Before real plotting, creating a blank pic
png(filename = "plot5.png",width = 480, height = 480,units = "px") 

# Processing the data related to Motor
motor <- grep("motor", scc_data$Short.Name, ignore.case = T) 
motor <- scc_data[motor, ] 
motor <- data_2[data_2$SCC %in% motor$SCC, ] 
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

# Plotting the Motor data
plot(motorEmissions, type = "l", xlab = "Year",  
    main = "Total Emissions -- Motor of Baltimore City (1999-2008)",  
    ylab = expression('Total PM2.5 Emission')) 

# Done with plotting
dev.off() 
