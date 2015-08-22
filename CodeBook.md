**Codebook for the Coursera Getting and Cleaning Data Course Project**
------------------------------------------------------------------

by Pierre Tourigny, 2015-08-22



Variables
---------
####**Fixed variables**
* **Set:** "Train" or "Test"  
 The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.  
This variable records the partition origin of the merge.  
* **Subject:** 1 to 30
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
* **Activity:** "Walking", "WalkingUpstairs", "WalkingDownstairs", "Sitting", "Standing", "Laying"
Each person performed six activities  wearing a smartphone (Samsung Galaxy S II) on the waist.        
####**Measured variables - Introduction**
	Using the smartphone's embedded accelerometer and gyroscope, the experimenters captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

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
>Here are the descriptive name components, in order, with the source component names in parentheses and their short form in brackets:

 * **Domain:** "time" or "frequency" ("t", "f") ["t","f"]
                  Some of the original time domain signals were converted to the frequency domain by the application of a Fast Fourier Transform.  
 * **Signal:** "Body" or "Gravity" (same) ["B", "G"]
    * The accelerometer signal was further separated into body and gravity signals.
    * The gyroscope has no "Gravity" component.
 * **Sensor:** "Accelerometer" or "Gyroscope" ("Acc", "Gyro") ["A", "G"]
     The features selected for this database come from the accelerometer and gyroscope signals.     
 * **Measure:** "Default" or "Jerk" (blank, "Jerk") ["D", "J"]
 The body linear acceleration and angular velocity were derived in time to obtain jerk signals. If "Jerk" is not part of the name, the sensor's original units are reported, i.e. linear acceleration or angular velocity respectively.
 * **Statistic:** "Mean", "Frequencymean" or "Std" ("-mean()", "-meanFreq()", "-std()") ["M",  "F", "S"]
   * Only the mean and standard deviation ("Std") measures are kept in our project's subset of the database.
   * I did not keep features with a "mean" substring whose value was an angle calculated from means instead of a mean. 
   * On the other hand, I kept "meanFreq()" because these really are means.
    * There is no confusion between statistic "Frequencymean" and domain "frequency" because the latter occurs only at the beginning of the name and starts with a lower case.  
 * **Axis:** "X", "Y, "Z" or "Magnitude" ("-X", "-Y", "-Z", "Mag") ["X", "Y", "Z", "M"]
     * The sensors provide 3-axial signals, represented by the X, Y and Z axes. The magnitude M of these three-dimensional signals was calculated using the Euclidean norm, i.e. M^2 = X^2 + Y^2 + Z^2.
     * I moved magnitude to the axis position at the end of the name because it is  calculated from those cartesian axes.
####**Measured variables - Table** 
> Here is a table of feature names in alphabetical order of the first letter of each component substring, i.e. in short name order.
> The first column contains the descriptive names used in tidyData and in tidyMeans (minus the "set" variable in the latter case).
> The second column contains the corresponding names in the source data.
> The third column contains the short name for the experienced user.
> The user can use the three "names" csv files in the repository to change the names of tidyData as required. Unlike the following table, those files are in data order. The following table is intended as a reference, so an alphabetical component order is more useful.

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