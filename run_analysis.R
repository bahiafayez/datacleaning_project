library(dplyr)

#Setting up Training Data
names <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
data1 <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
names(data1) <- names[,2]
activity1 <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
data1["activity"] = activity1[,1]
subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
data1["subject"] = subject[,1]

#Setting up Test Data
data2 <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
names(data2) <- names[,2]
activity2 <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
data2["activity"] = activity2[,1]
subject2 <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
data2["subject"] = subject2[,1]


#Concatenating the data
data3 <- rbind(data1, data2)


# Processing the data
cran <- tbl_df(data3)
selected <- select(cran, subject, activity, contains("mean()", ignore.case = TRUE),contains("std()", ignore.case = TRUE))

activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
mutated <- mutate(selected, activity = activities[activity,2])

# adjust column names
names(mutated) <- make.names(names(mutated))
names(mutated) <- gsub("\\.", "", names(mutated))
names(mutated) <- gsub("mean", "Mean", names(mutated))
names(mutated) <- gsub("BodyBody", "Body", names(mutated))
names(mutated) <- gsub("std", "Std", names(mutated))

# Save the file before grouping and summarizing
write.table(mutated, file = "tiny_data_before_summary.txt", row.name=FALSE)


# grouping and summarising the final data.
final <- mutated %>%
group_by(activity, subject) %>%
summarise_each(funs(mean))


# writing the final output after grouping and summarizing.
write.table(final, file = "tiny_data.txt", row.name=FALSE)


output <- read.table("./tiny_data.txt", header = TRUE)
