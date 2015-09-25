Code Book 

X_train

	measurements for the 561 features of training. It contains 561 columns, each column 
	corresponds to each separate feature.It contains 7352 rows. Details of each feature 
	can be found in the "features.txt" file. 
Y_train

	activities of training. It also contains 7352 rows. Six activities in total: 
	WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
	see "activity_labels.txt"
X_test

	measurements for the 561 features of test. It contains 561 columns, each column
	corresponds to each separate feature. It contains 2947 rows. Details of each feature
	see "feature.txt" file.
Y_test

	activities of test. It also contains 2947 rows. Six activities in total: 
	WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
	see "activity_labels.txt"

The column names of "Y_test" and "Y_train" are changed to "activities".

labels

	the six labels for 6 different activities while measuring. The column names of 
	"labels" are changed to "activities" and "names".
		1. WALKING
		2. WALKING_UPSTAIRS
		3. WALKING_DOWNSTAIRS
		4. SITTING
		5. STANDING
		6. LAYING
		
Bind_test

	column bind of "X_test" and "Y_test"
Bind_train

	column bind of "X_train" and "Y_train"
Mergedata

	row bind of "Bind_test" and "Bind_train". The Mergedata has 10299 rows, and 562 
	columns, the 1-561 columns correspond to those 561 features, the 562th column has a 
	column name of "activities", it is for the six different activities numbers.
	
Act

	subset the column from "Mergedata" named "activities".
index

	the row number from the data frame "labels", where the ith value in "Act" equals to 
	that activity number in "labels". By using the for loop, all the activity numbers
	in the 562th column of "Mergedata" are converted to corresponding activity names.
	
MergeExtract

	Extract only the features of mean and standard deviations from those 561 features. 
	The "activities" column was put forward as the first column.
	Shown below are the selected columns of measurements on means and standard deviations
	based on my criterion, any feature names from those 561 features that contain either
	"mean" or "std" are selected. 87 feature names were picked up here.
	
 562."activities"                            1."tBodyAcc-mean()-X"                
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
 
 features

 	the feature names for those 561 features. 
 featuresExtract
 
 	extract only the select 87 feature names as above-mentioned. 
 	
 Subject_test
 
 	numbers that represent different subjects involved in the test. It contains 2947 
 	rows.
 Subject_train
 
 	numbers that represent different subjects involve in the training. It contains 7352
 	rows.
 Subject_info
 
 	combine the Subject_test and Subject train together. It has 10299 rows.
 Data
 
 	column bind the "Subject_info" and "MergeExtract". Now the first column is named 
 	"subjects", the number 1-30 represent 30 diffrent subjects involved in the measuring.
 	The 2nd column is named "activities", representing the 6 different activities. The 
 	rest 87 columns are for the features corresponding to mean and std.
 	
 ALL_activities
 
 	names of the 87 selected features.
 Tidy
 
 	The final independent dataset with the average of each variable for each activity 
 	and each subject.
