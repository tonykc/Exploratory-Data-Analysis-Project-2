#setwd ("d:\\tonyk\\coursera\\exploratory_analysis\\project2")

#
# Read in the data file.
#
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#
# Sum Emissions by year into "summary".  Rename the columns.
#
summary <- aggregate (NEI$Emissions, by=list(NEI$year), FUN=sum)
colnames (summary) <- c("Year", "Emissions")

#
# Output the plot1.png required.
#
png(filename="plot1.png", width=480, height=480, units="px")
with (summary, {
  plot (
    Year, Emissions/1000000, type='l', 
    ylab="Emissions (Million tons)", 
    main="PM2.5 Emissions in U.S.")
}) 
dev.off ()
