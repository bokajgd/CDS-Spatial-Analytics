# W8 - Spatial Autocorrelation
# Overview 

**Jakob Grøhn Damgaard, March 2021** <br/>
This repository contains the W8 assignment for the course *Spatial Analytics*
<br>
The purpose of this project is to analyse and check for spatial autocorrelation in the distribution of unmarried men in Denmark in 2020. The spatial analysis is performed at a municipality level using Moran's I test.

# Code
The code to execute the tasks can be found in the files *W8-Spatial-Autocorrelation.Rmd*<br/>
A HTML rendered version of the markdown can be found in the file *W8-Spatial-Autocorrelation.html* <br/>

# Data and outputs
All the necessary data files are located in the *data* folder. <br>

Data used: <br>
**data/gadm36_DNK_2_sp.rds**: An *.rds* containing multipolygons of all Danish municpalities
**civilstatus_DK.csv**: A *.csv* containing data on the civil status of Danish adults on a municipality level
<br>

## Conclusion
Both the analytical approach and the simulation based approach for analysing the spatial correlation yielded  z-scores (slightly negative ~ -0.006) close to 0 and both scores were not significant (p>0.05). This means that we cannot reject the null hypothesis and, hence, suggests that the distribution of unmarried men in 2020 is not spatially correlated at a municipality level. Thus unmarried men are spatially distributed randomly across Denmark and the are no inter-dependencies across municipality borders. 
<br>
It would be interesting to run a similar analysis at a more fine-grained level of geographical tessellation (e.g. zip codes) or with different definitions of neighbours.


# Download folder locally
To locally download a compressed zip version of this repository, one can zip the entire repository from GitHub by navigating back to the home page of the repository and clicking the *Code* button and then *Download ZIP*. <br/>
<br>
All instructions for executing the code can be found in the scripts.

 
