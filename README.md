# gettingcleaningdata

This README file explains the final assignment for the Coursera Getting and Cleaning Data course.

The goal of this project was to merge two data sets, give the variables descriptive names, and produce a tidy data set that includes the means of selected variables. To do so, the script "run_analysis.R" has been created and is included in this repo.

For "run_analysis.R" to work properly, the files from the UCI HAR Dataset folders need to be rearranged. Remove all of the files from the "test" and "training" subfolders and place them in the parent "UCI HAR Dataset" folder. Please do this before running "run_analysis.R" to ensure that the script runs properly.

The "run_analysis.R" script produces the final output data file through the following steps:

1. Reads the subject, activity, features, test, and training data files into R.
2. Creates data sets for test data and training data that include subjects, activities, and the data measurements.
3. Descriptive column names are added to the data sets.
4. The test and training data sets are merged into one.
5. 


The codebook for all variables used in this project is listed below.

Variables in final tidy data set per column number:

1. Subject - subject number (1 to 30)
2. Activity - type of activity (from activity_labels.txt - walking, walking_upstairs, walking_downstairs, sitting, standing, laying)
3. to 81. Means of each measurement (names from features.txt)


Variables used in "run_analysis.R" script:


