
#Ensure working directory is where the UCI HAR Dataset folder is located.
#setwd("~/Documents/RScripts/coursera_repo/week4Proj")

library(dplyr)

#Read in the separate data sets.
testDataX <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
trainingDataX <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)

subjectTrain <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
subjectTest <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)


testDataY <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
trainingDataY <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)


#Join each training and test set 
Subject <- rbind(subjectTrain, subjectTest)
# name the column subject
names(Subject) <- c("subject")

Activity <- rbind(trainingDataY, testDataY)
names(Activity) <- c("activity")

df <- rbind(trainingDataX, testDataX)

#Bind the columns of these datasets together 
df <- cbind(Subject, Activity, df )

# features.txt file explains what the variables are 
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

# has 561 observations each is a description of the 561 columns 
# that were in the traning and test x datasets. 
# change the column names in the dataframe accordingly
colnames <- as.character(features$V2)
names(df) <- c("subject", "activity", colnames)


# want to keep relavent columns ie those that have "mean" or "std" in the variable name. 
# search for these in the column names returning column index for true
index_col_keep <- which(grepl("mean\\(\\)|std\\(\\)", names(df)))

# Only keep these columns and the activity and Subject columns
df  <- df[, c(1,2,index_col_keep)]
#names(df)


# Change the activity column to the activity name from activity_labels.txt
activity_lab <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
names(activity_lab) <- c("activity", "activityName")

df <- merge(df, activity_lab, by="activity", all.x=TRUE)

#remove redundant activity column (keeping only the descriptive activityName column)
df$activity <- NULL



# names Avoid - and () in variable names  t and f stand for time or fequency domain
colnames <- names(df)
colnames <- gsub("^t", "time", colnames)
colnames <- gsub("^f", "freq", colnames)
colnames <- gsub("\\-mean\\(\\)", "Mean", colnames)
colnames <- gsub("\\-std\\(\\)", "Std", colnames)
colnames <- gsub("\\-X", "X", colnames)
colnames <- gsub("\\-Y", "Y", colnames)
colnames <- gsub("\\-Z", "Z", colnames)


#rename the df columns 
names(df) <- colnames
write.table(df, file = "tidydata.txt", row.name = FALSE)

#create a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

# using dplyr 
tidydata <- df %>%
  group_by(activityName, subject) %>%
  summarize_each(funs(mean)) %>%
  arrange(subject)
  
write.table(tidydata, file = "averaged_tidydata.txt", row.name = FALSE)




