CodeBook.md
========================================================

This is the CodeBook for the MOOC Getting and Cleaning data assignemnt.

1. Information about the variables (and units) in the data set not contained in the tidy data
2. Info about the summary choice you made
3. Info about the experimental study design used


Data Columns
------------

Summary Choices
---------------
The assignment requests that only measurements involving mean or standard deviation are retained. 
For this work, this is interpreted to involve only those columns with the format of mean() or std().  
This excludes measurements such as `fbodybodygyrojerkmag-meanfreq()`. These can be included via a 
simple modification to the grep pattern in `run_analysis.R`.


Experimental Study Design
-------------------------
Not relevant in this assignment.
