## Step 1 - set path, read data. Merges the training and test sets to create one data set.

setwd("~/Mathfreak Data/DataProjects/R/Coursera/UCI HAR Dataset")
subjectTrain <- read.table("./train/subject_train.txt",header = FALSE, sep="")
trainData <- read.table("./train/X_train.txt",header = FALSE,sep="")
trainLabel <- read.table("./train/y_train.txt",header = FALSE,sep="")
dim(subjectTrain)
dim(trainData)
dim(trainLabel)
subjectTest <- read.table("./test/subject_test.txt",header = FALSE, sep="")
testData <- read.table("./test/X_test.txt",header = FALSE,sep="")
testLabel <- read.table("./test/y_test.txt",header = FALSE,sep="")
dim(subjectTest)
dim(testData)
dim(testLabel)
joinSubject <- rbind(subjectTrain, subjectTest)
dim(joinSubject)
joinData <- rbind(trainData,testData)
dim(joinData)
joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel)


## Step 2 - Extracts only measurements on the on the mean and standard deviation for each measurement.
features <- read.table("features.txt",header = FALSE, sep="")
activity <- read.table("activity_labels.txt",heade = FALSE, sep = "")
g <- grep("mean\\(\\)|std\\(\\)", features[,2])
subset <- joinData[,g]

## Step 3 - Uses descriptive activity names to name the activities in the data set
## and step 4 - Appropriately label the data set with descriptive activity names
x1 <- gsub(1,"walking",joinLabel[,1])
x2 <- gsub(2,"walking_upstairs",x1)
x3 <- gsub(3,"walking_downtairs",x2)
x4 <- gsub(4,"sitting",x3)
x5 <- gsub(5,"standing",x4)
x6 <- gsub(6,"laying",x5)
join <- cbind(joinSubject,x6,subset)
write.table(join,"merged_data.txt")


## Step 5 - Create a second, independent tidy data set with the average of 
## each variable for each activity and each subject. 
join[join == -1] <- NA
any(join == -1, na.rm = TRUE)
install.packages("reshape2")
library("reshape2")
melted <- melt(join, id=c("subject","activity"))
tidy <- dcast(melted, subject+activity ~ variable, mean)
write.table(tidy, "tidy_data_summary.txt")
