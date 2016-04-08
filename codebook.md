# Read files into table
  trainx, trainy, subjecttrain, testx, testy, subjecttest
  
# Created datasets to store x and y 
  datadatax, datay

# Merges the training (subjecttrain) and the test (subjecttest) sets to create one data set using rbind function
  datasubject

# Extracts only the measurements on the mean and standard deviation for each measurement using the grep funtion
  mean_and_std_features, datax

# Uses descriptive activity names to name the activities in the data set using names fucntion
  activities, datay

# Appropriately labels the data set with descriptive variable names using the names function
  datasubject

# bind all the data in a single data set using cbind, renames the column headers to meaningful names
  tidydata 

# From the data set in step 5, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
  tidy.txt
