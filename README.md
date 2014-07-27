Getting-Cleaning-Data
=====================

Getting_Cleaning_Data_Coursera - Peer_Assessment
Getting-Cleaning-Data
=====================

Getting_Cleaning_Data_Coursera - Peer_Assessment
This file describes how run_analysis.R script works.

First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "data".
Make sure the folder "data" and the run_analysis.R script are both in the current working directory.

Second, use source("run_analysis.R") command in RStudio.

Third, you will find two output files are generated in the current working directory:
merged_data.txt: it contains a data frame called cleanedData with dimension of 10299*68.
tidy_data_summary.txt: it contains a data frame called result with dimension of 180*68.

Finally, use data <- read.table("tidy_data_summary.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.
