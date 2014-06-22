This entire effort is a good demonstration in the use of brute force and ignorance.
This code is neither pretty, nor efficient, and perhaps only marginally functional.
Maybe one day I will be able to do the assignment in less than five lines of code, like a real R wizard.
But that is far into the future.

Copy this code to a test directory that contains the files:
X_train.txt
y_train.txt
X_test.txt
y_test.txt
subject_test.txt
subject_train.txt
The hard coded, ugh!, file path requires this structure: test/X_test.csv

Then run the code to get the output files:
consolidated_data_set.csv  => the consolidated data set
mean_median_values.csv   => the mean and medin values with lables
mean_medain_data_activity_lables.csv  => labled dat set of mean and meadian values

Calculating the mean values ? Huh? For what? The consolidated data set, or each data set, or only for the...?
In any case, here is the lot!

mean_values_of_all_activities.csv => mean value of activities across the consolidated data set
mean_values_of_test_activities.csv => mean value of activities for the test data
mean_values_of_training_activities.csv => mean value of activities for the training data
mean_values_of_all_subjects.csv => mean value of subjects across the consolidated data set
mean_values_of_test_subjects.csv => mean value of subjects for the test data
mean_values_of_training_subjects.csv => mean value of subjects for the training data