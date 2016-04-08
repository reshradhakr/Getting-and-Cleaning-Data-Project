library(plyr)
# 1) Downloading the dataset we need to work on.
trainx <- read.table("C:/Reshma/Personal/Rcode/UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("C:/Reshma/Personal/Rcode/UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("C:/Reshma/Personal/Rcode/UCI HAR Dataset/train/subject_train.txt")

testx <- read.table("C:/Reshma/Personal/Rcode/UCI HAR Dataset/test/X_test.txt")
testy <- read.table("C:/Reshma/Personal/Rcode/UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("C:/Reshma/Personal/Rcode/UCI HAR Dataset/test/subject_test.txt")

# create 'x' data set
datax <- rbind(trainx, x_test)

# create 'y' data set
datay <- rbind(trainy, y_test)

# 2) Merges the training and the test sets to create one data set.

datasubject <- rbind(subjecttrain, subjecttest)

# 3) Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("C:/Reshma/Personal/Rcode/UCI HAR Dataset/features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
datax <- datax[, mean_and_std_features]

# correct the column names
names(datax) <- features[mean_and_std_features, 2]

#4) Uses descriptive activity names to name the activities in the data set

activities <- read.table("C:/Reshma/Personal/Rcode/UCI HAR Dataset/activity_labels.txt")

# update values with correct activity names
datay[, 1] <- activities[datay[, 1], 2]

# correct column name
names(datay) <- "activity"

# 5) Appropriately labels the data set with descriptive variable names.

# correct column name
names(datasubject) <- "subject"

# bind all the data in a single data set
tidydata <- cbind(datax, datay, datasubject)

# 6) From the data set in step 5, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
names(tidydata)<-gsub("^t", "time", names(tidydata))
names(tidydata)<-gsub("^f", "frequency", names(tidydata))
names(tidydata)<-gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata)<-gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata)<-gsub("Mag", "Magnitude", names(tidydata))
names(tidydata)<-gsub("BodyBody", "Body", names(tidydata))

tidydata <- ddply(tidydata, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidydata, "tidy.txt", row.name=FALSE)
Write(codebook(tidydata),file="codebook.md")
