# Getting and Cleaning Data Course Project Tasks 
#   1. Merge the training and the test sets to create one data set
#   2. Extract only the measurements on the mean and standard deviation for each measurement
#   3. Use descriptive activity names to name the activities in the data set
#   4. Appropriately label the data set with descriptive variable names
#   5. From the data set in step 4, create a second, independent tidy data set with the average 
#      of each variable for each activity and each subject

#  This code expects the Samsung data in the working directory

require(plyr)

## Task 1: Merge the training and test sets to create one data set
#   1.a  Merge features (the measured variables)
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
features <- rbind(xTest, xTrain)
#   1.b  Merge activities
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
activities = 
  c("Walking","WalkingUpstairs","WalkingDownstairs","Sitting",
  "Standing","Laying")[c(yTest[ ,1],yTrain[ ,1])]
#  1.c Merge subjects
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjects <- rbind(subjectTest, subjectTrain)[, 1]
# 1.d  Remember the origin of the merged sets
sets <- rep(c("Test", "Train"), c(dim(xTest)[1], dim(xTrain)[1]))
# 1.e  Assemble into one data set
sourceData <- cbind(sets, subjects, activities, features)
namesSourceData <- c("set", "subject",  "activity",
  as.character(read.table("UCI HAR Dataset/features.txt")[ ,2]))
names(sourceData) <- namesSourceData
rm(xTest, xTrain, features, yTest, yTrain, activities, subjectTest, subjectTrain,
   subjects, sets)  # free some memory

##  Task 2: Extract only the measurements on the mean and standard deviation for each measurement. 
tidyData <- sourceData[ ,c(1:3, grep("(mean|std|meanFreq)\\(\\)", namesSourceData))]
rm(sourceData, namesSourceData)  # free more memory

##   Task 3: Use descriptive activity names to name the activities in the data set
# This was accomplished as part of task 1.b

##   Task 4: Appropriately label the data set with descriptive variable names
##   See the codebook for explanations
namesSourceTidyData <- names(tidyData)  # remember the original names for the codebook
# 4.a  Domain
names(tidyData) <- gsub("^t", "time", names(tidyData))
names(tidyData) <- gsub("^f", "frequency", names(tidyData))
# 4.b  Sensor
names(tidyData) <- gsub("BodyBody", "Body", names(tidyData))  # fix typo
names(tidyData) <- gsub("Acc", "Accelerometer", names(tidyData))
names(tidyData) <- gsub("Gyro", "Gyroscope", names(tidyData))
# 4.c  Statistic
names(tidyData) <- gsub("mean\\(\\)", "Mean", names(tidyData))
names(tidyData) <- gsub("std\\(\\)", "Std", names(tidyData))
names(tidyData) <- gsub("meanFreq\\(\\)", "Frequencymean", names(tidyData))
# 4.d  Axis (expand abbreviation and move it to the end of the name)
magTrue <- grepl("Mag",names(tidyData))
magNames <- names(tidyData)[magTrue]
names(tidyData)[magTrue] <- gsub("$","Magnitude",gsub("Mag","",magNames))
rm(magTrue, magNames)
# 4.e  Omit dashes
names(tidyData) <- gsub("-", "", names(tidyData))
# 4.f  Measure  (insert "Default" when not "Jerk")
jerkFalse <- !grepl("Jerk", names(tidyData))
names(tidyData)[jerkFalse] <- gsub("Accelerometer", "AccelerometerDefault", names(tidyData)[jerkFalse])
names(tidyData)[jerkFalse] <- gsub("Gyroscope", "GyroscopeDefault", names(tidyData)[jerkFalse])
rm(jerkFalse)
# 4.g  Record the new descriptive names for the codebook and create a name short form
namesDescriptiveTidyData <- names(tidyData)
namesShortTidyData <- names(tidyData)
namesShortTidyData <- gsub("^time", "t", namesShortTidyData)
namesShortTidyData <- gsub("^frequency", "f", namesShortTidyData)
namesShortTidyData <- gsub("Body", "B", namesShortTidyData)
namesShortTidyData <- gsub("Gravity", "G", namesShortTidyData)
namesShortTidyData <- gsub("Accelerometer", "A", namesShortTidyData)
namesShortTidyData <- gsub("Gyroscope", "G", namesShortTidyData)
namesShortTidyData <- gsub("Default", "D", namesShortTidyData)
namesShortTidyData <- gsub("Jerk", "J", namesShortTidyData)
namesShortTidyData <- gsub("Frequencymean", "F", namesShortTidyData)
namesShortTidyData <- gsub("Mean", "M", namesShortTidyData)
namesShortTidyData <- gsub("Std", "S", namesShortTidyData)
namesShortTidyData <- gsub("Magnitude", "M", namesShortTidyData)
# 4.h  Create a table of variable names for the codebook
codebookVariables <- data.frame(descriptive = namesDescriptiveTidyData,
  source = namesSourceTidyData, short = namesShortTidyData,
  stringsAsFactors = FALSE)
  # reorder the variable names by the first letter of the name components
codebookVariables$short[1:3] <- c("aaaaaa", "aaaaab", "aaaaac")  #temporary recode
codebookVariables <- codebookVariables[order(codebookVariables$short), ]
codebookVariables$short[1:3] <- codebookVariables$source[1:3]  # restore values
write.csv(namesDescriptiveTidyData, "namesDescriptiveTidyData.csv", row.names = FALSE)
write.csv(namesSourceTidyData, "namesSourceTidyData.csv", row.names = FALSE)
write.csv(namesShortTidyData, "namesShortTidyData.csv", row.names = FALSE)
write.table(codebookVariables, "codebookVariables.txt", row.names = FALSE)

##   Task 5: From the data set in step 4, create a second, independent tidy data  
##      set with the average of each variable for each activity and each subject
#  Note: non-numeric variable "set" is not included in tidyMeans 
tidyMeans <- ddply(tidyData, .(activity, subject), numcolwise(mean))
write.table(tidyMeans, "tidyMeans.txt", row.names = FALSE)

