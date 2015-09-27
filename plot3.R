# load required packages
library('dplyr')

# set working directory
nei_path <- "./Downloads/Chromium/exdata-data-NEI_data/summarySCC_PM25.rds"
scc_path <- "./Downloads/Chromium/exdata-data-NEI_data/Source_Classification_Code.rds"

# load entire data set
total_NEI <- readRDS(nei_path)
SCC <- readRDS(scc_path)

# summarise data for plot 3: filter for Baltimore (fips == '24510')
# keep $type 
plot3_data <- total_NEI %>%
   filter(fips == '24510') %>%
      group_by(year, type) %>%
         summarise(emissions = sum(Emissions)) %>%
            print(plot2_data)



dev.copy(png, file = './Documents/Jowwbah - Type Stuff/Data/exploratory-data/project2/plot2.png')
dev.off()