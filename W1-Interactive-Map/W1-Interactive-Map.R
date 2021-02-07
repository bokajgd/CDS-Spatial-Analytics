# Creating an interactive browser-accessible html map of The Blue Mountains

# Importing packages
# Uncomment and run below line if pacaman is not already installed
# instal.packages('pacman')
library(pacman)
p_load(leaflet, htmltools, htmlwidgets, tidyverse)

# Reading in the provided data
data <- read_csv("data/RCFeature.csv")


# A single location is missing coordinates and must be removed
data<- data %>% filter(!is.na(Longitude)) %>% filter(!is.na(Latitude))


#### CREATING MAP ####

# Setting the baseline location
center_location <-  leaflet() %>% 
  setView(lng = mean(data$Longitude),
          lat = mean(data$Latitude),
          zoom = 12)
        
#Adding various ESRI background layers
esri <- grep("^Esri", providers, value = TRUE)
# Removing layers which have no available data for our specific area 
esri <- esri[esri != "Esri.WorldTerrain"]
esri <-  esri[esri != "Esri.OceanBasemap"]
esri <-  esri[esri != "Esri.DeLorme"]
esri <-  esri[esri != "Esri.WorldPhysical"]

for (provider in esri) {
  center_location <- center_location %>% addProviderTiles(provider, group = provider)
}


# Making basic map
BlueMounatains_map <- center_location %>%
  addLayersControl(baseGroups = names(esri),
                   options = layersControlOptions(collapsed = FALSE)) %>%
  # Adding minimap
  addMiniMap(tiles = esri[[1]], toggleDisplay = TRUE,
             position = "bottomright") %>%
  # Enabling measurements
  addMeasure(
    position = "bottomleft",
    primaryLengthUnit = "meters",
    primaryAreaUnit = "sqmeters",
    activeColor = "#3D535D",
    completedColor = "#7D4479") %>% 
  htmlwidgets::onRender("
                        function(el, x) {
                        var myMap = this;
                        myMap.on('baselayerchange',
                        function (e) {
                        myMap.minimap.changeLayer(L.tileLayer.provider(e.name));
                        })
                        }") %>% 
  addControl("", position = "topright")

BlueMounatains_map


# Adding interactive makers
BlueMounatains_map_with_markers <- BlueMounatains_map %>% 
  addTiles() %>% 
  # Adding markers
  addMarkers(lng = data$Longitude, 
             lat = data$Latitude,
             popup = paste("ID:", data$FeatureID, "<br/>",
                           "Type:", data$FeatureType, "<br/>",
                           "Description:", data$Description,"<br/>",
                           "Coordinates:", data$Latitude,",", data$Longitude)
             )

# Showing plot
BlueMounatains_map_with_markers


# Clustering markers
BlueMounatains_map_with_clustering <- BlueMounatains_map %>% 
  addTiles() %>% 
  addMarkers(lng = data$Longitude, 
             lat = data$Latitude,s
             popup = paste("ID:", data$FeatureID, "<br/>",
                           "Type:", data$FeatureType, "<br/>",
                           "Description:", data$Description,"<br/>",
                           "Coordinates:", data$Latitude,",", data$Longitude),
             clusterOptions = markerClusterOptions()
             )

# Showing plot
BlueMounatains_map_with_clustering

# Saving the map
saveWidget(BlueMounatains_map_with_markers, "Interactive-Map.html", selfcontained = TRUE)

#### CONCLUSION ####
# Clustering the individual locations together provides makes the map more visually pleasing as many points are chaotically located close together. 
# However, applying this funciton makes it impossible to see the exact location of each point and, therefore, I would not recommend it.
