**Code Book for the Coursera Getting and Cleaning Data Course Project**
------------------------------------------------------------------

by Pierre Tourigny, 2015-08-22

##Source Dataset Directories and Files
For a description of the source dataset, see the Dataset description section of the repo's [README.md](README.md).

The dataset includes the following files in subdirectory **UIC HAR Dataset**:   

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
Notes: 
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

##Raw Data
The raw data for the experiment are in subirectories 'UIC HAR Dataset/Test/Inertial Signals' and 'UIC HAR Dataset/Train/Inertial Signals' described above.
This project does not use the experiment's raw data.
##Preprocessed Data
This project uses the processed feature measures in "UIC HAR Dataset/test" and "UIC HAR Dataset/train".
##Data Cleanup
* I fixed a typo in some variable names, i.e., I changed "BodyBody" to "Body".
* I replaced activity numbers with activity names.
* I did not change any feature value.
* Although UIC HAR Dataset/features.txt has duplicate names because of missing "-X", "-Y" and "-Z" axis substrings, these are not among the features selected for this project. So I did not cleanup those variable names. 
##Transformations

 - Per the project specifications (see the Project Tasks section of the [README.MD](README.md), I merged the 'test' and 'train' partitions, including their activities, subjects and features, into a single dataset.
 - I subset the features to retain only means and standard deviations.
 - I replaced activity numbers with activity names.
 - I labeled the data set with descriptive variable names.
 - I created a second, independent tidy data set with the average of each variable for each activity and each subject.
 - I also created a dataset of variable names for this code book.

##Variables
---------
####**Fixed variables** (names followed by values and description)
* **Set:** "Train" or "Test"  
 The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.  
This variable records the partition origin of the merge.  
* **Subject:** 1 to 30
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
* **Activity:** "Walking", "WalkingUpstairs", "WalkingDownstairs", "Sitting", "Standing", "Laying"
Each person performed six activities  wearing a smartphone (Samsung Galaxy S II) on the waist.        
####**Measured variables - Introduction**

* **Missing values:**  There are no missing values.
* **Units:** Features are normalized and bounded within [-1,1]
* **Names:** Measured variables have compound names with 6 components.
  * To fulfill the project requirement of descriptive variable names, I expanded the abbreviations in the source compound names. 
   * The source has a name component (see Measure below) defined by omission. I made all values of this component explicit. 
   * I adopted the [lower camel case convention](https://en.wikipedia.org/wiki/CamelCase) in the output data (as well as in the code). 
          All measured variable names have six components and thus 5 upper case letters. 
   * I moved magnitude to the end of the name with the cartesian axes from which it  is caculated.
   * In case the resulting names prove too cumbersome, I provided an alternate 6-character short form for the user familiar with the data.

####**Measured variables - Components** 
>Here are the descriptive name components, in order, with the source component names in parentheses and their short form in brackets. The rubric names are only for reference. They are not used by themselves as part of the variable names.

 * **Domain:** "time" or "frequency" ("t", "f") ["t","f"]
                  Some of the original time domain signals were converted to the frequency domain by the application of a Fast Fourier Transform.  
 * **Signal:** "Body" or "Gravity" (same) ["B", "G"]
    * The accelerometer signal was further separated into body and gravity signals.
    * The gyroscope has no "Gravity" component.
 * **Sensor:** "Accelerometer" or "Gyroscope" ("Acc", "Gyro") ["A", "G"]
     The features selected for this database come from the accelerometer and gyroscope signals.     
 * **Measure:** "Default" or "Jerk" (blank, "Jerk") ["D", "J"]
 The body linear acceleration and angular velocity were derived in time to obtain jerk signals. If "Jerk" is not part of the name, the sensor's original measures are reported, i.e. linear acceleration or angular velocity respectively.
 * **Statistic:** "Mean", "Frequencymean" or "Std" ("-mean()", "-meanFreq()", "-std()") ["M",  "F", "S"]
   * Only the mean and standard deviation ("Std") measures are kept in our project's subset of the database.
   * I did not keep features with a "mean" substring whose value was an angle calculated from means instead of a mean. 
   * On the other hand, I kept "meanFreq()" because these really are means.
    * There is no confusion between statistic "Frequencymean" and domain "frequency" because the latter occurs only at the beginning of the name and starts with a lower case.  
 * **Axis:** "X", "Y, "Z" or "Magnitude" ("-X", "-Y", "-Z", "Mag") ["X", "Y", "Z", "M"]
     * The sensors provide 3-axial signals, represented by the X, Y and Z axes. The magnitude M of these three-dimensional signals was calculated using the Euclidean norm, i.e. M^2 = X^2 + Y^2 + Z^2. (This calculation cannot be verified with the processed data because the values are normalized.)
     * I moved magnitude to the axis position at the end of the name because it is  calculated from those cartesian axes.

####**Measured variables - Table** 
> Here is a table of feature names in alphabetical order of the first letter of each component substring, i.e. in short name order.
> The first column contains the descriptive names used in tidyData and in tidyMeans (minus the "set" variable in the latter case).
> The second column contains the corresponding names in the source data.
> The third column contains the short name for the experienced user.
> The user can use the three "names" csv files, [namesDescriptiveTidyData](namesDescriptiveTidyData.csv), [namesSourceTidyData](namesSourceTidyData.csv) and [namesShortTidyData](namesShortTidyData.csv), in the repository to change the names of tidyData as required. Unlike the following table, those files are in data order. The following table is intended as a reference, so an alphabetical component order is more useful.
> The descriptive labels and the previous component descriptions obviate the need for a separate description for each variable.

####**Table**

descriptive | source | short
------------- | -------- | -------
set | set | set
subject | subject | subject
activity | activity | activity
frequencyBodyAccelerometerDefaultFrequencymeanMagnitude | fBodyAccMag-meanFreq() | fBADFM
frequencyBodyAccelerometerDefaultFrequencymeanX | fBodyAcc-meanFreq()-X | fBADFX
frequencyBodyAccelerometerDefaultFrequencymeanY | fBodyAcc-meanFreq()-Y | fBADFY
frequencyBodyAccelerometerDefaultFrequencymeanZ | fBodyAcc-meanFreq()-Z | fBADFZ
frequencyBodyAccelerometerDefaultMeanMagnitude | fBodyAccMag-mean() | fBADMM
frequencyBodyAccelerometerDefaultMeanX | fBodyAcc-mean()-X | fBADMX
frequencyBodyAccelerometerDefaultMeanY | fBodyAcc-mean()-Y | fBADMY
frequencyBodyAccelerometerDefaultMeanZ | fBodyAcc-mean()-Z | fBADMZ
frequencyBodyAccelerometerDefaultStdMagnitude | fBodyAccMag-std() | fBADSM
frequencyBodyAccelerometerDefaultStdX | fBodyAcc-std()-X | fBADSX
frequencyBodyAccelerometerDefaultStdY | fBodyAcc-std()-Y | fBADSY
frequencyBodyAccelerometerDefaultStdZ | fBodyAcc-std()-Z | fBADSZ
frequencyBodyAccelerometerJerkFrequencymeanMagnitude | fBodyBodyAccJerkMag-meanFreq() | fBAJFM
frequencyBodyAccelerometerJerkFrequencymeanX | fBodyAccJerk-meanFreq()-X | fBAJFX
frequencyBodyAccelerometerJerkFrequencymeanY | fBodyAccJerk-meanFreq()-Y | fBAJFY
frequencyBodyAccelerometerJerkFrequencymeanZ | fBodyAccJerk-meanFreq()-Z | fBAJFZ
frequencyBodyAccelerometerJerkMeanMagnitude | fBodyBodyAccJerkMag-mean() | fBAJMM
frequencyBodyAccelerometerJerkMeanX | fBodyAccJerk-mean()-X | fBAJMX
frequencyBodyAccelerometerJerkMeanY | fBodyAccJerk-mean()-Y | fBAJMY
frequencyBodyAccelerometerJerkMeanZ | fBodyAccJerk-mean()-Z | fBAJMZ
frequencyBodyAccelerometerJerkStdMagnitude | fBodyBodyAccJerkMag-std() | fBAJSM
frequencyBodyAccelerometerJerkStdX | fBodyAccJerk-std()-X | fBAJSX
frequencyBodyAccelerometerJerkStdY | fBodyAccJerk-std()-Y | fBAJSY
frequencyBodyAccelerometerJerkStdZ | fBodyAccJerk-std()-Z | fBAJSZ
frequencyBodyGyroscopeDefaultFrequencymeanMagnitude | fBodyBodyGyroMag-meanFreq() | fBGDFM
frequencyBodyGyroscopeDefaultFrequencymeanX | fBodyGyro-meanFreq()-X | fBGDFX
frequencyBodyGyroscopeDefaultFrequencymeanY | fBodyGyro-meanFreq()-Y | fBGDFY
frequencyBodyGyroscopeDefaultFrequencymeanZ | fBodyGyro-meanFreq()-Z | fBGDFZ
frequencyBodyGyroscopeDefaultMeanMagnitude | fBodyBodyGyroMag-mean() | fBGDMM
frequencyBodyGyroscopeDefaultMeanX | fBodyGyro-mean()-X | fBGDMX
frequencyBodyGyroscopeDefaultMeanY | fBodyGyro-mean()-Y | fBGDMY
frequencyBodyGyroscopeDefaultMeanZ | fBodyGyro-mean()-Z | fBGDMZ
frequencyBodyGyroscopeDefaultStdMagnitude | fBodyBodyGyroMag-std() | fBGDSM
frequencyBodyGyroscopeDefaultStdX | fBodyGyro-std()-X | fBGDSX
frequencyBodyGyroscopeDefaultStdY | fBodyGyro-std()-Y | fBGDSY
frequencyBodyGyroscopeDefaultStdZ | fBodyGyro-std()-Z | fBGDSZ
frequencyBodyGyroscopeJerkFrequencymeanMagnitude | fBodyBodyGyroJerkMag-meanFreq() | fBGJFM
frequencyBodyGyroscopeJerkMeanMagnitude | fBodyBodyGyroJerkMag-mean() | fBGJMM
frequencyBodyGyroscopeJerkStdMagnitude | fBodyBodyGyroJerkMag-std() | fBGJSM
timeBodyAccelerometerDefaultMeanMagnitude | tBodyAccMag-mean() | tBADMM
timeBodyAccelerometerDefaultMeanX | tBodyAcc-mean()-X | tBADMX
timeBodyAccelerometerDefaultMeanY | tBodyAcc-mean()-Y | tBADMY
timeBodyAccelerometerDefaultMeanZ | tBodyAcc-mean()-Z | tBADMZ
timeBodyAccelerometerDefaultStdMagnitude | tBodyAccMag-std() | tBADSM
timeBodyAccelerometerDefaultStdX | tBodyAcc-std()-X | tBADSX
timeBodyAccelerometerDefaultStdY | tBodyAcc-std()-Y | tBADSY
timeBodyAccelerometerDefaultStdZ | tBodyAcc-std()-Z | tBADSZ
timeBodyAccelerometerJerkMeanMagnitude | tBodyAccJerkMag-mean() | tBAJMM
timeBodyAccelerometerJerkMeanX | tBodyAccJerk-mean()-X | tBAJMX
timeBodyAccelerometerJerkMeanY | tBodyAccJerk-mean()-Y | tBAJMY
timeBodyAccelerometerJerkMeanZ | tBodyAccJerk-mean()-Z | tBAJMZ
timeBodyAccelerometerJerkStdMagnitude | tBodyAccJerkMag-std() | tBAJSM
timeBodyAccelerometerJerkStdX | tBodyAccJerk-std()-X | tBAJSX
timeBodyAccelerometerJerkStdY | tBodyAccJerk-std()-Y | tBAJSY
timeBodyAccelerometerJerkStdZ | tBodyAccJerk-std()-Z | tBAJSZ
timeBodyGyroscopeDefaultMeanMagnitude | tBodyGyroMag-mean() | tBGDMM
timeBodyGyroscopeDefaultMeanX | tBodyGyro-mean()-X | tBGDMX
timeBodyGyroscopeDefaultMeanY | tBodyGyro-mean()-Y | tBGDMY
timeBodyGyroscopeDefaultMeanZ | tBodyGyro-mean()-Z | tBGDMZ
timeBodyGyroscopeDefaultStdMagnitude | tBodyGyroMag-std() | tBGDSM
timeBodyGyroscopeDefaultStdX | tBodyGyro-std()-X | tBGDSX
timeBodyGyroscopeDefaultStdY | tBodyGyro-std()-Y | tBGDSY
timeBodyGyroscopeDefaultStdZ | tBodyGyro-std()-Z | tBGDSZ
timeBodyGyroscopeJerkMeanMagnitude | tBodyGyroJerkMag-mean() | tBGJMM
timeBodyGyroscopeJerkMeanX | tBodyGyroJerk-mean()-X | tBGJMX
timeBodyGyroscopeJerkMeanY | tBodyGyroJerk-mean()-Y | tBGJMY
timeBodyGyroscopeJerkMeanZ | tBodyGyroJerk-mean()-Z | tBGJMZ
timeBodyGyroscopeJerkStdMagnitude | tBodyGyroJerkMag-std() | tBGJSM
timeBodyGyroscopeJerkStdX | tBodyGyroJerk-std()-X | tBGJSX
timeBodyGyroscopeJerkStdY | tBodyGyroJerk-std()-Y | tBGJSY
timeBodyGyroscopeJerkStdZ | tBodyGyroJerk-std()-Z | tBGJSZ
timeGravityAccelerometerDefaultMeanMagnitude | tGravityAccMag-mean() | tGADMM
timeGravityAccelerometerDefaultMeanX | tGravityAcc-mean()-X | tGADMX
timeGravityAccelerometerDefaultMeanY | tGravityAcc-mean()-Y | tGADMY
timeGravityAccelerometerDefaultMeanZ | tGravityAcc-mean()-Z | tGADMZ
timeGravityAccelerometerDefaultStdMagnitude | tGravityAccMag-std() | tGADSM
timeGravityAccelerometerDefaultStdX | tGravityAcc-std()-X | tGADSX
timeGravityAccelerometerDefaultStdY | tGravityAcc-std()-Y | tGADSY
timeGravityAccelerometerDefaultStdZ | tGravityAcc-std()-Z | tGADSZ


> Written with [StackEdit](https://stackedit.io/).