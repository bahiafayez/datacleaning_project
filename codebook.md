##Project Description
[Human Activity Recognition database](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. 


## Study Design
This section covers how the raw data was collected and all the different variables used in this analysis.

### RAW DATA

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

####For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

####The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

####Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


####Feature Selection 
===

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1. tBodyAcc-XYZ
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
4. tBodyGyro-XYZ
5. tBodyGyroJerk-XYZ
6. tBodyAccMag
7. tGravityAccMag
8. tBodyAccJerkMag
9. tBodyGyroMag
10. tBodyGyroJerkMag
11. fBodyAcc-XYZ
12. fBodyAccJerk-XYZ
13. fBodyGyro-XYZ
14. fBodyAccMag
15. fBodyAccJerkMag
16. fBodyGyroMag
17. fBodyGyroJerkMag

#####The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean * frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

##### Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

===
## Creating the Tiny Data

In order to create the tiny data file, please follow these steps.

* Clone this repo
* Set the current working directory to be that of the run_analysis.R
* Run the run_analysis.R file without changing the location of any of the files. The data should be in the folder 'UCI HAR Dataset'
 		
 	![Folder Structure](./folder_structure.png =600x260)
 
 * The tiny_data.txt file is the output file you are looking for.


### The procedure followed to create the Tiny Data

1. The Training and the testing sets were merged to produce one complete data set.
2. Only the measurements on the mean and standard deviation for each measurement were extracted (66 columns). From my understanding of the raw data, and the description of each column, to me the mean and std columns are the ones that had mean() and std() applied to them and nothing else, hence these were the ones that were extracted.
3. The activity column that has numbers 1-6 was mutated to use the descriptive activity names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) instead.
4. The column names that were not named in the raw data set were given more descriptive variable names. (tiny_data_before_summary.txt) 
5. The dataset in step 4 was used to create a second independent tidy data set with the average of each variable for each activity and each subject. (tiny_data.txt)

For more detailed information please check the [README.md file](README.md)

===

##Tiny Data

The output file tiny_data.txt, which is the tiny data after cleaning and processing the input raw data is a file of dimensions 180 observations * 68 variables. The data contains the mean value of 66 of the measured raw data over the activity and subject. The activity is one of six possible activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) that the subjects performed wearing a smartphone (Samsung Galaxy S II) on the waist. And the subject is an identifier of the person who performed the test, and since they are 30 people, then that number is between 1 and 30.

Please note that the output is grouped by both the activity and the subject, and then the mean was taken over all the other mean and std columns. To for all the columns 3-68, the values in the output are the mean across the subject and activity.

####Column names:



1. activity

	This is the activity performed by each subject and it is one of these 6 possible values: 
	
		WALKING 
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING

2. subject          

	The person who performed the test. This is a number from 1 to 30 each identifying a different subject.
	
		1...30
       
3. tBodyAccMeanX  

	  This is the Mean of the body time domain in the X direction signal taken from the accelerometer at a rate of 50 Hz. 
	  The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
        
4. tBodyAccMeanY

	This is the Mean of the body of the time domain in the Y direction signal taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
	
5. tBodyAccMeanZ

	This is the Mean of the body of the time domain in the Z direction signal taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

6. tGravityAccMeanX 

	This is the Mean of the gravity of the time domain in the X direction signal taken from the accelerometer at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
     
7. tGravityAccMeanY         

	This is the Mean of the gravity of the time domain in the Y direction signal taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

8. tGravityAccMeanZ

	This is the Mean of the gravity of the time domain in the Z direction signal taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

9. tBodyAccJerkMeanX    

	This is the Mean of the jerk signals of the body of the time domain in the X direction signal taken from the accelerometer at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
    
10. tBodyAccJerkMeanY  

	This is the Mean of the jerk signals of the body of the time domain in the Y direction signal taken from the accelerometer at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].   
  
11. tBodyAccJerkMeanZ 

	This is the Mean of the jerk signals of the body of the time domain in the X direction signal taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].  
    
12. tBodyGyroMeanX      

	This is the Mean of the body of the time domain in the X direction signal taken from the gyroscope at a rate of 50 Hz.     
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

13. tBodyGyroMeanY  

	This is the Mean of the body of the time domain in the Y direction signal taken from the gyroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
         
14. tBodyGyroMeanZ          

	This is the Mean of the body of the time domain in the Z direction signal taken from the gyroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

15. tBodyGyroJerkMeanX       

	This is the Mean of the jerk of the body of the time domain in the X direction signal taken from the gyroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

16. tBodyGyroJerkMeanY      

	This is the Mean of the jerk of the body of the time domain in the Y direction signal taken from the gyroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

17. tBodyGyroJerkMeanZ       

	This is the Mean of the jerk of the body of the time domain in the Z direction signal taken from the gyroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

18. tBodyAccMagMean         

	This is the Mean of magnitude (using Euclidean norm) of the body of the time domain taken from the accelerometer at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

19. tGravityAccMagMean    
	
	This is the Mean of magnitude (using Euclidean norm) of the gravity of the time domain taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

20. tBodyAccJerkMagMean

	This is the Mean of magnitude (using Euclidean norm) of the jerk of the body of the time domain taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
  
21. tBodyGyroMagMean  

	This is the Mean of magnitude (using Euclidean norm) of the body of the time domain taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
    
22. tBodyGyroJerkMagMean 

	This is the Mean of magnitude (using Euclidean norm) of the jerk of the body of the time domain taken from the gyroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

23. fBodyAccMeanX            

	This is the Mean of the body in the frequency domain (after applying Fourier Transform) in the X direction taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

24. fBodyAccMeanY 

	This is the Mean of the body in the frequency domain (after applying Fourier Transform) in the Y direction taken from the accelerometer at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1]. 
       
25. fBodyAccMeanZ  

	This is the Mean of the body in the frequency domain (after applying Fourier Transform) in the Z direction taken from the accelerometer at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1]. 
       
26. fBodyAccJerkMeanX       

	This is the Mean of jerk of the body in the frequency domain (after applying Fourier Transform) in the X direction taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

27. fBodyAccJerkMeanY

	This is the Mean of jerk of the body in the frequency domain (after applying Fourier Transform) in the Y direction taken from the accelerometer at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
     
28. fBodyAccJerkMeanZ      

	This is the Mean of jerk of the body in the frequency domain (after applying Fourier Transform) in the Z direction taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
 
29. fBodyGyroMeanX         

	This is the Mean of the body in the frequency domain (after applying Fourier Transform) in the X direction taken from the gyroscope at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

30. fBodyGyroMeanY          

	This is the Mean of the body in the frequency domain (after applying Fourier Transform) in the Y direction taken from the gyroscope at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1]. 

31. fBodyGyroMeanZ           

	This is the Mean of the body in the frequency domain (after applying Fourier Transform) in the Z direction taken from the gyroscope at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

32. fBodyAccMagMean         

	This is the Mean of the magnitude (using Euclidean norm) of the body in the frequency domain (after applying Fourier Transform) taken from the accelerometer at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

33. fBodyAccJerkMagMean  

	This is the Mean of the magnitude (using Euclidean norm) of the jerk of the body in the frequency domain (after applying Fourier Transform) taken from the accelerometer at a rate of 50 Hz.	
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

34. fBodyGyroMagMean    

	This is the Mean of the magnitude (using Euclidean norm) of the body in the frequency domain (after applying Fourier Transform) taken from the gyroscope at a rate of 50 Hz.	
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

35. fBodyGyroJerkMagMean 

	This is the Mean of the magnitude (using Euclidean norm) of the jerk of the body in the frequency domain (after applying Fourier Transform) taken from the guroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].    

36. tBodyAccStdX  

	  This is the Standard Deviation of the body time domain in the X direction signal taken from the accelerometer at a rate of 50 Hz. 
	  The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
	  	  
37. tBodyAccStdY

	This is the Standard Deviation of the body of the time domain in the Y direction signal taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
	
38. tBodyAccStdZ

	This is the Standard Deviation of the body of the time domain in the Z direction signal taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

39. tGravityAccStdX 

	This is the Standard Deviation of the gravity of the time domain in the X direction signal taken from the accelerometer at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
     
40. tGravityAccStdY         

	This is the Standard Deviation of the gravity of the time domain in the Y direction signal taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

41. tGravityAccStdZ

	This is the Standard Deviation of the gravity of the time domain in the Z direction signal taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

42. tBodyAccJerkStdX    

	This is the Standard Deviation of the jerk signals of the body of the time domain in the X direction signal taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].  
    
43. tBodyAccJerkStdY  

	This is the Standard Deviation of the jerk signals of the body of the time domain in the Y direction signal taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].    
  
44. tBodyAccJerkStdZ 

	This is the Standard Deviation of the jerk signals of the body of the time domain in the X direction signal taken from the accelerometer at a rate of 50 Hz. 
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].  
    
45. tBodyGyroStdX      

	This is the Standard Deviation of the body of the time domain in the X direction signal taken from the gyroscope at a rate of 50 Hz.     
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

46. tBodyGyroStdY  

	This is the Standard Deviation of the body of the time domain in the Y direction signal taken from the gyroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
         
47. tBodyGyroStdZ          

	This is the Standard Deviation of the body of the time domain in the Z direction signal taken from the gyroscope at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1]. 

48. tBodyGyroJerkStdX       

	This is the Standard Deviation of the jerk of the body of the time domain in the X direction signal taken from the gyroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

49. tBodyGyroJerkStdY      

	This is the Standard Deviation of the jerk of the body of the time domain in the Y direction signal taken from the gyroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

50. tBodyGyroJerkStdZ       

	This is the Standard Deviation of the jerk of the body of the time domain in the Z direction signal taken from the gyroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

51. tBodyAccMagStd         

	This is the Standard Deviation of magnitude (using Euclidean norm) of the body of the time domain taken from the accelerometer at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

52. tGravityAccMagStd    
	
	This is the Standard Deviation of magnitude (using Euclidean norm) of the gravity of the time domain taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

53. tBodyAccJerkMagStd

	This is the Standard Deviation of magnitude (using Euclidean norm) of the jerk of the body of the time domain taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
  
54. tBodyGyroMagStd  

	This is the Standard Deviation of magnitude (using Euclidean norm) of the body of the time domain taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
    
55. tBodyGyroJerkMagStd 

	This is the Standard Deviation of magnitude (using Euclidean norm) of the jerk of the body of the time domain taken from the gyroscope at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

56. fBodyAccStdX            

	This is the Standard Deviation of the body in the frequency domain (after applying Fourier Transform) in the X direction taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

57. fBodyAccStdY 

	This is the Standard Deviation of the body in the frequency domain (after applying Fourier Transform) in the Y direction taken from the accelerometer at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
       
58. fBodyAccStdZ  

	This is the Standard Deviation of the body in the frequency domain (after applying Fourier Transform) in the Z direction taken from the accelerometer at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
       
59. fBodyAccJerkStdX       

	This is the Standard Deviation of jerk of the body in the frequency domain (after applying Fourier Transform) in the X direction taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

60. fBodyAccJerkStdY

	This is the Standard Deviation of jerk of the body in the frequency domain (after applying Fourier Transform) in the Y direction taken from the accelerometer at a rate of 50 Hz.   
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
     
61. fBodyAccJerkStdZ      

	This is the Standard Deviation of jerk of the body in the frequency domain (after applying Fourier Transform) in the Z direction taken from the accelerometer at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
 
62. fBodyGyroStdX         

	This is the Standard Deviation of the body in the frequency domain (after applying Fourier Transform) in the X direction taken from the gyroscope at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

63. fBodyGyroStdY          

	This is the Standard Deviation of the body in the frequency domain (after applying Fourier Transform) in the Y direction taken from the gyroscope at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

64. fBodyGyroStdZ           

	This is the Standard Deviation of the body in the frequency domain (after applying Fourier Transform) in the Z direction taken from the gyroscope at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

65. fBodyAccMagStd         

	This is the Standard Deviation of the magnitude (using Euclidean norm) of the body in the frequency domain (after applying Fourier Transform) taken from the accelerometer at a rate of 50 Hz.  
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

66. fBodyAccJerkMagStd  

	This is the Standard Deviation of the magnitude (using Euclidean norm) of the jerk of the body in the frequency domain (after applying Fourier Transform) taken from the accelerometer at a rate of 50 Hz.	
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

67. fBodyGyroMagStd    

	This is the Standard Deviation of the magnitude (using Euclidean norm) of the body in the frequency domain (after applying Fourier Transform) taken from the gyroscope at a rate of 50 Hz.	
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].

68. fBodyGyroJerkMagStd 

	This is the Standard Deviation of the magnitude (using Euclidean norm) of the jerk of the body in the frequency domain (after applying Fourier Transform) taken from the guroscope at a rate of 50 Hz.
	The units were not explicitly mentioned in the raw data set, but the features were normalized and bounded within [-1,1].
	

