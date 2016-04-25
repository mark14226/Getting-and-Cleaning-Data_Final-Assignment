# Getting-and-Cleaning-Data_Final-Assignment

This repository contains 2 files:

CodeBook.md 
- This CodeBook contains general information related to the variables in the final data set obtained from the R code

Getting and Cleaning Data_Final Assignment.R
- This is the R script which organizes the data for completion of the Coursera course, Getting and Cleaning Data, final assignment.
- The script does the following:
  - Imports both the 'test' and 'train' datasets 
  - Merges the 'test' and 'train' datasets into a single data frame - 'alldata'
  - Subsets 'alldata' for only measures of mean and standard deviation for all variables described in the CodeBook into a new data frame, 'alldata2'
  - Uses the reshape2 package to melt the dataset into a more usable format, 'alldataMelt'
  - Casts the dataset and calculates the mean value for all observations across all subjects and activities, 'alldataCast'
  - This data frame, 'alldataCast', contains the final, tidy data for completeion of the assignment.
