# This is the script for plot4

# Setting up the work directory
setwd("E:/DataScience/Exploratory-Data-Project-2")

# Reading two rds files into memory
all_data <- readRDS("summarySCC_PM25.rds")
scc_data <- readRDS("Source_Classification_Code.rds")

# Before real plotting, creating a blank pic 
png(filename = "plot4.png",width = 480, height = 480,units = "px") 

# Processing data about coal data
coal <- grep("coal", scc_data$Short.Name, ignore.case = T) 
coal <- scc_data[coal, ] 
coal <- all_data[all_data$SCC %in% coal$SCC, ] 
coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum") 

# Plotting the figure of Coal
plot(coalEmissions, type = "l", xlab = "Year",  
    main = "Total Emissions -- Coal(1999-2008)",  
    ylab = expression('Total PM2.5 Emission')) 

# Done with plotting
dev.off() 
