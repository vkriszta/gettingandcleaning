----------------------------------------------------------------------------------------------------------------------------------
Data and variables
----------------------------------------------------------------------------------------------------------------------------------

Xtrain		stores data from X_train.txt (data.frame, 7352 x 561)
Xtest   	stores data from X_test.txt (data.frame, 2947 x 561)

subjecttrain  	stores data from subject_train.txt (data.frame, 7352 x 1)
subjecttest   	stores data from subject_test.txt (data.frame, 2947 x 1)

Ytrain		stores data from Y_train.txt (data.frame, 7532 x 1)
Ytest   	stores data from Y_test.txt (data.frame, 2947 x 1)

train  		stores data bounded by columns of Xtrain, subjecttrain, Ytrain (data.frame, 7352 x 563)
test		stores data bounded by columns of Xest, subjecttest, Ytest (data.frame, 2947 x 563)

alldata		stores data bounded by rows of train and test (data.frame, 10299 x 563)

features	stores data from features.txt (data.frame561 x 2)

featuresmean	stores the index of features which contain "mean()" (int [1:33])
featuresstd	stores the index of features which contain "std()" (int [1:33])
featuresfilter	stores the index of features which contain "mean()" or "std" (int [1:66])

dataextract 	data.frame extracted from alldata according to steps 2,3,4 of Course project description

groupeddata	data.frame containing the grouped data from dataextract (data.frame, 10299 x 68)

tidydata	stores the cleaned data (data.frame, 180 x 68)

-----------------------------------------------------------------------------------------------------------------------

The workflow of my run_analysis.R
-----------------------------------------------------------------------------------------------------------------------

1. reading txt files into the appropriate data.frame 
	Xtrain, Xtest, subjecttrain, subjecttest, Ytrain, Ytest, features

2. merging train subtables and merging test subtables:
	cbind of Xtrain,subjecttrain,Ytrain
	cbind of Xtest,subjecttest,Ytest

3. merging train and test tables to alldata by rbind

4. naming the columns (1:561) of alldata on the basis of features, and 562nd column: 'subject', 563th column: 'activity' 

5. grep "mean()", "std" from features, sort the result featuresfilter vector

6. apply the featuresfilter on alldata and move the two last colunms to the 1st and 2nd place.

7. assign activity labels to a new column (69th, act) on the basis of activity_labels.txt

8. add the values of the 69th column to the 2nd column (activity) and delete column act (69).

9. read in dplyr library in order to run group_by function

10. group_by subject and activity according to step 5 of Course project description

11. read in plyr library in order to run ddply

12. use ddply and numcolwise functions in order to clean data according to step 5 of Course project description


	