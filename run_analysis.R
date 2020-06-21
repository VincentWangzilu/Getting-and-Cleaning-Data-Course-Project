library(dplyr)
Xtest <- read.table(file = "X_test.txt", header = FALSE, sep = "", nrows = 2947)
Xtrain <- read.table(file = "X_train.txt", header = FALSE, sep = "", ncol(561))
feature <- read.table(file = "features.txt", header = FALSE, sep = "")
featurenames <- feature$V2
Xcombine <- rbind(Xtest, Xtrain)
names(Xcombine) <- featurenames
Xselected <- select(Xcombine, contains(c("mean", "std")))
## label each variabel with feature names
ytest <- read.table(file = "y_test.txt", header = FALSE, sep = "")
ytrain <- read.table(file = "y_train.txt", header = FALSE, sep = "")
binded <- rbind(ytest, ytrain)
activity <- sub("1", "WALKING", binded$V1)
activity <- sub("2", "WALKING_UPSTAIRS", activity)
activity <- sub("3", "WALKING_DOWNSTAIRS", activity)
activity <- sub("4", "SITTING", activity)
activity <- sub("5", "STANDING", activity)
activity <- sub("6", "LAYING", activity)
## replace number 1-6 wtih descriptive activity names
subject <- read.table(file = "subject_test.txt", header = FALSE, sep = "")
subject2 <- read.table(file = "subject_train.txt", header = FALSE, sep = "")
subject3 <- rbind(subject,subject2)
names(subject3)[1] <- "subject"
binded <- cbind(subject3, activity, Xselected)
set <- arrange(binded, subject)
## bind all df together
splitted <- split(set, list(set$subject, set$activity))
df <- data.frame()
for(i in 1:180) {
        a2 <- apply(splitted[[i]][3:88], 2, mean)
        df <- rbind(df, a2)
}
colnames(df) <- names(Xselected)
names <- names(splitted)
df <- cbind(names, df)
library(tidyr)
df <- separate(data = df, col = names, into = c("subject", "activity"), sep = "\\.")
View(df)