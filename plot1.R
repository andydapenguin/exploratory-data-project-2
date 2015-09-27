# load required packages
library('dplyr')

# set working directory
nei_path <- "./Downloads/Chromium/exdata-data-NEI_data/summarySCC_PM25.rds"
scc_path <- "./Downloads/Chromium/exdata-data-NEI_data/Source_Classification_Code.rds"

# load entire data set
total_NEI <- readRDS(nei_path)
SCC <- readRDS(scc_path)

# summarise total data for plot 1: group by year, sum emissions
plot1_data <- total_NEI %>%
   group_by(year) %>%
      summarise(emissions = sum(Emissions)) %>%
         arrange(year) %>%
            print(plot1_data)

with(plot1_data, plot(year, emissions,
     type = "b", col = "red", cex = 1.5, lwd = 4, 
     main = "US Pollution for 1999, 2002, 2005 and 2008",
     xlab = "Year", ylab = "Total PM25 Emissions"))

dev.copy(png, file = './Documents/Jowwbah - Type Stuff/Data/exploratory-data/project2/plot1.png')
dev.off()