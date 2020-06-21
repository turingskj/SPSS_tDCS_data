library(foreign)
library(stringr)

# adding text example for git 
# new edit
# finding a path of a file
datafileinput <- "data/tDCS_visualsearch_exp1.sav"
mydata <- read.spss(datafileinput, to.data.frame = TRUE, 
                    use.value.labels=TRUE, max.value.labels=12, reencode=FALSE)

mydata2 <- subset(mydata, select = -c(filter_., OriginalID))
mydata3 <- subset(mydata, select = c(Stimulation))
mydata4 <- subset(mydata, select = "Stimulation")
mydata5 <- mydata[c("RT", "Stimulation")]



### read spss file and start the analysis

tDCS1_df <- read.spss(datafileinput, to.data.frame = TRUE, 
                    use.value.labels=TRUE, max.value.labels=12, reencode=FALSE)


#tDCS1_df <- tDCS1_df[-c(1, 8)]
tDCS1_df <- subset(tDCS1_df, select = -c(8))
tDCS1_df$Target <-factor(tDCS1_df$Target, levels = c(1, 2), labels = c("Absent", "Present"))
tDCS1_df$pre_post <-factor(tDCS1_df$pre_post, levels = c(1, 2), labels = c("PreTest", "PostTest"))
tDCS1_df$Stimulation <-factor(tDCS1_df$Stimulation, levels = 1:3, labels = c("Sham", "Anode", "Cathode"))
tDCS1_df$subject <-factor(tDCS1_df$subject, levels = 1:12)
tDCS1_df$Difficulty <-factor(tDCS1_df$Difficulty, levels = 1:3, labels = c("Easy", "Moderate", "Difficult"))


temp1<-table(tDCS1_df$OriginalID) # tabulate by the value of OriginalID
temp1 = str_sort(names(temp1), numeric = TRUE)
tDCS1_df$OriginalID
tDCS1_df$OriginalID <-factor(tDCS1_df$OriginalID, levels = temp1)


head(tDCS1_df, n=16L)
str(tDCS1_df)


