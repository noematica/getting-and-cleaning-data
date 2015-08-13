# Getting and cleaning data codebook

## Original data location and background
The original data are located [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and their full description is located [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The data represent experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. ([Original citation](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).) A full description can be found in the `features_info.txt` file.

## Raw data
The raw data consist of three sets of files:

1. a set of summary and descriptive files detailing the activities and features covered by the experiment, and the experimental methodology:
  * `activity_labels.txt`: links the class labels with their activity name
  * `features_info.txt`: a description of the feature vectors and their processing
  * `features.txt`: the full list of feature variable names
  * `README.txt`: a general overview of experimental methodology and the data set.
2. a set of training data, consisting of a data file, a subject listing file, and an activity listing file;
  * `train/X_train.txt`: the training set
  * `train/y_train.txt`: the training activity labels
  * `train/subject_train.txt`: the training subject labels 
3. a set of tesing data, consisting of a data file, a subject listing file, and an activity listing file.
  * `test/X_test.txt`: the test set
  * `test/y_test.txt`: the test activity labels. 
  * `test/subject_train.txt`: the test subject labels 


The activities include:

1. laying
2. sitting
3. standing
4. walking
5. walking downstairs
6. walking upsatirs

## The tidy data set
The tidy data set is a plain text file using a space as a separator and quotation marks as text delimiters. Row names have been excluded by specifying `row.names = FALSE` when writing the table. 

The tidy data set was processed by

1. aggregating training and testing data sets;
2. pruning the data to include only measures of the mean and standard deviation for various factors;
3. sanitizing and formatting of variable names;
4. grouping data by subject and activity;
5. summarizing the data to return the mean for each grouped observation.

## The variables in the tidy data set
The variable names have been stripped of hyphens, underscore, spaces, periods, and "BodyBody", which was replaced with "Body"; then they were converted to camel case. After excluding all variables other than measures of mean and standard deviation, 66 variables have been included. The SubjectId and ActivityLabels variables bring the total to 88 variables. 

```
SubjectId
ActivityLabel
tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tGravityAccStdX
tGravityAccStdY
tGravityAccStdZ
tBodyAccJerkMeanX
tBodyAccJerkMeanY
tBodyAccJerkMeanZ
tBodyAccJerkStdX
tBodyAccJerkStdY
tBodyAccJerkStdZ
tBodyGyroMeanX
tBodyGyroMeanY
tBodyGyroMeanZ
tBodyGyroStdX
tBodyGyroStdY
tBodyGyroStdZ
tBodyGyroJerkMeanX
tBodyGyroJerkMeanY
tBodyGyroJerkMeanZ
tBodyGyroJerkStdX
tBodyGyroJerkStdY
tBodyGyroJerkStdZ
tBodyAccMagMean
tBodyAccMagStd
tGravityAccMagMean
tGravityAccMagStd
tBodyAccJerkMagMean
tBodyAccJerkMagStd
tBodyGyroMagMean
tBodyGyroMagStd
tBodyGyroJerkMagMean
tBodyGyroJerkMagStd
fBodyAccMeanX
fBodyAccMeanY
fBodyAccMeanZ
fBodyAccStdX
fBodyAccStdY
fBodyAccStdZ
fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ
fBodyAccJerkStdX
fBodyAccJerkStdY
fBodyAccJerkStdZ
fBodyGyroMeanX
fBodyGyroMeanY
fBodyGyroMeanZ
fBodyGyroStdX
fBodyGyroStdY
fBodyGyroStdZ
fBodyAccMagMean
fBodyAccMagStd
fBodyAccJerkMagMean
fBodyAccJerkMagStd
fBodyGyroMagMean
fBodyGyroMagStd
fBodyGyroJerkMagMean
fBodyGyroJerkMagStd
```
