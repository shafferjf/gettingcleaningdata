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

1. features - list of measurement variable names from UCI HAR Datset
2. test - data frame of test data
3. subjects_test - subjects data for test condition
4. activities_test - activities data for test conditon
5. training - data frame of training data
6. subjects_train - subjects data for training condition
7. activities_train - activities data for training conditon
8. test_data - data frame of test data, subjects, and activities
9. training_data - data frame of training data, subjects, and activities
10. merged - merged data frame of test_data and training_data
11. subjects - subjects column from merged
12. activities - activities column from merged
13. mean_cols - names in merged that include the string "mean"
14. onlymeans - columns from merged that include variable name with "mean"
15. mean_names - names in merged that include the string "mean"
16. std_cols - names in merged that include the string "std"
17. onlystds - columns from merged that include variable name with "std"
18. std_names - names in merged that include the string "std"
19. means_stds - data frame with subjects, activities, and only variables that include "mean" or "std"
20. activityX - logical vector with data for activityX (1 to 6) from activity column in means_stds
21. tidy_data - means_stds grouped by subject and activity
22. tidy_data_final - summary data of means of each variable by subject and activity
