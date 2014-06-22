## This entire effort is a good demonstration in the use of brute force and ignorance.
## This code is neither pretty, nor efficient, and perhaps only marginally functional.
## Maybe one day I will be able to do the assignment in less than five lines of code, like a real R wizard.
## But that is far into the future.
##
## Copy this code to the Test directory that contains the files:
#X_train.txt
#y_train.txt
#X_test.txt
#y_test.txt
#subject_test.txt
#subject_train.txt

#Then run the code to get the output files:
#consolidated_data_set.csv  => the consolidated data set
#mean_median_values.csv   => the mean and medin values with lables
#mean_medain_data_activity_lables.csv  => labled dat set of mean and meadian values
#
#Calculaitng the mean values ? Huh? For what? The consolidated data set, or each data set, or only for the...?
#In any case, here is the lot!
#
#mean_values_of_all_activities.csv => mean value of activities across the consolidated data set
#mean_values_of_test_activities.csv => mean value of activities for the test data
#mean_values_of_training_activities.csv => mean value of activities for the training data
#mean_values_of_all_subjects.csv => mean value of subjects across the consolidated data set
#mean_values_of_test_subjects.csv => mean value of subjects for the test data
#mean_values_of_training_subjects.csv => mean value of subjects for the training data


#############################################################################################
# Set up the Test data
  
testdata <- read.table("test/X_test.txt", sep = "") # Test set.
testactivity <- read.table("test/y_test.txt", sep = "") # Test labels.
testsubject <- read.table("test/subject_test.txt", sep = "") # Each row identifies the subject who performed the activity for each window sample
Setid <- rep.int(1, nrow(testdata)) # Build an index column to be able to easily sort the test dataset to the original state
alltestdata <- cbind(testdata, testsubject, testactivity, Setid ) # Consolidate the Test data

colnames(alltestdata)[ncol(testdata)+1] <- "SubjectID"  # Set the column name of the Subject column
colnames(alltestdata)[ncol(testdata)+2] <- "ActivityID" # Set the column name of the Activity column 

# Set up the Training data

traindata <- read.table("train/X_train.txt", sep = "") # Training set.
trainactivity <- read.table("train/y_train.txt", sep = "") # Training labels.
trainsubject <- read.table("train/subject_train.txt", sep = "") # Each row identifies the subject who performed the activity for each window sample
Setid <- rep.int(2, nrow(traindata)) # Build an index column to be able to easily sort the  training dataset to the original state
alltraindata <- cbind(traindata, trainsubject, trainactivity, Setid) # Consolidate the Training data

colnames(alltraindata)[ncol(testdata)+1] <- "SubjectID"  # Set the column name of the Subject column
colnames(alltraindata)[ncol(testdata)+2] <- "ActivityID" # Set the column name of the Activity column 


alldata <- rbind(alltestdata, alltraindata) # Consolidate all of the data

Alldataid <- seq(1, nrow(alldata)) #  # Build an index column to be able to easily sort the consolidated dataset to the original state

alldata <- cbind(alldata, Alldataid) # Add an index column to the consolidated dataset that will allow for easy ordering

#colnames(alldata)

allactivityorder <- alldata[order(alldata$Activity), ]
allsubjectorder <- alldata[order(alldata$Subject) , ]




activitylables <- read.table("activity_labels.txt", sep = "") # Get the activity lables
colnames(activitylables)[1] <- "Actref"
colnames(activitylables)[2] <- "Actdescr"

# testactivitylable <- testactivity()

answer1 <- alldata[ , seq(1, 563)]

write.csv(answer1, file = "consolidated_data_set.csv")

##############################################################################################################
#2 Extracts only the measurements on the mean and standard deviation for each measurement. 


features <- read.table("features.txt", sep = "") # Get the features data

means <- features[grep("mean", features$V2),] # Mean values. Being too dunmb to figure out grep I did it the long way
medians <- features[grep("mad", features$V2),] # Median values. Being too dunmb to figure out grep I did it the long way

meanandmedian <- rbind(means, medians) # Then I stuck the dataframes together

meanmedian <- meanandmedian[order(meanandmedian$V1) , ] # Then I sorted the mean and median values


selector <- meanmedian[,1]

selector <- c(selector, 562:565)

meanmadsub <- alldata[ , selector]

subdata <- meanmadsub

nofactdf <- meanmedian

nofactdf[2] <- lapply(nofactdf[2], as.character)

for (i in 1:(ncol(subdata)-4)) {
  
  colnames(subdata)[i] <- nofactdf[i, 2]
  
  
}

write.csv(subdata[ 1:79], file = "mean_median_values.csv")




###############################################################


mydatafr <- subdata

Activities <- vector()


actlable <- activitylables
actlable[2] <- lapply(actlable[2], as.character)


for (i in 1:nrow(mydatafr)) {
  colref <- which( colnames(mydatafr)=="ActivityID" )
  rowref <- mydatafr[i, colref]
  Activities <- c(Activities, actlable[rowref, 2])
    
}
mydatafr <- cbind(mydatafr, Activities)

myoutsorted <- mydatafr[order(mydatafr[81], decreasing = TRUE),]

myoutputdf <- myoutsorted[ , c(84, 1:79)]

write.csv(myoutputdf, file = "mean_medain_data_activity_lables.csv")

#######################################################




# Mean valuews are calculated across three data sets, the combined dataset, the Training dataset and 
# the Test dataset, for each of the requirements of the Subjects and the Activities

# Col 80 => SubjectID
# Col 81 => ActivityID
# Col82 => Setid



alldatafr <- mydatafr  # The data frame with the Test and Train sets

traindf <- subset(mydatafr, mydatafr[82] == 2 ) # The data frame with only the  Train dataset

testdf <- subset(mydatafr, mydatafr[82] == 1 ) # The data frame with only the  Test dataset


allactivitydf <- mydatafr[order(mydatafr[81])]
allsubjectdf <-mydatafr[order(mydatafr[80])]



mysubjectdf <- mydatafr[order(mydatafr[82],mydatafr[80],mydatafr[81]) , ]


myactivitydf <- mydatafr[order(mydatafr[82], mydatafr[81], mydatafr[80]) , ]


######################################################################################
# For the whole dataset
# Calculate the means for the Activities

myactivitydf <- mydatafr[order( mydatafr[81], mydatafr[80]) , ]

trsetmean <- data.frame()


  
  for (j in 1:6) {
    
    calcdata <- myactivitydf[with(myactivitydf, myactivitydf[81] == j ), ]
    
    colmeans <- vector()
    
    for (i in 1:79){
      colmeans <- c(colmeans, mean(calcdata[, i]))
    }
    colmeans <- c(colmeans,  j )
    trsetmean <- rbind(trsetmean, colmeans)
  }
  


trsetmean <- replace( trsetmean, is.na(trsetmean), 0)

for (i in 1:79) {
  
  colnames(trsetmean)[i] <- nofactdf[i, 2]
  
}
colnames(trsetmean)[80] <- "Activity_ID"

####################################################################################
# Write Activity data to file

testactvityout <- trsetmean[ , c(80, 1:79)]

write.csv(testactvityout, file = "mean_values_of_all_activities.csv")


######################################################################################
# For the Test and Train subsets
# Calculate the means for the Activities

myactivitydf <- mydatafr[order(mydatafr[82], mydatafr[81], mydatafr[80]) , ]

trsetmean <- data.frame()

for ( k in 1:2){

  for (j in 1:6) {
  
    calcdata <- myactivitydf[with(myactivitydf, myactivitydf[81] == j & myactivitydf[82] == k), ]
  
    colmeans <- vector()
  
    for (i in 1:79){
      colmeans <- c(colmeans, mean(calcdata[, i]))
    }
    colmeans <- c(colmeans,  j , k)
    trsetmean <- rbind(trsetmean, colmeans)
  }

}  

trsetmean <- replace( trsetmean, is.na(trsetmean), 0)

for (i in 1:79) {
  
  colnames(trsetmean)[i] <- nofactdf[i, 2]
    
}
colnames(trsetmean)[80] <- "Activity_ID"

###################################################################

# Write Activity data to file

testactivity <- trsetmean[(trsetmean[81] == 1), ]
testactvityout <- testactivity[ , c(80, 1:79)]

write.csv(testactvityout, file = "mean_values_of_test_activities.csv")

trainactivity<- trsetmean[(trsetmean[81] == 2), ]
trainactivityout <- trainactivity[ , c(80, 1:79)]

write.csv(trainactivityout, file = "mean_values_of_training_activities.csv")


######################################################################
  
# Calculate the means for all of the Subjects

mysubjectdf <- mydatafr[order( mydatafr[80], mydatafr[81]) , ]

subjsetmean <- data.frame()

  
  for (j in 1:30) {
    
    calcdata <- mysubjectdf[with(mysubjectdf, mysubjectdf[80] == j ), ]
    
    colmeans <- vector()
    
    for (i in 1:79){
      colmeans <- c(colmeans, mean(calcdata[, i]))
    }
    colmeans <- c(colmeans, j)
    subjsetmean <- rbind(subjsetmean, colmeans)
  }
  
  



subjsetmean <- replace( subjsetmean, is.na(subjsetmean), 0)

# Add column names

for (i in 1:79) {
  
  colnames(subjsetmean)[i] <- nofactdf[i, 2]
  
}
colnames(subjsetmean)[80] <- "Subject_ID"

###################################################################

# Write Subject data to file

testsubj <- subjsetmean[(subjsetmean[81] == 1), ]
testsubjout <- testsubj[ , c(80, 1:79)]

write.csv(testsubjout, file = "mean_values_of_all_subjects.csv")



###################################################################################















mysubjectdf <- mydatafr[order(mydatafr[82], mydatafr[80], mydatafr[81]) , ]

subjsetmean <- data.frame()

for ( k in 1:2){
  
  for (j in 1:30) {
    
    calcdata <- mysubjectdf[with(mysubjectdf, mysubjectdf[80] == j & mysubjectdf[82] == k), ]
    
    colmeans <- vector()
    
    for (i in 1:79){
      colmeans <- c(colmeans, mean(calcdata[, i]))
    }
    colmeans <- c(colmeans, j, k)
    subjsetmean <- rbind(subjsetmean, colmeans)
  }
  
}  

# x <- replace(x, is.na(x), 0)

subjsetmean <- replace( subjsetmean, is.na(subjsetmean), 0)

# Add column names

for (i in 1:79) {
  
  colnames(subjsetmean)[i] <- nofactdf[i, 2]
  
}
colnames(subjsetmean)[80] <- "Subject_ID"

###################################################################

# Write Subject data to file

testsubj <- subjsetmean[(subjsetmean[81] == 1), ]
testsubjout <- testsubj[ , c(80, 1:79)]

write.csv(testsubjout, file = "mean_values_of_test_subjects.csv")

trainsubj<- subjsetmean[(subjsetmean[81] == 2), ]
trainsubjout <- trainsubj[ , c(80, 1:79)]

write.csv(trainsubjout, file = "mean_values_of_training_subjects.csv")






########################################################
##### Mean values 






