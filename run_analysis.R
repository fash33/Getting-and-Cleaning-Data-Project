# Load the required libraries
library(dplyr)

# Downloading file and setting directory
file_name <- "getdata_UCI_HAR_Dataset.zip"
if(!file.exists(file_name)) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, destfile = file_name)
}
if(!file.exists("./UCI HAR Dataset")){
  unzip(file_name) 
}

setwd("./UCI HAR Dataset")

# loading mean and statndard deviation measurements 
features <- read.table("./features.txt")
features[,2] <- as.character(features[,2])
mean_std <- grep(".*mean.*|.*std.*", features[,2])
mean_std.names <- features[mean_std,2]

# loading activity labels
activity_labels <- read.table("./activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

#loading and merging train and test data to create one data set
train_subject <- read.table("./train/subject_train.txt")
train_x <- read.table("./train/X_train.txt")[mean_std]
train_y <- read.table("./train/Y_train.txt")
trains <- cbind(train_subject, train_y, train_x)
test_subject <- read.table("./test/subject_test.txt")
test_x <- read.table("./test/X_test.txt")[mean_std]
test_y <- read.table("./test/Y_test.txt")
tests <- cbind(test_subject, test_y, test_x)
data <- rbind(trains, tests)
colnames(data) <- c("subject", "activity", mean_std.names)

# creating an independent tidy set with the average of each variable for each activity and subject
data2 <- data %>% group_by(subject, activity) %>% summarise_each(funs(mean(.,na.rm=TRUE)))
write.table(data2, "tidy.txt", row.names = FALSE, quote = FALSE)
