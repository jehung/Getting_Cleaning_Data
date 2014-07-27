##This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

* The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The run_analysis.R script performs the following steps to clean the data:
* Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in trainData, trainLabel and SubjectTrain variables respectively

* Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in testData, testLabel and SubjectTest variables respectively.

* Concatenate testData to trainData to generate a 10299x561 data frame, joinData; concatenate testLabel to trainLabel to generate a 10299x1 data frame, joinLabel; concatenate SubjectTest to SubjectTrain to generate a 10299x1 data frame, joinSubject.

* Read the features.txt file from the "/data" folder and store the data in a variable called features. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of joinData with the 66 corresponding columns, denoted by the variable subset.

* Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called activity.

* Transform the values of joinLabel according to the activity data frame. We get a column vector named x6.

* Combine the joinSubject, x6, and subset by column to get a new cleaned 10299x68 data frame, join. The data frame "join" already has the first two columns properly named, namely, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.

* Write the cleanedData out to "merged_data.txt" file in current working directory.

* Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.

* Write the result out to "tidy_data_summary.txt" file in current working directory.
