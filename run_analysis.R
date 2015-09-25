## downloaded the .zip file by clicking the link, unzipped the file and renamed it to be "Project", moved "Project" to my R working directory.

## read the training and test data into R, rename the activities columns.
X_train<-read.table("Project/train/X_train.txt")
Y_train<-read.table("Project/train/y_train.txt")
X_test<-read.table("Project/test/X_test.txt")
Y_test<-read.table("Project/test/y_test.txt")
names(Y_test)<-"activities"
names(Y_train)<-"activities"

## read the activity labels into R, and rename its two columns as "activities", "names", respectively.
labels<-read.table("Project/activity_labels.txt",stringsAsFactors=FALSE)
names(labels)<-c("activities","names")

## merge the training and test data to create one data set.[Point #1]
Bind_test<-cbind(X_test,Y_test)
Bind_train<-cbind(X_train,Y_train)
Mergedata<-rbind(Bind_test,Bind_train)

## Replace the activity numbers with descriptive activity names for all data. [Point #3]
Act<-Mergedata$activities
for (i in 1:length(Act)) {
	index<-which(labels$activities==Act[i])
	Mergedata$activities[i]<-labels$names[index]}

## extract 87 measurements corresponding to the means and standard deviations from the 561 features.[Point #2]. The 1st column is for the descriptive activity names, which were converted from the feature numbers.
MergeExtract<-Mergedata[,c(562,1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,452:454,503:504,512:513,516:517,526,529:530,539,542:543,552,555:561)]

## read the features.txt into R, and extract only the features that correspond to means and standard deviations from the 561 features.
features<-read.table("Project/features.txt", stringsAsFactors=FALSE)
featuresExtract<-features[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,452:454,503:504,512:513,516:517,526,529:530,539,542:543,552,555:561),]

## Label dataset columns with their corresponding decriptive variable names. [Point #4]. The first column is for the descriptive activity names.
names(MergeExtract)<-c("activities",featuresExtract[,2])

## read subject info into R. Add a new column named "subjects" to the "MergeExtract" data frame and name it "Data".
Subject_test<-read.table("Project/test/subject_test.txt")
Subject_train<-read.table("Project/train/subject_train.txt")
Subject_info<-rbind(Subject_test,Subject_train)
names(Subject_info)<-"subjects"
Data<-cbind(Subject_info,MergeExtract)

## obtain only the names of 87 measurements, pick the 87 names and apply the "dcast" function so that "subjects" and "features" are spreaded out vertically, and the 87 names are spreaded out horizontally, then obtain the mean value of each measurement for each activity and each subject, name the resulting data frame "Tidy". [Point #5]. 
ALL_activities <- names(Data)[c(-1,-2)]
library(reshape2)
Tidy<-dcast(Data,subjects + activities ~ ALL_activities,mean)
Tidy ## Contains 180 rows and 89 columns.


