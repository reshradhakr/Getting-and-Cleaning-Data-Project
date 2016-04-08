# Read files into table
trainx 
trainy 
subjecttrain
testx <- read.table("C:/Reshma/Personal/Rcode/UCI HAR Dataset/test/X_test.txt")
testy <- read.table("C:/Reshma/Personal/Rcode/UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("C:/Reshma/Personal/Rcode/UCI HAR Dataset/test/subject_test.txt")
datax
datay
# Merges the training and the test sets to create one data set.
datasubject <- rbind(subjecttrain, subjecttest)

# Extracts only the measurements on the mean and standard deviation for each measurement.

mean_and_std_features 
datax

# Uses descriptive activity names to name the activities in the data set

activities
datay

# Appropriately labels the data set with descriptive variable names.

datasubject

# bind all the data in a single data set

tidydata 

# From the data set in step 5, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.

tidydata <- ddply(tidydata, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidydata, "tidy.txt", row.name=FALSE)
Write(codebook(tidydata),file="codebook.md")
