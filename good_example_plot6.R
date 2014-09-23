#Coursera Course - Exploratory Data Analysis
#Project #2, Plot #5
#Assignment: How have emissions from motor vehicle sources changed from 1999-
#2008 in Baltimore City?
#
#Load the libraries/functions needed for this plot
library(plyr) 
library(ggplot2) 
#
#Read in the PM2.5 Emissions Data from the EPA National Emissions Inventory 
#Database 
NEI <- readRDS("summarySCC_PM25.rds") 
#
#Motor vehicle emissions in LA County (06037) & Baltimore (24510).  
#It is assumed to mean on-road motorized vehicles
MV_LA_Baltimore <- subset(NEI, type=="ON-ROAD" & (fips == "06037" | fips == "24510"))
#
#Sum motor vehicle emissions by year by city (variable-fips)
MV_LA_Baltimore_PM25_By_Year <- ddply(MV_LA_Baltimore, .(year,fips), function(x) 
  sum(x$Emissions)) 
#
#Rename type the fips column to Location
MV_LA_Baltimore_PM25_By_Year <- rename(MV_LA_Baltimore_PM25_By_Year,c("fips"="Location"))
#
#Rename type the sum emissions column to Emissions
MV_LA_Baltimore_PM25_By_Year <- rename(MV_LA_Baltimore_PM25_By_Year,c("V1"="Emissions"))
#
#Change location numbers to location names for Plotting
MV_LA_Baltimore_PM25_By_Year$Location <- 
  ifelse(MV_LA_Baltimore_PM25_By_Year$Location == "06037", "LA County", "Baltimore") 
#
#Create a line plot to display emissions changes over the years for 
#motor vehicles in Baltimore
png("plot6.png", height=800, width=800) 
qplot(year, Emissions, data=MV_LA_Baltimore_PM25_By_Year, color=Location,geom="line") + 
  ggtitle(expression("LA County & Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) + 
  geom_line(size=2)+xlab("Year") + 
  ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)")) 
dev.off() 
