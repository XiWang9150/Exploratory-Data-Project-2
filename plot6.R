# This is the script for plot6

# Setting up the work directory and useful library
setwd("E:/DataScience/Exploratory-Data-Project-2")
library(ggplot2)

# Reading two rds files into memory
all_data <- readRDS("summarySCC_PM25.rds")
scc_data <- readRDS("Source_Classification_Code.rds")

# Filtering the data of Baltimore and LA out of the full data se
data_2 <- all_data[all_data$fips == "24510" | all_data$fips == "06037",  ]

# Before real plotting, creating a blank pic
png(filename = "plot6.png",width = 480, height = 480,units = "px") 

# Processing Motor data
motor <- grep("motor", scc_data$Short.Name, ignore.case = T) 
motor <- scc_data[motor, ] 
motor <- data_2[data_2$SCC %in% motor$SCC, ] 

# Plotting the data
g <- ggplot(motor, aes(year, Emissions, color = fips)) 
g + geom_line(stat = "summary", fun.y = "sum") + 
   ylab(expression('Total PM2.5 Emissions')) + 
   ggtitle("Total Emissions comparison (Baltimore .vs. Los Angeles 1999-2008)")+ 
   scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore")) 

# Done with plotting
dev.off() 

