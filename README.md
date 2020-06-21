First I loaded the 2 main data sets "X_train" and "X_test", and save it as "Xtest" and "Xtrain" and then combine these 2 data frames together as "Xcombine" using rbind() command. 
The name for each variable was extracted from the "features.txt" file using subset command, and the names were saved in the variable "featurenames"
Then we assigned the vector "featurenames" to be the column names for data frame "Xcombine"
We selected columns that contain "mean" or "std" in data frame "Xcombine" and save them into a new data frame called "Xselected"
I then loaded "y_test.txt" and "y_train.txt" files into R and also combined them together and saved as "ycombine"
I used the sub() function to replace the activity 1-6 with descriptive names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), which were saved in the vector "activity"
I loaded "subject_test.txt" and "subject_train.txt" files into R and combine them together as "subjectcombine" and rename the first folumn "subject"
Then we bind the data frame we selected "Xselected", the subject number "subjectcombine", the activity name "activity" all together and form a new data frame called "binded", then we re-arrange the order of the data frame by subject number 1-30. 
Then I splitted this data frame into groups by "subject" and "activity", which we got 180 groups in total. 
Then I used the for loop and apply() function together to extract the column mean for column [3:88] for each splitted group since the the first 2 columns of this data frame contains the subject number and activity name, and saved the results in the new data frame "df"
Once we got the main data for the data frame, we labelled each variable and add the "subject" and "activity" columns back in the data frame using rbind() and separate() function. 
The final data frame is saved in the object "df.final"
