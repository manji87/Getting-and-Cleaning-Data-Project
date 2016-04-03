library(plyr) 
library(reshape2) 

setwd("C://Users//Manji//Dropbox//B files//Coursera//read & clean data//Project//UCI HAR Dataset")
getwd()

## Merging the train and test feature datasets

data_train_X <- read.table("train//X_train.txt")
data_test_X <- read.table("test//X_test.txt")

## Reading in the features
features <- read.table("features.txt",col.names=c("Index","Feature_label"))
f_labels <- as.character(features[,2])

f_label_split <- strsplit(f_labels,"\\-") 
f_label_sub <- grepl('mean()|std()',f_label_split) ## Getting a logical vector for mean() std() for feature labels 


## Merging the train and test datasets and giving them the column names
data_X <- rbind(data_train_X,data_test_X)  
colnames(data_X) <- f_labels 

## Taking out the columns with mean() and std() using the logical vector f_label_sub
f_data_X_mean_std <- data_X[,f_label_sub]
f_data_X_mean_std_label <- names(f_data_X_mean_std)

#Data set with mean and std Feature
write.table(f_data_X_mean_std, file = "raw_data.txt",row.names=FALSE)
##########################################################


## Merging the train and test subjects
subject_test <- read.table("test//subject_test.txt")
subject_train <- read.table("train//subject_train.txt")

subject <- rbind(subject_train,subject_test)  ## The merged subjects
colnames(subject) <- "Subject"

## Merging the train and test activities
data_train_Y <- read.table("train//Y_train.txt")
data_test_Y <- read.table("test//Y_test.txt")

activity <- rbind(data_train_Y,data_test_Y)  ## The merged activities
colnames(activity) <- "act_lab"

#Reading in the activity labels
act_labels <- read.table("activity_labels.txt")
colnames(act_labels)=c("act_lab","Activity")

# Renaming activity number by activity labels
activity_labeled <- join(activity,act_labels,by="act_lab")
activity_labeled[,1] <- NULL


#Adding the ActivityLabel column and Subject column to the teature dataset
data_all <- cbind(f_data_X_mean_std,activity_labeled,subject)

#Calculating Acerage of variable by each Activity and each Subject
melt_all_by_act_sub <- melt(data_all, id=c("Subject", "Activity"), measure.vars=f_data_X_mean_std_label)
mean_all_by_act_sub <- dcast(melt_all_by_act_sub, Activity + Subject ~ variable,mean)

#Tidying up the column names
all_col_names <- names(mean_all_by_act_sub)
tidy_col_names <- gsub("[()-]","",all_col_names)
tidy_col_names <- gsub("-","",tidy_col_names)
tidy_col_names <- gsub("mean","Mean",tidy_col_names)
tidy_col_names <- gsub("std","Std",tidy_col_names)
tidy_col_names <- gsub("BodyBody","Body",tidy_col_names)

colnames(mean_all_by_act_sub)=tidy_col_names

## Creating the 2 tidy data sets

#Tidy Dataset with means for each Feature x Activity x Subject 
write.table(mean_all_by_act_sub,file = "tidy_data.txt",row.names=FALSE)

