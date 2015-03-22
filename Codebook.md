#Codebook

##Process description
* We "glue" together similar data from the folders of the file we've downloaded and repacked into our working directory
* We search through the giant list of variables for only ones that indicate mean and standard deviation. 
Once searched, they've chosen and named properly in accordance with features.txt file
* We switch the names of activities to the ones we get from activity_labels.txt file
* After we've made a proper naming to columns, we create a new table,
containing average measures for each subject for each type of activity
* Finally, the output in a form of data set with the average of each variable for each activity and each subject is written down into a table names averages_data.txt, which is available in this repo.

##Variables description
* *x_train, y_train, x_test, y_test, subject_train, subject_test* variables contain the data from the downloaded files
* *x_merge, y_merge, subject_merge* stand for data we get merging the data from the listed above variables
* *features* contains list of names for columns, a source of selection for *mean_and_std_features* vector where the data we need go
*  *act* is used to store names of activities
*  *HAR* is the dataset that merges the datasets from the second point of this list
*  *avg_data* is a data set with the average of each variable for each activity and each subject, and we store it in a .txt file, applying colMeans() via ddply() from the plyr package.


