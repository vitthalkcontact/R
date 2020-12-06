#benefits of R
####language of statistical computing and data science
####100% free and opne source
####Thousands of R packages

#getwd()
#setwd("C:/Users/Dell")/ # specify path
# class() # str() # as.xxx()
######################Data types#########################

#Class() functions tells the data type of the variable
#1. Character "abc"
class("abc") # character
#2. numeric   2,15.5
class(5.5) # numeric
is.numeric(5) # TRUE
#3. logical TRUE,FALSE
class(TRUE) # 'logical'
class(T)
class(F)
class(FALSE)
#4. complex  1+4i
class(1+4i)

#We can use as. funtion to coerce one data type to other
as.numeric(TRUE) # 1
as.numeric(FALSE) # 0
is.character(4) # FALSE
is.numeric("4") # FALSE
is.numeric("Hello") # FALSE
is.character("hello") # T

##############################Data Structures ##############################
#1. Vectors - 1 dimensional array than can only hold elements of same data type

#2. Matrix - 2 dimensional array that can only hold elements of same type

#3. List - Can incorporate different R objects,No Coercion , Loss of some functionality 

#4. Data frames - The datasets

#Coercion
abc <- c("abc",2,3)
class(abc) #Character - Inspite of integer being there, abc turned out to be charcater due to coercion.This can be avoided in list
rm(abc) # clears object from memory

####1.Vector
## A vector can be generated using : c function, colon operator or seq function
### c function : c(<values seperated by commas>)
### colon operator: start:end <end is enclusive>
### seq function : seq(start,end,step)

# inter, numeric, character -> c()
# integer -> :
# integer, numeric -> seq

drawn_suits <- c(11,12,14)
is.vector(drawn_suits) # unnamed vector
class(drawn_suits)

##Naming a vector
drawn_suits_1 <- c("hearts"=11,"spades"=12,"diamonds"=14)
class(drawn_suits_1)
drawn_suits_1
names(drawn_suits) # 
names(drawn_suits_1)

print(drawn_suits_1[1]) # fetch element 11
print(drawn_suits_1['hearts']) # fetch element 11

# access vector
abc = c(3,4,5,6,7,8,9,20,12,23,45,67,97)
# fetch 8,9,20
print(abc[6:8])
print(abc[c(6,7,8)])
# fetch all but 3
print(abc[-1])
# fetch all but 3,4
print(abc[c(-1,-2)])
#abc[c(1,-2)] will end up as an error
print(abc[c(1.2, 4.5)])
print(abc[c(1, 4)])
print(abc[c(1, 4)])

# modify a vector
abc[1] <- 5
print(abc)

###2.Matrix
#2D, homogeneous data type

### matrix can be created by following ways:
#### (a) using matrix() function
#### (b) using rbind()/cbind() on vectors
#### (c) using dim() on vector

### functions relevant to matrix operations:
#### dim() -> gets dimmension
#### rownames() -> sets row names
#### colnames() -> sets columns names
#### dimnames() -> returns dimensions names

### creating matrix
#(a)
matrix_1 <- matrix(1:6,nrow=2)
print(matrix_1)
matrix_1 <- matrix(1:6,nrow=2,byrow = TRUE)
print(matrix_1)
#rbind() # combines data by rows to create matrices
#cbind() # combines data by columns to create matrices
rm(matrix_1) # delete matrix_1 object
matrix_f <- matrix(1:7,nrow=2, byrow = F)
print(matrix_f)
matrix_f <- matrix(1:7,nrow=3, byrow = F)
print(matrix_f)

#(b)
print(rbind(c(1,2,3,4),c(4,5,6,7)))
print(cbind(c(1,2,3,4),c(4,5,6,7)))
dim(cbind(c(1,2,3,4),c(4,5,6,7)))
m <- matrix(1:6,byrow = TRUE,nrow = 2)
print(m)
rbind(m,7:9) 
cbind(m,c(10,11))

## assigning names to the matrix
rownames(m) <- c("row1","row2")
colnames(m) <- c("col1","col2","col3")
print(m)
rm(m)
m <- matrix(1:6,byrow = TRUE,nrow = 2,dimnames = list(c("row1","row2"),c("col1","col2","col3")))
print(m)

# dimension of the matrix
dim(m)

## 
dimnames(m)

#(c) matrix creation using dim() function 
x <- c(1,2,3,4,5,6)
print(x)
dim(x) <- c(2,3)
print(x)

### Access matrix elements
#(a) using integer index and square bracket: matrix[row,column]
#(b) using integers vector: matrix[c()], negative index excludes 
m <- matrix(1:6,nrow=2)
print(m)
## access element '3'
print(m[1,2])
print(m[3])
print(m[6])

print(m[,1] )## all rows and 1st column => returned object is vector 
print(m[,1,drop=F]) # returns 1st column in matrix format
print(m[1,]) ## 1st row and all columns
print(m[1,, drop = FALSE]) ## 1st row in matrix format
print(m[2,c(2,3)]) # 2nd row and (2nd+3rd) columns
print(m[1:4]) 
print(m[c(-1), c(2,3)])
rm(m)


###3.Lists
# n-dimension, any r-supported data type can be an element to a list
## a list object is created with list() function.
# example of a list
song <- list("melody",1,2)
is.list(song)
song
print(names(song))
names(song) <- c("title","duration","track")
song
rm(song)

# example of named list
song <- list(title="melody",duration= 1,track=2)
song
class(song)
str(song) # ~info() in python

## Access list elements
#[ versus [[
song[1]  #subset the list, but also a list gets returned
print(class(song[1])) 
song[[1]]  #then it returns the exact song name
print(class(song[[1]])) 
song[c(1,3)]
#song[[c(1,3)]] # this will result into an error
song[[3]]
song[["duration"]]
song[3]
song["duration"]
# song$duration


###4. Data frame
#Lets say a data set containing name(char), age(int)and child (logical)
#Matrix won't suffice as coercion will happen
#List will not be very practical
#Hence we need data frame
#Rows will contain observations, column will contain variables,contain element of different type
#Elements in same column should have same data type

df<-data.frame(
  empid=c(1,2,3,4,5,6,7),
  empname=c("a","b","c","d","e","f","a"),
  stringsAsFactors = FALSE
)

str(df)  #Looks very similar to list  

df1<-data.frame(
  empid=c(1,2,3,4,5,6,7),
  empname=c("a","b","c","d","e","f","a"),
  stringsAsFactors = T
)

str(df1)  #Looks very similar to list 


df[1,2]
df[1,"empname"]
class(df[1,])
df[c(1,3),2]
df[c(1,3),1]
df[c(1,3),c(1,2)]
df$empids

df <- rbind(df,c(8,"h"))
df <- cbind(df,age=c(20,30,40,30,25,35,45,28))

###5. Factor
### factor is 1 dimensional data
f_vector <- factor(c('male','female','male','female','female'))
print(f_vector) # factors are arranged in ascending order by default

# levels parameter - changes order of the levels
f_vector <- factor(c('male','female','male','female','female'), levels = c('male','female'))
print(f_vector)

# ordered parameter - assigns numerical values
f_vector <- factor(c('male','female','male','female','female'), ordered = TRUE)
print(f_vector)
print(max(f_vector))

f_vector <- factor(c('first','second','third','first','third','second'), levels = c('third','second','first'),
                   ordered = TRUE)
print(f_vector)
print(max(f_vector))





