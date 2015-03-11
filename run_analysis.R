#loading packages
library(dplyr)
library(plyr)

#step 1 - merging tables

#1.1 read train tables
subject_train <- read.table("course_project/train/subject_train.txt")
x_train <- read.table("course_project/train/X_train.txt")
y_train <- read.table("course_project/train/y_train.txt")
#1.2 read test tables
subject_test <- read.table("course_project/test/subject_test.txt")
x_test <- read.table("course_project/test/X_test.txt")
y_test <- read.table("course_project/test/y_test.txt")
#1.3 merging tables using rbind function
x_merge <- rbind(x_train, x_test)
y_merge <- rbind(y_train, y_test)
subject_merge <- rbind(subject_train, subject_test)

#step 2 - extracting subset

#2.1 get desired names of cols from features table
features_table <- read.table("course_project/features.txt")
desired_cols <- grep("-(mean|std)\\(\\)", features_table[, 2]) #using regular expression get all columns with mean or std
#2.2 subset x_merge
x_merge <- x_merge[ ,desired_cols] #select columns
names(x_merge) <- features_table[desired_cols, 2] #gives columns in x_merge fine names

#step 3 - giving names to data set

#3.1 read activity table
activity_table <- read.table("course_project/activity_labels.txt")
#3.2 renaming rows by activity ID to it's name and renaming columns name
y_merge[, 1] <- activity_table[y_merge[, 1], 2]
names(y_merge) <- "activity"

#step 4 - labeling data with names

#4.1 giving right name to col in subject_merge
names(subject_merge) <- "subject"
#4.2 creating one huge table using cbind
final_table <- cbind(x_merge, y_merge, subject_merge)

#step 5 - creating table of average values

#5.1 grouping and counting :)
average_table <- ddply(final_table, #source table
                       .(subject, activity), #variables to split data frame by
                       function(x) colMeans(x[, 1:66])) #function mean applied to each column except last two

#step 6 - creating final doc averages.txt

write.table(average_table, "averages.txt", row.name=FALSE)





