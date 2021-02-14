##-----------------------------------------------##
##    Author: Adela Sobotkova                    ##
##    Institute of Culture and Society           ##
##    Aarhus University, Aarhus, Denmark         ##
##    adela@cas.au.dk                             ##
##-----------------------------------------------##

#### Goals ####

# - Understand the provided datasets
# - Learn how to reproject spatial data
# - Limit your data into an area of interest
# - Create a new map

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

# We will use two data sets: `srtm` and `zion`.
# The first one is an elevation raster object for the Zion National Park area, and the second one is an sf object with polygons representing borders of the Zion National Park.

srtm <- raster(system.file("raster/srtm.tif", package = "spDataLarge"))
zion <- read_sf(system.file("vector/zion.gpkg", package = "spDataLarge"))

# Additionally, the last exercise (IV) will used the masked version of the `lc_data` dataset.

study_area <- read_sf("data/study_area.gpkg")
lc_data <- raster("data/example_landscape.tif")
lc_data_masked <- mask(crop(lc_data, study_area), study_area)

#### Exercise I ####

# 1. Display the `zion` object and view its structure.
# What can you say about the content of this file?
# What type of data does it store? 
# What is the coordinate system used?
# How many attributes does it contain?
# What is its geometry?
# 2. Display the `srtm` object and view its structure.
# What can you say about the content of this file? 
# What type of data does it store?
# What is the coordinate system used? 
# How many attributes does it contain?
# How many dimensions does it have? 
# What is the data resolution?

# Your solution (type answer to the questions as code comments and the code used)

# /Start Code/ #

### 1 ###

# Plotting the object
plot(zion)

# Printing basic information about the object 'zion'
zion 
crs(zion) #GRS80

# The 'zion' object contains vector data which represent points (X and Y coordinates) that form a polygon shape. 
# This polygon outlines the borders of the 'Zion National Park'. The CRS system used for mapping this object is GRS80.
# The data object contains 1 feature and 11 fields.



### 2 ###
# Plotting the object
plot(srtm)

# Printing basic information
srtm

# The 'srtm' object is a raster data file which contains data on the elevation above sea level of the area in and around 'Zion National Park'-
# The resolution of the raster object is 0.0008333333, 0.0008333333  (x, y).
# The dimensions are 457 x 465 x 1. From this, it is clear that the raster only has one colour channel.
# The object uses the WGS84 CSR system

# /End Code/ #

#### Exercise II ####

# 1. Reproject the `srtm` dataset into the coordinate reference system used in the `zion` object. 
# Create a new object `srtm2`
# Vizualize the results using the `plot()` function.
# 2. Reproject the `zion` dataset into the coordinate reference system used in the `srtm` object.
# Create a new object `zion2`
# Vizualize the results using the `plot()` function.


# Your solution

### 1 ###

# /Start Code/ #
zion_crs <- crs(zion, asText = TRUE) # Get the CRS from the 'zion' object
srtm2 <- projectRaster(srtm, crs = zion_crs) # Project 'srtm' to the 'zion' CRS
plot(srtm) # Plot the original 'strm'
plot(srtm2) # Plot the new 'strm'

### 2 ###

srtm_crs <- crs(srtm, asText = TRUE)  # Get the CRS from the 'srtm' object
zion2 <- st_transform(zion, crs = srtm_crs) # Project 'zion' to the 'srtm'  # Get the CRS from the 'zion' object
plot(zion, max.plot = 11) # Plo the original 'zion'.
plot(zion2, max.plot = 11) # Plot the new 'zion'.


# /End Code/ #
