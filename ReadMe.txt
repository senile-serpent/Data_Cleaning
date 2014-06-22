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



The TIDY dataset

Now this is a very valuable pursuit into the world of melting data frames and recasting and the like.

As a total R newbie I find this rather bewildering.

As a matter of fact there seems to be such a heavy preponderance on the teaching of tools and techniques 
that the motivation for using the tools and techniques are sadly lacking.

The course seems to be all about: Check out this nifty R feature, now see if you can go find an application for it.

Ok enough ranting

I took the output that I got from Question 3, all 81 columns and 10299 rows and used melt to get a long, thin dataset
with 813621 rows and only 4 columns.

Why did I end up wit 81 rows to start with??

After using grep to find all the *mean* and *mad* columns that is what I got.

Is my thin, long, data set a tidy dataset?

I doubt it as I do not have the time to inspect all 813621 rows.

Plotting the data would have been far more informative,

From the graphs you could identify anomalies and then pay attention to that. Viva Claude Shannon!!



The humour

There is an awkwardly funny twist to all of this.

From the many hundreds of lines of R code I used to obtain poor results it should be very evident that 
I am currently in no ways capable of evaluating another person's projects, but I may one day get proficient at using R

So we could very well be in the situation of the blind leading the blind and both ending up in a ditch.

This is a new way of learning!

So where is the TIDY dataset???

Why cast did not work??

> subjectmeans <- cast(moltenframe, moltenframe[1], mean)
Error: Casting formula contains variables not found in molten data: c(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
> activitymeans <- cast(moltenframe, moltenframe[2], mean)
Error: Casting formula contains variables not found in molten data: c(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
> activitymeans <- cast(moltenframe, ActivityID", mean)
+ 
> activitymeans <- cast(moltenframe, "ActivityID", mean)
Error in vars[[2]] : subscript out of bounds

As an aside

Have you recently tried to upload multiple megabit files across an 18kb/s link.

Makes watching paint dry a positively breathtaking experience!

Git upload has again failed!!