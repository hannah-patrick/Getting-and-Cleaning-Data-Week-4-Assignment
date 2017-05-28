    df <- read.csv("tidydata.txt", sep=" ")
    tidydata <- read.csv("averaged_tidydata.txt", sep=" ")

Provided dataset
================

The data for the project can be found here:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

It is also in this course repository. Information on the original
features and the experiments to collect the data can be found in the
features\_info.txt and README.txt.

Any changes to the varibale names to the data are highlighted below.

Datasets produced
=================

Tidy Dataset (tidydata.txt)
---------------------------

The tidy data contains a total of 68 columns in this data set. Each row
contains data related to an activity for a unique person. There are 6
distinct activities:

    levels(df$activityName)

    ## [1] "LAYING"             "SITTING"            "STANDING"          
    ## [4] "WALKING"            "WALKING_DOWNSTAIRS" "WALKING_UPSTAIRS"

As well as 30unique subjects (people).

Averaged Tidy Dataset (averaged\_tidydata.txt)
----------------------------------------------

The Averaged tidy data set contains the average value for each variable
per person and action. Therefore this dataset has 180 rows.

Variable Names
==============

subject - Number between 1 and 30 representing the person.  
activityName - Given name of activity. One of the six described above.

Some variable names were changed from the original dataset for
readability:

-   Variables starting with f have been changed to freq and those
    starting with t to time. These represented the "FrequencyDomain" and
    "TimeDomain" depending on of the data was before or after the Fast
    Fourier Transform.  
-   Brackets and dashes were removed from the original variable names
    as well.

The variable names have several parts:

-   First part represents the Domain either time or frequency.  
-   The instrument is given by Acc or Gyro to represent accelerometer or
    gyroscope data.  
-   The acceleration measured BodyAcc or GravityAcc.  
-   Other specific movement data is stored with Jerk or Mag (Magnitude)
    in the variable name.  
-   Mean and std stand for the mean or standard deviation of the data.  
-   The axis of the motion is represented by X, Y or Z.

This resulted in the following 68 column names:

    names(df)

    ##  [1] "subject"                     "timeBodyAccMeanX"           
    ##  [3] "timeBodyAccMeanY"            "timeBodyAccMeanZ"           
    ##  [5] "timeBodyAccStdX"             "timeBodyAccStdY"            
    ##  [7] "timeBodyAccStdZ"             "timeGravityAccMeanX"        
    ##  [9] "timeGravityAccMeanY"         "timeGravityAccMeanZ"        
    ## [11] "timeGravityAccStdX"          "timeGravityAccStdY"         
    ## [13] "timeGravityAccStdZ"          "timeBodyAccJerkMeanX"       
    ## [15] "timeBodyAccJerkMeanY"        "timeBodyAccJerkMeanZ"       
    ## [17] "timeBodyAccJerkStdX"         "timeBodyAccJerkStdY"        
    ## [19] "timeBodyAccJerkStdZ"         "timeBodyGyroMeanX"          
    ## [21] "timeBodyGyroMeanY"           "timeBodyGyroMeanZ"          
    ## [23] "timeBodyGyroStdX"            "timeBodyGyroStdY"           
    ## [25] "timeBodyGyroStdZ"            "timeBodyGyroJerkMeanX"      
    ## [27] "timeBodyGyroJerkMeanY"       "timeBodyGyroJerkMeanZ"      
    ## [29] "timeBodyGyroJerkStdX"        "timeBodyGyroJerkStdY"       
    ## [31] "timeBodyGyroJerkStdZ"        "timeBodyAccMagMean"         
    ## [33] "timeBodyAccMagStd"           "timeGravityAccMagMean"      
    ## [35] "timeGravityAccMagStd"        "timeBodyAccJerkMagMean"     
    ## [37] "timeBodyAccJerkMagStd"       "timeBodyGyroMagMean"        
    ## [39] "timeBodyGyroMagStd"          "timeBodyGyroJerkMagMean"    
    ## [41] "timeBodyGyroJerkMagStd"      "freqBodyAccMeanX"           
    ## [43] "freqBodyAccMeanY"            "freqBodyAccMeanZ"           
    ## [45] "freqBodyAccStdX"             "freqBodyAccStdY"            
    ## [47] "freqBodyAccStdZ"             "freqBodyAccJerkMeanX"       
    ## [49] "freqBodyAccJerkMeanY"        "freqBodyAccJerkMeanZ"       
    ## [51] "freqBodyAccJerkStdX"         "freqBodyAccJerkStdY"        
    ## [53] "freqBodyAccJerkStdZ"         "freqBodyGyroMeanX"          
    ## [55] "freqBodyGyroMeanY"           "freqBodyGyroMeanZ"          
    ## [57] "freqBodyGyroStdX"            "freqBodyGyroStdY"           
    ## [59] "freqBodyGyroStdZ"            "freqBodyAccMagMean"         
    ## [61] "freqBodyAccMagStd"           "freqBodyBodyAccJerkMagMean" 
    ## [63] "freqBodyBodyAccJerkMagStd"   "freqBodyBodyGyroMagMean"    
    ## [65] "freqBodyBodyGyroMagStd"      "freqBodyBodyGyroJerkMagMean"
    ## [67] "freqBodyBodyGyroJerkMagStd"  "activityName"
