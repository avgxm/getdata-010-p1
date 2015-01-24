## run_analysis.R
## 2015-01-22
## getdata-010 - assignment 1
## Create a tidy dataset with the means of variables by an activity, subject.
## Data collected from the accelerometers from the Samsung Galaxy S, see:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Unzip the file into the default "UCI HAR Dataset" directory before running.

basedir <- "~/Documents/Coursera/getdata-010/p1/"
inputdir <- "UCI HAR Dataset/"

setwd(basedir)

#read the input files
f.activity_labels <- read.table(paste0(inputdir, "activity_labels.txt"),
                                header = FALSE,
                                stringsAsFactors = FALSE,
                                col.names = c("Activity.id", "Activity"))
f.features <- read.table(paste0(inputdir, "features.txt"),
                         header = FALSE,
                         stringsAsFactors = FALSE)
f.y_test <- read.table(paste0(inputdir, "test/y_test.txt"),
                       header = FALSE,
                       col.names = "Activity.id")
f.X_test <- read.table(paste0(inputdir, "test/X_test.txt"),
                       header = FALSE,
                       col.names = f.features[,2])
f.subject_test <- read.table(paste0(inputdir, "test/subject_test.txt"),
                             header = FALSE,
                             col.names = "Subject")
f.y_train <- read.table(paste0(inputdir, "train/y_train.txt"),
                        header = FALSE,
                        col.names = "Activity.id")
f.X_train <- read.table(paste0(inputdir, "train/X_train.txt"),
                        header = FALSE,
                        col.names = f.features[,2])
f.subject_train <- read.table(paste0(inputdir, "train/subject_train.txt"),
                              header = FALSE,
                              col.names = "Subject")

#combine the test and train files
test.df <- cbind(f.subject_test, f.X_test, f.y_test)
train.df <- cbind(f.subject_train, f.X_train, f.y_train)
merged.df <- rbind(test.df, train.df)
merged.df <- merge(merged.df, f.activity_labels, by = "Activity.id")

#subset by column names that contain Activity, Subject, .std., .mean.
sub.merged.df <- merged.df[, grep('Activity$|Subject|\\.std.|\\.mean.',
                                  names(merged.df))]

#find averages of variables grouped by an activity, subject
tidy.df <- aggregate(sub.merged.df,
                     by = list(activity = sub.merged.df$Activity,
                               subject = sub.merged.df$Subject),
                     mean)

#drop 2 unneeded columns
tidy.df$Subject <- NULL
tidy.df$Activity <- NULL

#save results to file
write.table(tidy.df, "tidy.txt", row.name = FALSE, sep = "\t")
