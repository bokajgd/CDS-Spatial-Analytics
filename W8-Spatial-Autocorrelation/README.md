# W6 - Analysing the spatial distribution of burial mounds in Kazalnak Valley
# Overview 

**Jakob Grøhn Damgaard, March 2021** <br/>
This repository contains the W6 assignment for the course *Spatial Analytics*

# Code
The code to execute the tasks can be found in the files *W6-Bivariate-Point-Patterns.Rmd*<br/>
A HTML rendered version of the markdown can be found in the file *W6-Bivariate-Point-Patterns.html* <br/>

# Data and outputs
All the necessary data files are located in the *data* folder. <br>

Data used: <br>
**KAZ_mounds.shp**: A shapefile containing the GPS coordinates of the locations of the marked burial mounds
<br>
<br>
From the file, two plots have been saved as *jpeg* files. <br>
<br>
Outputs: <br>
**mound_locations.jpeg**: A simple plot of the mound locations (scale is irrelevant) <br>
**csr_analysis_plot.jpeg**: A plot of the estimated K-function against the theoretical K-function for a completely spatially random distribution (including shaded envelope)

## Conclusion
The final plot (*mound_locations.jpeg*) shows the estimated K-function for the spatial distribution of the mounds along with an 'envelope' that the estimated K-function should statistically be confined within if they are truly randomly distributed. When assessing this plot, it is evident that the estimated K-function deviates greatly from the flat theoretical line as well as the statistical 'envelope'. This serves as statistical evidence that the mounds are not completely randomly distributed. By viewing the plot of the mound locations (*mound_locations.jpeg*) it is evident that the mounds are to a large degree clustered and especially one large, dense cluster of mounds is visible in the top right corner.


# Download folder locally
To locally download a compressed zip version of this repository, one can zip the entire repository from GitHub by navigating back to the home page of the repository and clicking the *Code* button and then *Download ZIP*. <br/>
<br>
All instructions for executing the code can be found in the scripts.

 
