# read features.txt to appropriately name dataset columns
features <- read.csv("../UCI HAR Dataset/features.txt", header=F, sep=" ")

# TODO: read training and testing values as numeric

# Read training set and add subject and test label columns
training <- read.table("../UCI HAR Dataset/train/X_train.txt", 
                       header=F, 
                       stringsAsFactors=FALSE, 
                       colClasses=c(rep("numeric",561)),
                       col.names=features[,2])

# Read test set and add subject and test label columns
test <- read.csv("../UCI HAR Dataset/test/X_test.txt", 
                 header=F, 
                 stringsAsFactors=FALSE, 
                 sep="",
                 colClasses=c(rep("numeric",561)),
                 col.names=features[,2])

# Merge the training and the test sets to create one data set
df <- rbind(training, test)

# Extract only the measurements on the mean and standard deviation for each measurement 
std_mean_columns <- grep('std\\(|mean\\(', features[,2])
df <- df[, std_mean_columns]

# read label and subject data and add it as new columns to the dataset
test_y <- read.csv("../UCI HAR Dataset/test/y_test.txt", header=F, col.names=c("Activity"))
test_subject <- read.csv("../UCI HAR Dataset/test/subject_test.txt", header=F, col.names=c("Subject"))
training_y <- read.table("../UCI HAR Dataset/train/y_train.txt", header=F, col.names=c("Activity"))
training_subject <- read.table("../UCI HAR Dataset/train/subject_train.txt", header=F, col.names=c("Subject"))
df <- cbind(df, rbind(training_y, test_y))
df <- cbind(df, rbind(training_subject, test_subject))

# read activity_labels.txt 
activity_labels <- read.csv("../UCI HAR Dataset/activity_labels.txt", header=F, sep=" ")

# Replace ids with descriptive activity names to name the activities in the data set
map <- setNames(activity_labels[,2], activity_labels[,1])
df$Activity <- map[unlist(df$Activity)]

# Appropriately label the data set with descriptive variable names 
colnames(df) <- c(as.vector(features[std_mean_columns, 2]), "Activity", "Subject")

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy <- aggregate(x = df, by = list(df$Activity, df$Subject), FUN = "mean")
tidy <- tidy[,1:68]
colnames(tidy)[1:2] <- c("Activity", "Subject")
write.csv(tidy, "tidy.csv") 
