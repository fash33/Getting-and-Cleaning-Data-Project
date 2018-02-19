# Getting and Cleaning Data Course Project
***

This is the repo for the Peer-graded Assignment: Getting and Cleaning Data Course Project.The following files are included in this repo: 

- `'README.md'`: Description of the contents of the repo.Explains the workflow of the `run_analysis.R` Script.    

- `'codebook.md'`: Modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

-  `'tidy.txt'` : An  independent tidy data set with the average of each variable for each activity and each subject.

- `'run_analysis.R'` : An R script does the following: 

  1. Loads the required libraries.  
  2. Checks if file exists, if not download the file and extract it.
  3. Sets the directory.
  4. Extracts only the measurements on the mean and standard deviation   for each measurement.
  5. Loads the activity labels.
  6. Merges the train and test data to create one data set.
  7. Create an independent tidy data set `tidy.txt` with the average of each variable for each activity and subject.

## Running the Script
***
Clone the repo using 

```
git clone https://github.com/fash33/Getting-and-Cleaning-Data-Project.git
```

The script downloads the data from    
   
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   
   
The working directory is automatically set by the script to `UCI HAR Dataset`. The next step is to the run the script from the console using
```
source("run_analysis.R")
```