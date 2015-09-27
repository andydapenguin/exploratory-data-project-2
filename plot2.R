# load required packages
library('dplyr')

# set working directory
nei_path <- "./Downloads/Chromium/exdata-data-NEI_data/summarySCC_PM25.rds"
scc_path <- "./Downloads/Chromium/exdata-data-NEI_data/Source_Classification_Code.rds"

# load entire data set
total_NEI <- readRDS(nei_path)
SCC <- readRDS(scc_path)

# summarise data for plot 2: filter for Baltimore (fips == '24510')
plot2_data <- total_NEI %>%
   filter(fips == '24510') %>%
      group_by(year) %>%
         summarise(emissions = sum(Emissions)) %>%
            print(plot2_data)

with(plot2_data, plot(year, emissions,
     type = "b", col = "blue", lwd = 6, cex = 2.5,
     main = "Baltimore, MD Pollution for 1999, 2002, 2005 and 2008",
     xlab = "Year", ylab = "Total PM25 Emissions"))

dev.copy(png, file = './Documents/Jowwbah - Type Stuff/Data/exploratory-data/project2/plot2.png')
dev.off()