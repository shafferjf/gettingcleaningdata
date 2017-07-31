# gettingcleaningdata

This README file explains the final assignment for the Coursera Getting and Cleaning Data course.

The goal of this project was to merge two data sets, give the variables descriptive names, and produce a tidy data set that includes the means of selected variables. To do so, the script "run_analysis.R" has been created and is included in this repo.

For "run_analysis.R" to work properly, the files from the UCI HAR Dataset folders need to be rearranged. Remove all of the files from the "test" and "training" subfolders and place them in the parent "UCI HAR Dataset" folder. Please do this before running "run_analysis.R" to ensure that the script runs properly.

The "run_analysis.R" script produces the final output data file through the following steps:

1. Reads the subject, activity, features, test, and training data files into R.
2. Creates data sets for test data and training data that include subjects, activities, and the data measurements.
3. Descriptive column names are added to the data sets.
4. The test and training data sets are merged into one.
5. The variables that are either means or standard deviations of measurements are extracted from the merged data set and placed into a new data set.
6. Descriptive column names for each variable are added.
7. The activity numbers (1 to 6) are replaced by descriptive names (walking, etc).
8. A second independent tidy data set is created with the means of each variable grouped by each subject and activity.
9. The final data set is exported as a .txt file.
