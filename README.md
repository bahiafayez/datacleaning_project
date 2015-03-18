##How to run the script

* Clone the repository
* Set the working directory to be where the run_analysis.R script is, and the data folder (UCI HAR Dataset) should be in the root as well, run the run_analysis.R file `source("run_analysis.R")`
* There are 2 output files generated
 	1. tiny_data_before_summary.txt which is the output file from step 4 below.
 	2. tiny_data.txt which is the final output from step 5 below.

##How The data was processed

<br>
Please find below the step by step process followed in order to tidy up the data

####1. The Training and the testing sets were merged to produce one complete data set.

The training data found in train/X_train.txt which covers 70% of the dataset was merged with the test data found in test/X_test.txt which covers the remaining 30%.

First each data set was loaded into R, as well as the features.txt file that has all the column names, and the column names of the data were set. 

	#TRAINING
	
	#loading the training dataset
	data1 <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
	#loading the column names
	names <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
	#setting the column names
	names(data1) <- names[,2]
	
	#TESTING
	
	data2 <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
	names(data2) <- names[,2]

	
Then two extra columns were added to both the training and test data. First is the activity column that tells us what each subject was doing per observation. The second is an ID identifying the subject that was doing the activity.
	
	#TRAINING 
	
	#loading the activity training data
	activity1 <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
	#concatenating the activity as an extra column (since it has the same number of rows)
	data1["activity"] = activity1[,1]
	#Loading the subject training data
	subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
	#concatenating the subject as an extra column (since it has the same number of rows)
	data1["subject"] = subject[,1]
	
	#TESTING
	
	activity2 <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
	data2["activity"] = activity2[,1]
	subject2 <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
	data2["subject"] = subject2[,1]
	

The inertial data was not merged in, since the requirements only asked for the mean and the std data at the end, and the inertial data has neither. Hence instead of merging them then filtering them out again. I decided not to add them from the beginning.

From the dimension of both data sets, (561 columns), you could tell that they should be merged by concatenating the rows.
Now that was have complete test and training data, we can merge them by binding the rows:


	#Concatenating the data
	data3 <- rbind(data1, data2)
	

####2. Selects Required Columns

Only the measurements on the mean and standard deviation for each measurement were extracted (66 columns). From my understanding of the raw data, and the description of each column, to me the mean and std columns are the ones that had mean() and std() applied to them and nothing else, hence these were the ones that were extracted. (33 each , together 66, adding 2 columns for activity and subject = 68)

	# Processing the data
	cran <- tbl_df(data3)
	selected <- select(cran, subject, activity, contains("mean()", ignore.case = TRUE),contains("std()", ignore.case = TRUE))


As shown above, the data is first converted to a data frame tbl for better visualization and processing. Then the required fields are selected from the complete dataset. 


####3. Uses descriptive activity names to name the activities in the data set

The activity column that has numbers 1-6 was mutated to use the descriptive activity names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) instead. These names were in another file in the raw data, so they needed to be loaded then substituted in the data.
The first column in the activity labels has the keys (1-6), and the second column has the descriptive title, hence as shown below, by selecting `activities[activity, 2]` we'll get the correct name.

	activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
	mutated <- mutate(selected, activity = activities[activity,2])


####4. Appropriately labels the data set with descriptive variable names. 

The column names that were not named in the raw data set were given more descriptive variable names. The column names in the raw data are already pretty descriptive, so they were just cleaned up a bit.

	# adjust column names
	names(mutated) <- make.names(names(mutated))
	names(mutated) <- gsub("\\.", "", names(mutated))
	names(mutated) <- gsub("mean", "Mean", names(mutated))
	names(mutated) <- gsub("BodyBody", "Body", names(mutated))
	names(mutated) <- gsub("std", "Std", names(mutated))

	# Save the file before grouping and summarizing
	write.table(mutated, file = "tiny_data_before_summary.txt", row.name=FALSE)


First, the column names are passed to the make.names() function that removes all brackets and adds dots instead. Then we remove the dots as well. There were a few columns where the Body keyword was repeated, so the repetition was removed. And finally to maintain the camel case format, both std and mean were changed to be camel case as well.

This output was saved to a file (tiny_data_before_summary.txt) which has the Tiny data before summarization.

####5. Create a tidy data set with the average of each variable for each activity and each subject.

The dataset in step 4 was used to create a second independent tidy data set with the average of each variable for each activity and each subject, and that was saved to a file (tiny_data.txt)

	# grouping and summarising the final data.
	final <- mutated %>%
	group_by(activity, subject) %>%
	summarise_each(funs(mean))

	# writing the final output after grouping and summarizing.
	write.table(final, file = "tiny_data.txt", row.name=FALSE)


So the first step is to group by first the activity then the subject. There were no explicit indications of which column to group by first. I felt that the activity was the more important aspect in this test, so I grouped by activity first. Then the data is summarized by calculating the mean on the remaining columns.

As per the paper on [Tidy data by Hadley Wickham of RStudio](http://vita.had.co.nz/papers/tidy-data.pdf), the output data is tidy data because the three most important features of Tidy Data are present:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

