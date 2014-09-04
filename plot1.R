#setwd ("d:\\tonyk\\coursera\\exploratory_analysis\\project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

summary <- aggregate (NEI$Emissions, by=list(NEI$year), FUN=sum)
colnames (summary) <- c("Year", "Emissions")

with (summary, {
  plot (Year, Emissions, type='l')
}) 
