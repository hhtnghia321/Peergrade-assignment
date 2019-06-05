#install required packages
if(packageVersion("dplyr") == Null){
  install.packages("dplyr")
}

#load package
library(dplyr)

#download file 
if(!file.exists(Dataset.zip)){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile = paste0(getwd(), "/Dataset.zip"), method = "curl")
}

#unzip the file
if(!file.exists("UCI HAR Dataset")){
  unzip("Dataset.zip")
}
#read Feature list
Features <- read.table(paste0(getwd(), "/UCI HAR Dataset/features.txt"), col.names = c("n", "features")) 

#read train data
Label_train <-read.table(paste0(getwd(), "/UCI HAR Dataset/train/y_train.txt"), col.names = "featurecode" )
Set_train <-read.table(paste0(getwd(), "/UCI HAR Dataset/train/X_train.txt"), col.names = Features$features)
Subj_train <- read.table(paste0(getwd(), "/UCI HAR Dataset/train/subject_train.txt"), col.names ="Subjects" )

#read test data
Label_test <-read.table(paste0(getwd(), "/UCI HAR Dataset/test/y_test.txt"),col.names = "featurecode") 
Set_test <-read.table(paste0(getwd(), "/UCI HAR Dataset/test/X_test.txt"), col.names = Features$features)
Subj_test <- read.table(paste0(getwd(), "/UCI HAR Dataset/test/subject_test.txt"), col.names ="Subjects")

#read activity
Activities <- read.table(paste0(getwd(), "/UCI HAR Dataset/activity_labels.txt"), col.names = c("code", "activities"))

#merge the data
Set <- rbind(Set_train,Set_test)
Label <- rbind(Label_train,Label_test)
Subj <- rbind(Subj_train, Subj_test)
Total1 <- cbind(Subj, Label, Set)

#Name activities
Total1$featurecode <- Activities[Total1$featurecode, 2]

#rename the activities colum
names(Total1)[names(Total1) == "featurecode"] <- "Activities"


#Extract only the mean and standard deviation
Total <- select(Total1,Subjects,Activities,contains("mean"), contains("std"))

#feature renames
colnames(Total) <- sub("^t", "Time", colnames(Total))
colnames(Total) <- sub("^f", "Fourier", colnames(Total))
colnames(Total) <- sub("Acc", "Acceleration", colnames(Total))
colnames(Total) <- sub("Gyro", "Gyroscope", colnames(Total))
colnames(Total) <- sub("/.mean()", "-Mean", colnames(Total))
colnames(Total) <- sub("/.std()", "-StandardDeviation", colnames(Total))
colnames(Total) <- sub("Mag", "Magnitude", colnames(Total))
colnames(Total) <- sub("BodyBody", "Body", colnames(Total))
colnames(Total) <- sub("Freq", "Frequency", colnames(Total))
colnames(Total) <- sub("/.(/.){,1}/.", ".", colnames(Total))
colnames(Total) <- sub("angle", "Angle", colnames(Total))
colnames(Total) <- sub("gravity", "Gravity", colnames(Total))

#create independent table that have 
Tidydataset <- Total %>% group_by(Activities, Subjects) %>% summarize_all(list(mean))
write.table(Tidydataset,"Tidydataset.txt")