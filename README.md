Getting and Cleaning Data Course Project
=======

This repo contains R script and a Codebook for Coursera "Getting and Cleaning Data" Course Project 

The goal of the script in this repo is to prepare tidy data that can be used for later analysis.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description and data files are available at the course site: 
https://class.coursera.org/getdata-004/human_grading/view/courses/972137/assessments/3/submissions

Instructions
=======

 * Download ZIP file with the data from the course web site. 
 * Extract it into "UCI HAR" folder. 
 * Clone this repo (https://github.com/ivanku/UCI-HAR) in such a way that you have the following directory structure:
 .
 |- UCI HAR (data foler here)
 |- UCI-HAR (cloned repo here)

Go to UCI-HAR directory and run R script run_analysis.R

Example: R --no-save < run_analysis.R 

The script does the following:
 * Merges the training and the test sets to create one data set.
 * Extracts only the measurements on the mean and standard deviation for each measurement. 
 * Uses descriptive activity names to name the activities in the data set
 * Appropriately labels the data set with descriptive variable names. 
 * Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 * Saves the tidy dataset into tidy.csv
