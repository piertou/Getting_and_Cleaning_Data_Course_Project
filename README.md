**Getting and Cleaning Data Coursera Course Project**
----------------------------------------
####by Pierre Tourigny, 2015-08-22
## Project Goal
The purpose of this project is to demonstrate the student's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The student will be graded by his/her peers on a series of yes/no questions related to the project. 
##Project Output
The student is required to submit:

*  a tidy data set
*I submitted **tidyMeans.txt** and I provide a copy of it in this repo [here](tidyMeans.txt).*
* a link to a Github repository with a script for performing the analysis
*This is the repo for which I submitted a link. The script for performing the analysis, called **run_analysis.R**, is [here](run_analysis.R).*
* a code book that describes the variables, the data, and any transformations or work performed to clean up the data called **CodeBook.md**
 *The code book is [here](CodeBook.md).*
* The student should also include a **README.md** in the repo with the student's scripts. This repo explains how all of the scripts work and how they are connected. 
*This is the document you are reading.*

##Project Input
###Human Activity Recognition Using Smartphones
>**Acknowledgment**
>Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

>[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

>This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

>Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

###Dataset
The data for the project came from this [zip file](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip).
>For the included R script to work, this dataset must be unzipped as subdirectory **UCI HAR Dataset** of the working directory, preserving the directory structure of the data. (Most unzipping software will do this for you by default after you select the working directory.)

###Dataset Description
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

(*from the dataset readme.txt* and "features_info.txt")  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the  waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
For each record it is provided:   

*   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

> For more information about this dataset contact:
> [activityrecognition@smartlab.ws](activityrecognition@smartlab.ws)

##Project Tasks
The R script called run_analysis.R does the following: 
>The main numbers are the project required tasks. The subsections are the subtasks I used with explanations and justifications if required. The same section numbers are used in the script comments.

 1. Merge the training and the test sets to create one data set.
	 1. Merge features.
	 2. Merge activities.
	 3. Replace activity numbers with activity names.	*It was more convenient to do this here, before creating the single data set,  rather than at step 3.*
	 4. Merge subjects.
	 5. Remember the test or train partitions. *Although we are to merge those partitions, I don't think it follows that we are to forget the partitioning information.*
	 6. Assemble into a single data set.
	 7. Replace the default V1, V2, etc. names with the source names in **UCI HAR Dataset/features.txt**
 2.  Extract only the measurements on the mean and standard deviation for each measurement.
   *I included variables with substrings "mean(), "std()" and "meanFreq()". I did not include variables with substring "mean" whose value is an angle calculated from means rather than a mean value. I did include "meanFreq() because a weighted average is a mean, contra others in the course's discussion forums.* 
 3. Use descriptive activity names to name the activities in the data set.
   *This task was accomplished as task 1.3.*
 4. Appropriately label the data set with descriptive variable names.
   *I could have limited myself to task 1.7, fixed the "BodyBody" typo, and called this tak done. However, I think that more descriptive names would serve a new user of the data set better. So I expanded the abbreviations, used a more consistent [lower camel case convention](https://en.wikipedia.org/wiki/CamelCase) and reordered the name components as required. While this creates long names, this is manageable in a coding environment with auto-completion like RStudio. The long names are self-descriptive and helpful for the user unfamiliar with the data. Because I think that this quickly becomes cumbersome however, I also provided a short name form that the user experienced with the data could use. For a fuller explanation and to better understand the following subtasks, see the [code book](CodeBook.md).*
   1. Expand domain names.
   2. Expand sensor names.
   3. Expand statistic names.
   4. Expand magnitude and move it the the end with the cartesian axes from which it is calculated.
   5. Omit dashes.
   6. *In the source variable, the measure name component is omitted when the measure is not jerk. It is, by implication, linear acceleration for the accelerometer and angular velocity for the gyroscope. I inserted "Default" instead to make the measure component explicit. Feature compound names now all have 6 components.*
   7. Create a 6-character short name version and write three names csv files for the tidy data set: source names, descriptive names and short names.
   8. Create a table of variable names for the code book. *I created a data frame with a column for each of the three name styles and wrote it to a text file. In the RStudio editor, I replaced '" "' with ' | '. Lastly, I inserted the string "--- | --- |---" in the second row. This gave me text that markdown understands as a table.*
 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. *This step ends with a View command of the tidyMeans data frame to allow the evaluator to  verify its correctness. As suggested by [David Hood](https://www.coursera.org/user/i), the evaluator can also download the text version, tidyMeans.txt, to his/her working directory and use the following code to view it. *
 

    >data <- read.table("tidyMeans.txt",  header = TRUE)  
    >View(data)   

----------


> Written with [StackEdit](https://stackedit.io/).
