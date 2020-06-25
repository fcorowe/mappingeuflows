#Dependencies
library(dplyr) # enables use of pipe operators
library(data.table) # large data table manipulation
library(mapdeck) # create an interactive flow map using mapdeck library
library(htmlwidgets) # save interactive map into a html format

# read in the RDS file with the full OD flows between European regions 
EU_flows <- readRDS("./data/EU_OD_flows.rds")

# the result of the for-loop below will :
# 1. omit the intra-regional flows;
# 2. filter flows in each country that are greater than 1,000, 
# or top 5% flows in countries where the largest flow is smaller than 1,000
# 3. normalise width with this equation for each country:
# Width=3*flows between a pair of Origin and Destination regions / max(OD flow)



country_OD_list <- list() # create an empty list

for (country in unique(EU_flows$ISO_code)) {
  
  OD_long  <- subset(EU_flows, ISO_code == country)
  
  # remove the flows within the same region
  OD_long <- OD_long %>% filter(Origin != Destination)
  
  # filter the rows based on flows <> 1000
  if(max(OD_long$flows) < 1000) {
    OD_long <- OD_long[OD_long$flows > quantile(OD_long$flows , 0.95 ) , ]
  } else {
    OD_long <- OD_long[which(OD_long$flows >= 1000), ]
  }


  # weighting to be used in the width of lines
  OD_long$line_width <- 3 * OD_long$flows/ max(OD_long$flows)
  
  # create a separate list object for each country
  country_OD_list[[country]] <- OD_long

}

# we use rbindlist function from data.table
# to combine the individual dataframes for each country to one
MergedData <- rbindlist(country_OD_list)

# mapdeck uses Mapbox maps, and to use Mapbox you need an access token.

#You can generate a token by following this link https://docs.mapbox.com/help/how-mapbox-works/access-tokens/


key <- 'user token' ## put your own token here

flowmap_EU <- mapdeck( token = key, style = 'mapbox://styles/mapbox/dark-v9',
                location = c(7.6, 46.3), zoom = 6, pitch = 45) %>%
  add_arc(
    data = MergedData
    , origin = c("or_Lon", "or_Lat")
    , destination = c("des_Lon", "des_Lat")
    , stroke_width = "line_width"
    , palette = "reds"
    
  )

# plot the interactive map
flowmap_EU

saveWidget(flowmap_EU, file="flowmap_EU.html", title = "Internal migration flows in Europe", selfcontained=TRUE)






