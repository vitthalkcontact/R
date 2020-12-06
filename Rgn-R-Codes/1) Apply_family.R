#############Apply family########------------------------------------------------

################# comparison between apply, lapply and sapply##################
# function -> input -> output_type
# lapply() -> X-> vector, data.frame(), output -> list object
# sapply() -> X -> vector, dataframe(), output -> vector object
# apply() -> X-> 2D data (dataframe), output -> vector object 
# 
# 2D data -> row-wise, column-wise, element-wise
# apply() -> all three direction possible
# lapply/sapply -> column-wise operation possible
###--------------------------------------------------------------------------------------
################################lapply--------------
###------------------------------------------------------------------------------------------
#l stands for list
#The output of lapply is a list
#Syntax lapply(X,FUN)
#X -> A vector or an object.FUN-> applied to each element of X
#It doesn't need margin

movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-lapply(movies, tolower) #The result gets returned in a list format.Using tolower() function
movies_lower
str(movies_lower)

## movies -> list; FUN should be UDF.
tolower_udf <- function(x){
  return (tolower(x))
}
movies <- list(c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN"))
movies_lower_udf <- lapply(movies, tolower_udf)
class(movies_lower_udf)
print(movies_lower_udf)

abc <- c(1,2,3,4) 
abc_char <- lapply(abc,as.character)
abc_char
str(abc_char)

### 
lapply(abc_char,is.character)

lapply(abc,is.numeric) 


emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  stringsAsFactors = FALSE
)

###To check whether columns are numeric or not 
a <- lapply(emp.data,is.numeric)
print(a)
rm(abc,abc_char,a)

x = data.frame(a=c(1,2,3),b=c(10,20,30),c=c(11,9,18),
               stringsAsFactors = F)
lapply (x,length)            #The result gets returned in a list format.Using length() function

lapply (x,sum)               #Using sum() function

x_1 <- data.frame(a=c(1,2,3),b=c(10,20,30),c=c("a","b","c"),stringsAsFactors = F)
lapply (x_1,length)
#lapply (x_1,sum) #Throw an error.As characters can't be summed
lapply (x_1[,-3],sum) 
lapply (x_1[,c(1,2)],sum) 

#-----------------------------------------------------------------------------------
#####################sapply-------------
#-----------------------------------------------------------------------------------
#Sapply does the same job as lapply but returns a vector

movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-sapply(movies, tolower) #The result gets returned in a vector format.Using tolower() function
print(movies_lower)
class(movies_lower)
is.vector(movies_lower)

x = data.frame(a=c(1,2,3,4),b=c(10,20,30,40),c=c(11,9,18,12),stringsAsFactors = F)
sapply (x,length)            #The result gets returned in a vector format.Using length() function
a <- sapply(x, length)
class(a)
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
View(emp.data)

sapply(emp.data,is.numeric)

##### Find out only numeric columns from a data set
temp <- emp.data[,sapply(emp.data,is.numeric)]
class(temp)

##-----------------------------------------------------------------------------
###################apply-------------------
##-----------------------------------------------------------------------------
#apply(x,margin,FUN,...)
#MARGIN is a variable defining how the function is applied: 
#when MARGIN=1, it applies over rows, 
#whereas with MARGIN=2, it works over columns. 
#Noticeably, with the construct MARGIN=c(1,2) it applies to both rows and columns
#FUN is the function we want to apply and can be any R function, including a User Defined Function

x = data.frame(a=c(1,2,3,4),b=c(10,20,30,40),c=c(11,9,18,12),stringsAsFactors = F)
x

apply(x,2,sum) # column-wise summation
apply(x,1,sum) # row-wise summation
apply(x, c(1,2), sqrt)

#Specific columns and rows

#Column
apply(x[,c(1,2)],2,sum) 
apply(x[,c(1,2)],1,sum)

#Row
apply(x[c(1,2),],1,sum)
apply(x[c(1,2),],2,sum)





