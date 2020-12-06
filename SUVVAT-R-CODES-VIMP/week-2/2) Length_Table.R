#Lenght() & Table() function

#Counting for a specific value in a vector
numbers <- c(4,23,4,23,5,43,54,56,657,67,67,435,
             453,435,324,34,456,56,567,65,34,435)

table(numbers)
#Length()
length(which(numbers==23))

numbers <- c("a","b","a","c")
table(numbers)
length(which(numbers=="a"))
