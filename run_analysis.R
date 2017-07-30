## This R script completes the tasks described in the final course 
## assignment for the Getting and Cleaning Data course. The script will
## read and merge the test and training data sets and give the variables
## and factors descriptive names. Finally a tidy data set of the averages
## of the means will be produced.

library(dplyr) ## dplyr is loaded for later use

## 1. Merging test and training data sets

## loading data sets
features <- read.table("features.txt") ## loads features file for names
features <- features[,2] ## removes first column leaving only names
features <- as.character(features) ## changes to character

test <- read.table("X_test.txt") ## loads test data
subjects_test <- read.table("subject_test.txt") ## reads subjects test data
activities_test <- read.table("y_test.txt") ## reads activity test data

training <- read.table("X_train.txt") ## loads training data
subjects_train <- read.table("subject_train.txt") ## reads training subjects data
activities_train <- read.table("y_train.txt") ## reads activity training data

##create data sets by combining subjects, activities, and measurements
test_data <- cbind(subjects_test,activities_test,test) 
training_data <- cbind(subjects_train,activities_train,training)

##add column names to subjects, activity, and the measurements
colnames(test_data) <- c("subject","activity",features)
colnames(training_data) <- c("subject","activity",features)

## merge test and training data sets 
merged <- rbind(test_data,training_data)
subjects <- merged[,1]
activities <- merged[,2]

## 2. Extracts only mean and standard deviation for each measurement

## find means and stds columns and extract them
mean_cols <- grep("mean",names(merged)) ## search for columns with "mean"
onlymeans <- merged[,mean_cols]
mean_names <- names(merged[,mean_cols])

std_cols <- grep("std",names(merged)) ## search for columns with "std"
onlystds <- merged[,std_cols]
std_names <- names(merged[,std_cols])

## combine subjects and activies with only means and stds into one data set
means_stds <- cbind(subjects,activities,onlymeans,onlystds)

## assign new column names 
colnames(means_stds) <- c("subject","activity",mean_names,std_names)

## 3. Use descriptive activity names to name activities

## creates logical vectors for activity values
activity1 <- means_stds$activity == 1
activity2 <- means_stds$activity == 2
activity3 <- means_stds$activity == 3
activity4 <- means_stds$activity == 4
activity5 <- means_stds$activity == 5
activity6 <- means_stds$activity == 6

## replaces activity values with activity names
means_stds$activity <- replace(means_stds$activity,activity1,"walking")
means_stds$activity <- replace(means_stds$activity,activity2,"walking_upstairs")
means_stds$activity <- replace(means_stds$activity,activity3,"walking_downstairs")
means_stds$activity <- replace(means_stds$activity,activity4,"sitting")
means_stds$activity <- replace(means_stds$activity,activity5,"standing")
means_stds$activity <- replace(means_stds$activity,activity6,"laying")

## 4. Appropriately labels the data set with descriptive variable names.

## done in step 2 on row 52

## 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## groups data first by subject
tidy_data <- group_by(means_stds, subject) ## groups merged data by subject

## then groups data by activity, keeping subject groups
tidy_data <- group_by(tidy_data, activity, add=TRUE)

## summarizes data by finding mean of each variable by subject and activity
tidy_data_final <- summarize_all(tidy_data, .funs = mean)

## writes data to output .txt file
write.table(tidy_data_final, file = "tidy_data_final.txt", row.names=FALSE)
