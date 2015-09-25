# Getting-and-Cleaning-Data
==============================================================================
Course Project ReadMe
==============================================================================

From the following url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
download the data files "UCI HAR Dataset" and put it in my R working directory.
Change the file name from "UCI HAR Dataset" to "Project".

Firstly I read all the training and test data using read.table function, the data include
"X_train.txt, y_train.txt, X_test.txt, y_test.txt". I changed the column names of "Y_test"
and "Y_train" to be "activities" for ease in the later steps.
Then I read the "activity_labels.txt" and renamed its two columns, one column named
"activities" is for the activity numbers (1-6), the other column named "names" is for the
activity names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

Then I combined each measurement with its activity labels using cbind function, and merge
the test and training dataset using rbind function. The dataset after merging is named
"Mergedata", at this point, "Mergedata" has 10299 rows and 562 columns. The 1-561 columns
are for the measurements based on 561 features, the last column is for the activity numbers.

Next I used the "for loop" to loop through the activity numbers on the last column of 
"Mergedata", so that each activity number will be converted to its corresponding activity
names from the "activity_labels.txt". What I did was, I will retrieve only the last column
of Mergedata (named "activities") and replace each value in this vector by matching the
activity name to the activity number that is equal to this value.

With all the activity numbers converted to activity names, I extract 87 features from 
the total 561 feature columns. Those 87 features are measurements of mean and standard
deviations. The 87 features extracted are:
 1."tBodyAcc-mean()-X"                
  2. "tBodyAcc-mean()-Y"                     3."tBodyAcc-mean()-Z"                   
  4."tBodyAcc-std()-X"                       5."tBodyAcc-std()-Y"                    
  6."tBodyAcc-std()-Z"                      41."tGravityAcc-mean()-X"                
 42."tGravityAcc-mean()-Y"                  43."tGravityAcc-mean()-Z"                
 44."tGravityAcc-std()-X"                   45."tGravityAcc-std()-Y"                 
 46."tGravityAcc-std()-Z"                   81."tBodyAccJerk-mean()-X"               
 82."tBodyAccJerk-mean()-Y"                 83."tBodyAccJerk-mean()-Z"               
 84."tBodyAccJerk-std()-X"                  85."tBodyAccJerk-std()-Y"                
 86."tBodyAccJerk-std()-Z"                 121."tBodyGyro-mean()-X"                  
 122."tBodyGyro-mean()-Y"                  123."tBodyGyro-mean()-Z"                  
 124."tBodyGyro-std()-X"                   125."tBodyGyro-std()-Y"                   
 126."tBodyGyro-std()-Z"                   161."tBodyGyroJerk-mean()-X"              
 162."tBodyGyroJerk-mean()-Y"              163."tBodyGyroJerk-mean()-Z"              
 164."tBodyGyroJerk-std()-X"               165."tBodyGyroJerk-std()-Y"               
 166."tBodyGyroJerk-std()-Z"               201."tBodyAccMag-mean()"                  
 202."tBodyAccMag-std()"                   214."tGravityAccMag-mean()"                
 215."tGravityAccMag-std()"                227."tBodyAccJerkMag-mean()"              
 228."tBodyAccJerkMag-std()"               240."tBodyGyroMag-mean()"                
 241."tBodyGyroMag-std()"                  253."tBodyGyroJerkMag-mean()"             
 254."tBodyGyroJerkMag-std()"              266."fBodyAcc-mean()-X"                   
 267."fBodyAcc-mean()-Y"                   268."fBodyAcc-mean()-Z"                   
 269."fBodyAcc-std()-X"                    270."fBodyAcc-std()-Y"                    
 271."fBodyAcc-std()-Z"                    294."fBodyAcc-meanFreq()-X"               
 295."fBodyAcc-meanFreq()-Y"               296."fBodyAcc-meanFreq()-Z"               
 345."fBodyAccJerk-mean()-X"               346."fBodyAccJerk-mean()-Y"               
 347."fBodyAccJerk-mean()-Z"               348."fBodyAccJerk-std()-X"                
 349."fBodyAccJerk-std()-Y"                350."fBodyAccJerk-std()-Z"                
 373."fBodyAccJerk-meanFreq()-X"           374."fBodyAccJerk-meanFreq()-Y"            
 375."fBodyAccJerk-meanFreq()-Z"           424."fBodyGyro-mean()-X"                  
 425."fBodyGyro-mean()-Y"                  426."fBodyGyro-mean()-Z"                   
 427."fBodyGyro-std()-X"                   428."fBodyGyro-std()-Y"                   
 429."fBodyGyro-std()-Z"                   452."fBodyGyro-meanFreq()-X"               
 453."fBodyGyro-meanFreq()-Y"              454."fBodyGyro-meanFreq()-Z"              
 503."fBodyAccMag-mean()"                  504."fBodyAccMag-std()"                   
 512."fBodyAccMag-maxInds"                 513."fBodyAccMag-meanFreq()"              
 516."fBodyBodyAccJerkMag-mean()"          517."fBodyBodyAccJerkMag-std()"           
 526."fBodyBodyAccJerkMag-meanFreq()"      529."fBodyBodyGyroMag-mean()"             
 530."fBodyBodyGyroMag-std()"              539."fBodyBodyGyroMag-meanFreq()"          
 542."fBodyBodyGyroJerkMag-mean()"         543."fBodyBodyGyroJerkMag-std()"          
 552."fBodyBodyGyroJerkMag-meanFreq()"     555."angle(tBodyAccMean,gravity)"         
 556."angle(tBodyAccJerkMean),gravityMean)"557."angle(tBodyGyroMean,gravityMean)"   
 558."angle(tBodyGyroJerkMean,gravityMean)"559."angle(X,gravityMean)"                
 560."angle(Y,gravityMean)"                561."angle(Z,gravityMean)" 

Besides extracting the 87 means and std features, I also extracted the activity names
column, and put them all together and name it "MergeExtract". This MergeExtract data
frame contains 88 columns, with the 1st column being the activity names and the rest 87
columns being the means and std measurements.

Then I read the "feature.txt" using read.table and extract those 87 feature names.
By using names() function I could rename each column of "MergeExtract", which has 88 
columns at this moment. So I simply pass the extracted 87 features names to the 2-88 
columns, and name the 1st column "activities".

After this each column name in the "MergeExtract" is defined, which corresponds to its
feature name. Next thing I need to do is to add a new column representing the subject
involved in measurement. Reading the "subject_test.txt" and "subject_train.txt" files
and combine the two file using rbind() function, then name the column "subjects". Merge
this "subjects" column with "MergeExtract" using cbind() and the new data frame after 
merging is named "Data". Up to this point, the "Data" contains 10299 rows and 89 columns.
The first column is "subjects" and the 2nd column is "activities". The 3rd to 89th column
are for the selected 87 features. Point 1 to point 4 are all included at this point.

For point 5, I summarize the feature names for the 87 selected features and call it
"ALL_activities". Then I resort to teh "reshape2" package because I'm going to use
the dcast() function to obtain the mean value of each measurement for each activity and 
each subject. The "Data" is used for reshaping, and I put "subjects" and "activities"
vertically (on the left side of "~"), the 87 feature names horizontally (on the right side
of "~"), then I apply the mean to each feature name. The resulting dcast data frame is 
called "Tidy", which has 180 rows and 89 columns.

Then I used the write.table() function to create a txt file named "Step_5.txt", it is 
created under my working directory and I will upload it.
