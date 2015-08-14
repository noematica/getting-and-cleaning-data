# Getting and cleaning data

## Introduction

This repository demonstrates a process to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. It includes: 1) the tidy data set, [run_data_summary.txt](https://github.com/noematica/getting-and-cleaning-data/blob/master/run_data_summary.txt), whose variables are described in the codebook; 2) a script,  [run_analysis.R](https://github.com/noematica/getting-and-cleaning-data/blob/master/run_analysis.R), for performing the data retrieval and processing, and 3) a [codebook](https://github.com/noematica/getting-and-cleaning-data/blob/master/CodeBook.md) that describes the variables, the data, and any transformations or work performed to clean up the data.

## How the script works
The script assumes that the Samsung data, orginally sourced [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), has been downloaded and extracted into your working directory, maintaining its original directory structure. 

The script

1. loads the training and test sets into memory;
2. coalesces the test data, subject labels, and activity labels into one data frame;
3. binds these coalesced frames into one, merged data frame with both training and test data;
4. extracts only measurements for mean and standard deviation for each observation;
5. replaces numeric activity labels with descriptive text;
6. applies descriptive variable names to the data set; and
7. groups the data set by activity and subject, then computes the mean for each variable.
