##-----------------------------------------------##
##    Author: Adela Sobotkova                    ##
##    Institute of Culture and Society           ##
##    Aarhus University, Aarhus, Denmark         ##
##    adela@cas.au.dk                             ##
##-----------------------------------------------##

#### Goals ####

# - Modify the provided code to improve the resulting map

# We highlighted all parts of the R script in which you are supposed to add your
# own code with: 

# /Start Code/ #

print("Hello World") # This would be your code contribution

# /End Code/ #

#### Required R libraries ####

# We will use the sf, raster, and tmap packages.
# Additionally, we will use the spData and spDataLarge packages that provide new datasets.

# Uncomment and run the line below if pacman is not installed locally on your computer
# install.packages('pacman') 
library(pacman)
# Uncomment and run the line below if spDataLarge is not installed locally on your computer
#install.packages("spDataLarge", repos = "https://nowosad.github.io/drat/", type = "source")
p_load(sf, raster, tmap, spData, spDataLarge)

#### Data sets #### 

# We will use two data sets: `nz_elev` and `nz`. They are contained by the libraries
# The first one is an elevation raster object for the New Zealand area, and the second one is an sf object with polygons representing the 16 regions of New Zealand.

#### Existing code ####

# We wrote the code to create a new map of New Zealand.
# Your role is to improve this map based on the suggestions below.

tm_shape(nz_elev)  +
  tm_raster(title = "elev", 
            style = "cont",
            palette = "BuGn") +
  tm_shape(nz) +
  tm_borders(col = "red", 
             lwd = 3) +
  tm_scale_bar(breaks = c(0, 100, 200),
               text.size = 1) +
  tm_compass(position = c("LEFT", "center"),
             type = "rose", 
             size = 2) +
  tm_credits(text = "A. Sobotkova, 2020") +
  tm_layout(main.title = "My map",
            bg.color = "orange",
            inner.margins = c(0, 0, 0, 0))

#### Exercise I ####

# 1. Change the map title from "My map" to "New Zealand".
# 2. Update the map credits with your own name and today's date.
# 3. Change the color palette to "-RdYlGn". 
#    (You can also try other palettes from http://colorbrewer2.org/)
# 4. Put the north arrow in the top right corner of the map.
# 5. Improve the legend title by adding the used units (m asl).
# 6. Increase the number of breaks in the scale bar.
# 7. Change the borders' color of the New Zealand's regions to black. 
#    Decrease the line width.
# 8. Change the background color to any color of your choice.

# Your solution

# /Start Code/ #

# Plotting updated map
tm_shape(nz_elev)  +
  tm_raster(title = "Elevation (m ASL)         ", 
            style = "cont",
            palette = "-RdYlGn") +
  tm_layout(scale = 1, legend.title.siz = 1, # Making frame for legend
            legend.bg.color = "white", legend.bg.alpha = .6, 
            legend.frame = "gray50")+ 
  tm_shape(nz) +
  tm_borders(col = "black", 
             lwd = 1.25) +
  tm_scale_bar(breaks = seq(0, 250, by = 50), # Sequence of numbers from 0 - 250 with a jump of 50
               text.size = 0.5,
               position = c(0.705, 0.04)) + # Setting position according to self-defined  coordinates 
  tm_compass(position = c("RIGHT", "top"),
             type = "rose", 
             size = 2) +
  tm_credits(text = "Jakob G. Damgaard, Feburary, 2021",
             position = c(0.51, 0.01)) + # Setting position according to self-defined coordinates 
  tm_layout(main.title = "New Zealand",
            bg.color = "#C1CAEB", # Colour represents water
            inner.margins = c(0, 0, 0, 0))

# /End Code/ #

#### Exercise II ####

# 9. Read two new datasets, `srtm` and `zion`, using the code below.
#    To create a new map representing these datasets.

srtm = raster(system.file("raster/srtm.tif", package = "spDataLarge"))
zion = read_sf(system.file("vector/zion.gpkg", package = "spDataLarge"))

# Your solution

# /Start Code/ #

# Plotting a new map of Zion National Park
tm_shape(srtm)  +
  tm_raster(title = "Elevation (m ASL)        ", 
            breaks= seq(1000, 3000, by = 500),
            style = "cont",
            palette = "-RdYlGn") +
  tm_layout(scale = 1, 
            legend.position = c(0.6, 0.85), legend.title.siz = 1,  # Making frame for legend
            legend.bg.color = "white", legend.bg.alpha = .6, 
            legend.frame = "gray50")+ 
  tm_shape(zion) +
  tm_borders(col = "black", 
             lwd = 2,
             lty = 3) + # Making border dashed
  tm_scale_bar(breaks = seq(0, 10, by = 2),
               text.size = 0.75,
               position = c(0.03, 0.04)) +
  tm_compass(position = c("RIGHT", "top"),
             type = "rose", 
             size = 2) +
  tm_credits(text = "Jakob G. Damgaard, Feburary, 2021",
             position = c(0.024, 0.01), 
              size = 0.9) +
  tm_layout(main.title = "Zion National Park",
            bg.color = "#C1CAEB",
            inner.margins = c(0, 0, 0, 0))


# /End Code/ #
