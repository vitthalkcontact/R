#benefits of R
#language of statistical computing and data science
#100% free and opne source
#Thousands of R packages


setwd("D:\\R Training")
######################Data types#########################

#Class() functions tells the data type of the variable
#1. Integer  1  
class(2)
is.integer(2L)
#2. Character "abc"
class("abc")
#3. numeric   2,15.5
class(5.5)
is.integer(5.5)
#4. logical TRUE,FALSE
class(TRUE)
#5. complex  1+4i

#We can use as. funtion to coerce one data type to other
as.numeric(TRUE)
as.numeric(FALSE)
as.character(4)
as.numeric("4.5")
as.numeric("Hello")

##############################Data Structures ##############################
#1. Vectors - 1 dimensional array than can only hold elements of same data type

#2. Matrix - 2 dimensional array that can only hold elements of same type

#3. List - Can incorporate different R objects,No Coercion , Loss of some functionality 

#4. Data frames - The datasets

#Coercion
abc <- c("abc",2,3)
abc <- c(abc,5)
class(abc) #Character - Inspite of integer being there, abc turned out to be charcater due to coercion.This can be avoided in list
rm(abc)
abc
####1.Vector
drawn_suits <- c("hearts","spades","diamonds")
is.vector(drawn_suits)
class(drawn_suits)
##Naming a vector
drawn_suits_1 <- c("hearts"=11,"spades"=12,"diamonds"=14)
class(drawn_suits_1)
drawn_suits_1
names(drawn_suits)
names(drawn_suits_1)
drawn_suits[1]

###2.Matrix
#Big brother of vector
#2D
c(1,5,10,15,22,63)
1:6
c(1:6)
seq()
matrix_1 <- matrix(1:6,nrow=2)
matrix_1 <- matrix(1:6,nrow=2,byrow = TRUE)
rbind()
cbind()
rm(matrix_1)
rm()
m <- matrix(1:6,byrow = TRUE,nrow = 2)
rbind(m,7:9)
cbind(m,c(10,11))

rownames(m) <- c("row1","row2")
colnames(m) <- c("col1","col2","col3")
m
rm(m)
m <- matrix(1:6,byrow = TRUE,nrow = 2,dimnames = list(c("row1","row2"),c("col1","col2","col3")))
m
dim(m)
dimnames(m)
m[1]
m[,1]
m[1,]
m[2,c(2,3)]
m[2,2]
#row,column
rm(m)

###3.Lists
list("melody",1,2)
song <- list("melody",1,2)
class(song)
song
is.list(song)
names(song) <- c("title","duration","track")
song
#str(song)
rm(song)

similar_song <- list(title= "R you on time?",duration = 5)
song <- list(title="melody",duration= 1,track=2,similar=similar_song)
song

str(song)
#[ versus [[
song[1]  #subset the list, but also a list gets returned
song[[1]]  #then it returns the excat song name
song[c(1,3)]
song[[4]][1]
song[[4]][[1]]

song[["duration"]]
song["duration"]
song$duration

###4. Data frame
#Lets say a data set containing name(char), age(int)and child (logical)
#Matrix won't suffice as coercion will happen
#List will not be very practical
#Hence we need data frame
#Rows will contain oversations, column will contain variables,contain element of different type
#Elements in same column should have same data type
#Import from data source

a<-c(1,2,3,4,5,6,7)
b<-c("a","b","c","d","e","f","g")

df<-data.frame(
  empid=c(1,2,3,4,5,6,7),
  empname=c("a","b","c","d","e","f","g"),
  stringsAsFactors = FALSE
)

class(df)
str(df)  #Looks very similar to list  
df[1,2]
df[1,"empname"]

class(df[1,])
class(df[,2])

df[c(1,3),2]
df[c(1,3),1]
df[c(1,3),c(1,2)]

df[,1]
df[,"empid"]
df$empid


temp <- df[1]
temp_1 <- df[[1]]
class(temp)
class(temp_1)
df <- rbind(df,c(8,"h"))
df <- cbind(df,age=c(20,30,40,30,25,35,45,28))

