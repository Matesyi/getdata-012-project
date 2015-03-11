# Code Book 
## Getting and cleaning data - course project


### Variables
* __x\_train__, __y\_train__ and __subject\_train__ are tables from raw data files in course_project/train
* __x\_test__, __y\_test__ and __subject\_test__ are tables from raw data files in course_project/test

* __x\_merge__, __y\_merge__ and __subject\_merge__ are tables created by merging data from *_train and *_test tables using rbind

* __features\table__ and desired_cols are tables helping get desired columns from __x\_merge__

* __activity\_table__ is table created after reading of activity\_lables.txt and is used to give names to activities by IDs

* __final\_table__ is created by cbind all tables

* __average\_table__ containc means of all columns from __final\_table__

### Use of run_analysis.R
* After execution script uses raw data from directory "course_project"
* Script generates .txt file named "averages.txt" in root directory
* Script contains a lot of comments describing how it works
* For more informations oper this script in R Studio or other editor/enviroment