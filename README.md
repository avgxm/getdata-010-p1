# extdata-010-p1

This repo is the R assignment for the Getting and Cleaning Data class.
The purpose of this assignment was to demonstrate collection, working with, and cleaning a data set.
The goal is to prepare tidy data that can be used for later analysis.

## File flow diagram
![file flow digram] (https://raw.githubusercontent.com/avgxm/getdata-010-p1/master/p1-df.png "")

## Input data
The input data was collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

## Processing
The R script run_analysis.R does the following:

1. Read all the input files into data frames (The input files must be unzipped into the default directory first)
2. Combine the test and train data frames into new
3. Subset the new df, selecting columns whose' names contain "Activity", "Subject", ".std.", ".mean."
4. Compute averages of variables grouped by Activity, Subject
5. Write the resulting df to file

*Tested with RStudio 0.98.1091 on Apple OS X 10.10.1 (14B25)*

## Output
tidy.txt is generated by run_analysis.R

## R Code Book
See CodeBook.md.

