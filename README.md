Getting and Cleaning Data
=========================

Introduction
------------
This repository is my course project assignment for the April 2014 session of 
Coursera's Getting and Cleaning Data course.

Contents
--------
+ CookBook.Md
+ run_analysis.R

Assumptions
-----------
In the user's current working directory:
+ The Samsung data is downloaded and extracted into a data subdirectory.
+ A subdirectory called `output` exists in the current working directory.

Apart from standard R, the `plyr` package is required. 
This has been tested under R 3.1.0 on Windows 7 64-bit.

Instructions
------------
Run `run_analysis.R` to create:
+ `mergedData.txt` - the merged test and training data sets, as specified
+ `summarisedStats.txt` - the summarised data, as requested
