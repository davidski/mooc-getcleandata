# assume there is a data directory relative to the cwd where the UCI dataset has been extracted
currentDir <- getwd()
setwd('./data/UCI HAR Dataset')

# require the plyr library for colwise means
if (!require(plyr)) {
  stop('The plyr package is required.')
}

# retrieve the names of our features
featureNames <- read.csv('features.txt', sep = '', stringsAsFactors = F, header = F)

# clean up the names to tidy standards
featureNames <- featureNames[,2]
# lowercase
featureNames <- tolower(featureNames)
# replace awkward/bad characters
# this could be replaced with a more efficient gsub, but is left seperate to clearly 
# distinguish what is being performed
featureNames <- gsub("\\-", "_", featureNames)
featureNames <- gsub("\\-", "_", featureNames)
featureNames <- gsub("\\(", "", featureNames)
featureNames <- gsub("\\)", "", featureNames)

###
# Merge the training and the test sets to create one data set.
###

# read in the training data
trainSubjects <- read.csv('./train/subject_train.txt', header = F)
names(trainSubjects) <- c('subject_id')

trainData <- read.csv('train/X_train.txt', sep = '', header = F, stringsAsFactors = F)
names(trainData) <- featureNames
trainData <- cbind(trainSubjects, trainData)

# read in the test data
testSubjects <- read.csv('./test/subject_test.txt', header = F)
names(testSubjects) <- c('subject_id')

testData <- read.csv('test/X_test.txt', sep = '', header = F, stringsAsFactors = F)
names(testData) <- featureNames
testData <- cbind(testSubjects, testData)

# we only wish to keep the variables that relate to a mean or std. deviation
# variables are identical in test & train data so varsToKeep can be derived only once
# we also explictly keep the subject ID
varsToKeep <- grepl(names(testData), pattern = "(_([Mm]ean|std)$)|(_([Mm]ean|std)[^a-zA-Z])|subject_id")

trainData <- subset(trainData, select = varsToKeep)
testData <- subset(testData, select = varsToKeep)

#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive activity names. 

activityLabels <- read.csv('activity_labels.txt', sep = '', header = F, stringsAsFactors = F)
names(activityLabels) <- c('activityID', 'activityName')

activity <- read.csv('train/y_train.txt', header = F, sep = '', stringsAsFactors = F)
activity <- factor(x = activity$V1, labels = activityLabels$activityName)

trainData <- cbind(trainData, activity)

activity <- read.csv('test/y_test.txt', header = F, sep = '', stringsAsFactors = F)
activity <- factor(x = activity$V1, labels = activityLabels$activityName)

testData <- cbind(testData, activity)

mergedData <- rbind(trainData, testData)

# output the data set
setwd('../../output')
write.csv(mergedData, "mergedData.txt", row.names = F)

###
#Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
###

# This would be faster with dplyr but the dev version which has 
# summarise_each doesn't install cleanly on Windows as of 4/27/14

#mergedData %.% group_by('subjectID', 'activityKey') %.% summarise_each(funs(mean()))
summaryStats <- ddply(mergedData, .(subject_id, activity), numcolwise(mean))

# output the data set
write.csv(summaryStats, "summarisedStats.txt", row.names = F)

#reset cwd to previous value
setwd(currentDir)
