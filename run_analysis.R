## 1. Merging test and training data sets

library(dplyr)
## loading data sets
features <- read.table("features.txt") ## loads features file
features <- features[,2] ##removes first column leaving only names
features <- as.character(features) ##changes to character

test <- read.table("X_test.txt")
subjects_test <- read.table("subject_test.txt")
activities_test <- read.table("y_test.txt")

training <- read.table("X_train.txt")
subjects_train <- read.table("subject_train.txt")
activities_train <- read.table("y_train.txt")

##create data sets
test_data <- cbind(subjects_test,activities_test,test)
training_data <- cbind(subjects_train,activities_train,training)

##add column names
colnames(test_data) <- c("subject","activity",features)
colnames(training_data) <- c("subject","activity",features)

## merge data sets 
merged <- rbind(test_data,training_data)
subjects <- merged[,1]
activities <- merged[,2]

## 2. Extracts only mean and standard deviation for each measurement

## find means and stds columns and extract them
mean_cols <- grep("mean",names(merged))
onlymeans <- merged[,mean_cols]
mean_names <- names(merged[,mean_cols])

std_cols <- grep("std",names(merged))
onlystds <- merged[,std_cols]
std_names <- names(merged[,std_cols])

## combine subjects and activies with only means and stds
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

## done in step 2 when merging the data

## 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data <- group_by(means_stds, subject) ## groups merged data by subject
tidy_data <- group_by(tidy_data, activity, add=TRUE) ## groups merged data by activity
tidy_data_final <- summarize_all(tidy_data, .funs = mean) ## summarizes data by calculating mean for each activity for each subject
write.table(tidy_data_final, file = "tidy_data_final.txt", row.names=FALSE) ## write output .txt file of summary data

