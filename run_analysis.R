library(plyr)

      #what will this script do:
      # 1. Merge the training and the test sets to create one data set

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_merge <- rbind(x_train, x_test)
y_merge <- rbind(y_train, y_test)
subject_merge <- rbind(subject_train, subject_test)

      # 2.Extract only the measurements on the mean and standard deviation for each measurement.

features <- read.table("UCI HAR Dataset/features.txt")
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_merge <- x_merge[, mean_and_std_features]
names(x_merge) <- features[mean_and_std_features, 2]

      #3. Use descriptive activity names to name the activities in the data set

act <- read.table("UCI HAR Dataset/activity_labels.txt")
y_merge[,1] <- act[y_merge[,1],2]
names(y_merge) <- "activity"

      # 4. Appropriately labels the data set with descriptive variable names.

names(subject_merge) <- "subject"

      #4.1. Concatenate 3 merges alltogether

HAR <- cbind(x_merge, y_merge, subject_merge)

      #5. From the data set in step 4, creates a second, independent tidy data set
          #with the average of each variable for each activity and each subject

avg_data <- ddply(HAR, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(avg_data, "averages_data.txt", row.name=FALSE)





