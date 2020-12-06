#############Apply family########------------------------------------------------


setwd("E:\\R Training Learnbay\\Week 3 classes")
trans <- read.table(file = "TransactionMaster.csv", sep = ",",
                    header = TRUE,
                    stringsAsFactors = FALSE,
                    na.strings = c("NA", ""))
###--------------------------------------------------------------------------------------
################################lapply--------------
###------------------------------------------------------------------------------------------
#l stands for list
#The output of lapply is a list
#Syntax lapply(X,FUN)
#X A vector or an object.FUN applied to each element of X
#It doesn't need margin

movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-lapply(movies, tolower) #The result gets returned in a list format.Using tolower() function
movies_lower
str(movies_lower)

abc <- c(1,2,3,4) 
abc_char <- lapply(abc,as.character)
abc_char
str(abc_char)
lapply(abc,is.character)
lapply(abc,is.numeric)

emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  stringsAsFactors = FALSE
)

###To check whether columns are numeric or not 
a <- lapply(emp.data,is.numeric)
a
rm(abc,abc_char,a)

x = data.frame(a=c(1,2,3),b=c(10,20,30),c=c(11,9,18),stringsAsFactors = F)
lapply (x,length)            #The result gets returned in a list format.Using length() function

lapply (x,sum)               #Using sum() function

x_1 = data.frame(a=c(1,2,3),b=c(10,20,30),c=c("a","b","c"),stringsAsFactors = F)
lapply (x_1,length)
lapply (x_1,sum)  #Throw an error.As characters can't be summed

#-----------------------------------------------------------------------------------
#####################sapply-------------
#-----------------------------------------------------------------------------------
#Sapply does the same job as lapply but returns a vector

movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-sapply(movies, tolower) #The result gets returned in a vector format.Using tolower() function

x = data.frame(a=c(1,2,3),b=c(10,20,30),c=c(11,9,18),stringsAsFactors = F)
sapply (x,length)            #The result gets returned in a vector format.Using length() function

sapply (x,sum)               #Using sum() function

#-----------------------------------------------------------------------------
############Subsetting based on column########################################
#-----------------------------------------------------------------------------
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  stringsAsFactors = FALSE
)
sapply(emp.data,is.numeric)

##### Find out only numeric columns from a data set
temp <- emp.data[,sapply(emp.data,is.numeric)]

##-----------------------------------------------------------------------------
###################apply-------------------
##-----------------------------------------------------------------------------
#apply(x,margin,FUN,...)
#MARGIN is a variable defining how the function is applied: when MARGIN=1, it applies over rows, 
#whereas with MARGIN=2, it works over columns. 
#Noticeably, with the construct MARGIN=c(1,2) it applies to both rows and columns
#FUN is the function we want to apply and can be any R function, including a User Defined Function

x = data.frame(a=c(1,2,3),b=c(10,20,30),c=c(11,9,18),stringsAsFactors = F)
x

apply(x,2,sum)
apply(x,1,sum)

#Specific columns and rows

#Column
apply(x[,c(1,2)],2,sum)
apply(x[,c(1,2)],1,sum)

#Row
apply(x[c(1,2),],1,sum)
apply(x[c(1,2),],2,sum)




