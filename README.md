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


The codebook for all variables used in this project is listed below.

Variables in final tidy data set per column number:

1. Subject - subject number (1 to 30)
2. Activity - type of activity (from activity_labels.txt - walking, walking_upstairs, walking_downstairs, sitting, standing, laying)
3. to 81. Means of each measurement (names from features.txt)


Variables used in "run_analysis.R" script:

features - list of measurement variable names from UCI HDR Datset
test - data frame of test data
subjects_test - subjects data for test condition
activities_test - activities data for test conditon
training - data frame of training data
subjects_train - subjects data for training condition
activities_train - activities data for training conditon
test_data - data frame of test data, subjects, and activities
training_data - data frame of training data, subjects, and activities
merged - merged data frame of test_data and training_data
subjects - subjects column from merged
activities - activities column from merged
mean_cols - names in merged that include the string "mean"
onlymeans - columns from merged that include variable name with "mean"
mean_names - names in merged that include the string "mean"
std_cols - names in merged that include the string "std"
onlystds - columns from merged that include variable name with "std"
std_names - names in merged that include the string "std"
means_stds - data frame with subjects, activities, and only variables that include "mean" or "std"
activityX - logical vector with data for activityX (1 to 6) from activity column in means_stds
tidy_data - means_stds grouped by subject and activity
tidy_data_final - summary data of means of each variable by subject and activity
