library(foreign)
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

#head(mydata2, n=16L)
table(mydata2$Stimulation)



