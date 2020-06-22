# Getting and Cleaning Data Course Project
#### Summary
This is a Coursera Getting and Cleaning Data Course Project. Given the raw data collected from the accelerometers from the Samsung Galaxy S smartphone, our goal is to reshape the raw data set into a tidy and well labelled data set. 

#### Modifications
A series of modifications have been done to make the tidy data set. 
- First we checked if the data set exists in the working directory. If not, download the data set using url and unzip the the file.
- Then the two main data sets for train and test groups were combined, and each variable was assgined a proper variable name.
- We only want to extract the measurements on the mean and standard deviation for each measurement. Therefore we selected columns mearing the mean and standard deviation for each measurement. 
- The activity records for both train and test groups were also combined, and each activity was replaced by proper descriptive names. 
- We also combined the subject record from both train and test group
- Then we combined the selected data frame, the activity name and subject records all together
- We also want to get the average of each variable for each activity and each subject, so we splitted the whole data frame by the subject and activity, extract the average for each group, and put all the results in one data frame. 
- Unnecessary symbols in variable names such as () were also removed. 

#### Content
This repo contains:
- A R script "run_analysis" which returns the tidy data set 
- A codebook that describes the variables, the data, and modifications I have done to extract the data we need. 
