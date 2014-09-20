Xtrain<-read.table('./UCI HAR Dataset/train/X_train.txt', header=FALSE, sep="",stringsAsFactors=FALSE, fill=TRUE)
Xtest<-read.table('./UCI HAR Dataset/test/X_test.txt', header=FALSE, sep="",stringsAsFactors=FALSE, fill=TRUE)

subjecttrain<-read.table('./UCI HAR Dataset/train/subject_train.txt', header=FALSE, sep="",stringsAsFactors=FALSE, fill=TRUE)
subjecttest<-read.table('./UCI HAR Dataset/test/subject_test.txt', header=FALSE, sep="",stringsAsFactors=FALSE, fill=TRUE)

Ytrain<-read.table('./UCI HAR Dataset/train/Y_train.txt', header=FALSE, sep="",stringsAsFactors=FALSE, fill=TRUE)
Ytest<-read.table('./UCI HAR Dataset/test/Y_test.txt', header=FALSE, sep="",stringsAsFactors=FALSE, fill=TRUE)

features<-read.table('./UCI HAR Dataset/features.txt', header=FALSE, sep="",stringsAsFactors=FALSE, fill=TRUE)

train<-cbind(Xtrain,subjecttrain,Ytrain)
test<-cbind(Xtest,subjecttest,Ytest)

alldata<-rbind(train,test)


names(alldata)<-c(features[,2],"subject","activity")

featuresmean<-grep("mean()",as.character(features[,2]), fixed=TRUE)
featuresstd<-grep("std()",as.character(features[,2]), fixed=TRUE)
featuresfilter<-c(featuresmean,featuresstd)
featuresfilter<-sort(featuresfilter)

dataextract<-alldata[,c(562,563,featuresfilter)]

dataextract$act<-"unassigned"
dataextract$act[dataextract$activity==1]<-"WALKING"
dataextract$act[dataextract$activity==2]<-"WALKING_UPSTAIRS"
dataextract$act[dataextract$activity==3]<-"WALKING_DOWNSTAIRS"
dataextract$act[dataextract$activity==4]<-"SITTING"
dataextract$act[dataextract$activity==5]<-"STANDING"
dataextract$act[dataextract$activity==6]<-"LAYING"

dataextract[,2]<-dataextract[,69]
dataextract$act<-NULL

library(dplyr)
groupeddata<-group_by(dataextract, subject, activity)

library(plyr)
tidydata<-ddply(groupeddata,.(subject,activity), numcolwise(mean))
tidydata



