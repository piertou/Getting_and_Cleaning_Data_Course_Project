# Getting and Cleaning Data Course Project Tasks 
#   1. Merge the training and the test sets to create one data set.
#   2. Extract only the measurements on the mean and standard deviation for each measurement. 
#   3. Use descriptive activity names to name the activities in the data set
#   4. Appropriately label the data set with descriptive variable names. 
#   5. From the data set in step 4, create a second, independent tidy data set with the average 
#      of each variable for each activity and each subject.

require(plyr)

## Task 1: Merge the training and test sets to create one data set
#   1.a  Merge features (the measured variables)
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
features <- rbind(xTest, xTrain)
names(features) <- read.table("UCI HAR Dataset/features.txt")[,2]  # add feature names
#   1.b  Merge activities
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
activities = 
  c("Walking","WalkingUpstairs","WalkingDownstairs","Sitting",
  "Standing","Laying")[c(yTest[,1],yTrain[,1])]
#  1.c Merge subjects
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjects <- rbind(subjectTest, subjectTrain)[, 1]
# 1.d  Remember the origin of the merged sets
sets <- rep(c("Test", "Train"), c(dim(xTest)[1], dim(xTrain)[1]))
# 1.e  Assemble into one data set
oneDataSet <- cbind(set = sets, subject = subjects, activity = activities, features)
rm(xTest, xTrain, features, yTest, yTrain, activities, subjectTest, subjectTrain,
   subjects, sets)  # free some memory

##  Task 2: Extract only the measurements on the mean and standard deviation for each measurement. 
tidyData <- oneDataSet[ ,c(1:3, grep("(mean|std|meanFreq)\\(\\)", names(oneDataSet)))]
rm(oneDataSet)  # free more memory

##   Task 3: Use descriptive activity names to name the activities in the data set
# This was accomplished as part of task 1.b.

##   Task 4: Appropriately label the data set with descriptive variable names
##   See the codebook for explanations
# 4.a  Domain
names(tidyData) <- gsub("^t", "time", names(tidyData))
names(tidyData) <- gsub("^f", "frequency", names(tidyData))
# 4.b  Sensor
names(tidyData) <- gsub("BodyBody", "Body", names(tidyData))  # fix typo
names(tidyData) <- gsub("Acc", "Accelerometer", names(tidyData))
names(tidyData) <- gsub("Gyro", "Gyroscope", names(tidyData))
# 4.c  Parameter
names(tidyData) <- gsub("mean\\(\\)", "Mean", names(tidyData))
names(tidyData) <- gsub("std\\(\\)", "Std", names(tidyData))
names(tidyData) <- gsub("meanFreq\\(\\)", "MeanFrequency", names(tidyData))
# 4.d  Axis (expand abbreviation and move it to the end of the name)
magTrue <- grepl("Mag",names(tidyData))
magNames <- names(tidyData)[magTrue]
names(tidyData)[magTrue] <- gsub("$","Magnitude",gsub("Mag","",magNames))
rm(magTrue, magNames)
# 4.e  Omit dashes
names(tidyData) <- gsub("-", "", names(tidyData))

##   Task 5: From the data set in step 4, create a second, independent tidy data set with the average 
##      of each variable for each activity and each subject
#  Note: non-numeric variable "set" is not included in tidyMeans 
tidyMeans <- ddply(tidyData, .(activity, subject), numcolwise(mean))
write.table(tidyMeans, "tidyMeans.txt", row.names = FALSE)

