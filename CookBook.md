CodeBook.md
========================================================

This is the CodeBook for the MOOC Getting and Cleaning data assignemnt.

1. Information about the variables (and units) in the data set not contained in the tidy data
2. Info about the summary choice you made
3. Info about the experimental study design used


Data Columns
------------
Column names are based upon the [Hadley Wickham style guide](http://adv-r.had.co.nz/Style.html).


| Stem | Description |
|------|-------------|
| subject_id | A numeric [1-30] variable identifying each subject.|
| activity | The activity being performed in the observation. |
| tbodyacc | The acceleration signal from the smartphone accelerometer axis in standard gravity units 'g'. |
| tgravityacct | The body acceleration signal obtained by subtracting the gravity from the total acceleration. |
| bodgyro | The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. |

Summary Choices
---------------
The assignment requests that only measurements involving mean or standard deviation are retained. 
For this work, this is interpreted to involve only those columns with the format of mean() or std(). This excludes measurements such as `fbodybodygyrojerkmag-meanfreq()`. These can be included via a simple modification to the grep pattern in `run_analysis.R`.


Experimental Study Design
-------------------------
Not relevant in this assignment.
