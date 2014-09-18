# Script to create plot2.png
#
# Read in the data file.
#
NEI <- readRDS("summarySCC_PM25.rds")

#
# Subset records for Baltimore, sum Emissions by year into "summary".  Rename the columns.
#
baltimore <- subset (NEI, NEI$fips == "24510")
summary <- aggregate (
  baltimore$Emissions, 
  by=list(baltimore$year), FUN=sum)
colnames (summary) <- c("Year", "Emissions")

#
# Output the plot2.png required.
#
png(filename="plot2.png", width=480, height=480, units="px")
with (summary, 
  plot (
    Year, Emissions, type = "l",
    ylab="Emissions (tons)", 
    main="PM2.5 Emissions in Baltimore City"
  )
) 
dev.off ()
