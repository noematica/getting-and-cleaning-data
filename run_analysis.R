library(dplyr)

## read in the various data files and coalesce them into one file
## training data
## read in training data from X_train.txt
train.data <- read.table("UCI HAR Dataset/train/X_train.txt")

## read in training activity labels from y_train.txt
train.labels <- read.table("UCI HAR Dataset/train/y_train.txt")

## read in the training subject labels from subject_train.txt 
train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

## coalesce training into one data frame
train.data <- data.frame(train.subjects, train.labels, train.data)

## test data
## read in test data
test.data <- read.table("UCI HAR Dataset/test/X_test.txt")

## read in test activity labels 
test.labels <- read.table("UCI HAR Dataset/test/y_test.txt")

## read in the test subject labels
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

## coalesce test data into one data frame
test.data <- data.frame(test.subjects, test.labels, test.data)

## satisfy instruction 1: Merges the training and the test sets to create one data set.
merged.data <- rbind(train.data, test.data)

## housekeeping
## Remove from the environment the big-footprint objects no longer needed.
rm(train.data, train.subjects, train.labels, test.data, test.subjects, test.labels)

## satisfy requirement 2: Extracts only the measurements on the mean and standard deviation for each measurement.
## first, get the column names by first getting feature labels as vector,
## then prefacing these with the subject and acticity label columns
features <- read.table("UCI HAR Dataset/features.txt")
features[ ,2] <- suppressWarnings(as.character(features[, 2]))
column.names = c('SubjectId', 'ActivityLabel', as.vector(features[, 2]))

## next, apply the feature names to the merged data column names
colnames(merged.data) <- column.names

## finally, intersect() handily allows you to express cleanly which are to be included and which excluded
column.names.include <- grep('mean|std|subject|activity', names(merged.data), ignore.case = TRUE)
column.names.exclude <- grep('angle|freq', names(merged.data), ignore.case = TRUE, invert = TRUE)
merged.data <- merged.data[ , intersect(column.names.include, column.names.exclude)]
 
## housekeeping
##update the column.names with the new complement of names. we'll be cleaning these up later.
column.names <- colnames(merged.data)


## satisfy requirement 3: Uses descriptive activity names to name the activities in the data set
## first, read in activity labels lookup-- for later replacement of activty IDs by text equivalents
labels <- read.table("UCI HAR Dataset/activity_labels.txt")
labels[, 2] <- suppressWarnings(as.character(labels[ ,2]))

## then, replace activity IDs with activity labels
## for readability, get a vector of row IDs first; 
## then use that vector to insert the corresponding text label into merged.data
match.ids = match(merged.data$ActivityLabel, labels[, 1])
merged.data$ActivityLabel <- labels[match.ids, 2]

## satisfy requirement 4: Appropriately labels the data set with descriptive variable names. 
## various style guides advise against hyphens, underscores, dots, and even camel case in variable names. 
## We'll use camel case, but other formats are also fine. 
## hyphens and parentheses removed; mean and std to Mean and Std, with spacing; BodyBody -> Body
column.names <- gsub('-', '', column.names)
column.names <- gsub('[()]', '', column.names)
column.names <- gsub('mean', 'Mean', column.names)
column.names <- gsub('std', 'Std', column.names)
column.names <- gsub('BodyBody', 'Body', column.names)

## re-apply the sanitized names to the table
colnames(merged.data) <- column.names


## satisfy requirement 5: From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable for each activity and each subject.
## now group and summarize by calculating the mean for each group
merged.data.summary <- merged.data %>% group_by(SubjectId, ActivityLabel) %>% summarise_each(funs(mean))

## write out the summary file to the working directory
## NB: requirements specify roww.names = FALSE; .txt indicates sep = ""
write.table(merged.data.summary, file="run_data_summary.txt", row.names = FALSE)

## housekeeping
## because the requirement specifies a file, and not variables to be reused, clean up the environment
rm(features, labels, column.names, 
   column.names.exclude, column.names.include, 
   match.ids, merged.data, 
   merged.data.summary
   )