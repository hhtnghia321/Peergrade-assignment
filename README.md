# Getting and Cleaning Data Course Project
This is the original repository have all of the requested file for the course criteria of Getting and Cleaning Data Course Projects

## Main files list
1. The **run_analysi.R** which contain the code line with explaination for organising and tidying the data followed the insturction by the coursera project 
2. the **Tidydataset.txt** contained the tidied and calculated data by the mean of each variable (*feature*) of the original Dataset 
3. the **CodeBook.md** explained about the descirption of the **Tidydataset.txt** file
4. I also include the **Peergrade-assignment.Rproj** for those who want to fork my project in order to examine, edit or do what every they want continuely 

## Dataset abstract
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> you can get your download of the dataset file **[Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)**
unzip file to get the *UCI HAR Data* folder which contain all of the untidy data. The folder contain:
1. The **README.txt**: explain about the experiment, how they measure the experiment observation and more information about other file
2. The **Test** and **Train** folder containt the primary data

## Simple exmaplaination for the run_analysis.R file
1. download all needed R packages for the analysis (dplyr)
2. load the package
3. Download the **Dataset.zip** file for the  project
4. unzip the file
5. read all the needed file:
  - *X_train.txt*, *X_test.txt* for the data
  - *y_train.txt*, *y_test.txt* for the Activities code
  - *subject_train.txt*, *subject_text.txt* for the subject index
  - *feature.txt* for the varibles name
  - *activity_labels.txt* for the activities name with corresponding code
6. Merge the train and test data with correponding activity code and subject index
7. rename the activity code with its name base on the *activity_labels.txt* file
8. rename each shortened words in original variables name with the its full name for more comprehensive view
9. recreate a independent table which contain the mean of each varibles for each activity and subject
10. Export the independent file into the **Tidydataset.txt**
11. Delete all of the unnecessary objects

## Variable Desciption
> the description is presented in the Codebook.md