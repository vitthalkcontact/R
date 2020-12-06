####################################################################################################################
######################################## DataFrame #################################################################
####################################################################################################################

##################### Structure ###

# Create the data frame.
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-27")),
  stringsAsFactors = FALSE
)

print(emp.data) 
emp.data
View(emp.data)
View(head(emp.data,2))

# Get the structure of the data frame.
str(emp.data)
class(emp.data)

################## Summary

print(summary(emp.data))  
summary(emp.data$emp_id)

################### Extraction of Data

# Extract Specific columns.
result <- data.frame(emp_name=emp.data$emp_name,salary=emp.data$salary)
class(result)
result <- emp.data[,c(1,2)]
class(result)
print(result)

# Extract first two rows.
result <- emp.data[1:2,]
print(result)

# Extract 3rd and 5th row with 2nd and 4th column.
result <- emp.data[c(3,5),c(2,4)]  #(row,colum)
print(result)

#Rearranging the columns 
emp.data <- emp.data[,c(1,2,4,3)]

################# Expansion
######## column add directly/in place of Cbind

# Add the "dept" coulmn.
emp.data <- data.frame(emp.data,dept=c("IT","Operations","IT","HR","Finance"))
emp.data$dept <- c("IT","Operations","","HR","Finance")
emp.data <- cbind(emp.data,dept=c("IT","Operations","IT","HR","Finance"))

v <- emp.data
print(v)

#Deleting a row/column
emp.data$dept <- NULL 

#Deleting a column
emp.data <- emp.data[,-c(1,2)]
emp.data <- emp.data[,c(3,4)]


#Deleting a row
emp.data <- emp.data[-c(1,2),]

############# rbind()

# Create the first data frame.
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-27")),
  dept = c("IT","Operations","IT","HR","Finance"),
  stringsAsFactors = FALSE
)

# Create the second data frame
emp.newdata <- 	data.frame(
  emp_id = c (6:8), 
  emp_name = c("Rasmi","Pranab","Tusar"),
  salary = c(578.0,722.5,632.8), 
  start_date = as.Date(c("2013-05-21","2013-07-30","2014-06-17")),
  dept = c("IT","Operations","Fianance"),
  stringsAsFactors = FALSE
)

# Bind the two data frames.
emp.finaldata <- rbind(emp.data,emp.newdata)
print(emp.finaldata)

#While rbinding , column names shoulb be same.Sequence need not be the same
