##-----------------------------------------------------------
## Set working directory
##-----------------------------------------------------------

getwd()
setwd("E:\\temp")
setwd("E:/temp")

##-----------------------------------------------------------
## Install a package
##-----------------------------------------------------------
install.packages('Hmisc')


##-----------------------------------------------------------
## Load a package
##-----------------------------------------------------------

library(Hmisc)

search()   # Shows packages that are currently loaded- After running the library command


##-----------------------------------------------------------
## Read a CSV file into R
##-----------------------------------------------------------

#utils package - loaded by default
#read.table() - mother for reading any file - Reads any file in table format and create a data frame from it
#no of arguments are huge

trans <- read.table(file = "TransactionMaster.csv", sep = ",",
                    header = TRUE,
                    stringsAsFactors = FALSE,
                    na.strings = c(""))
read.table()
#read.csv()- custom made for only csv 
#read.delim() - custome made for text 

is.numeric()
is.character()
#header = T - Reades the first row of the file as variable name
#sep- How fields in the data file are separated
#CSV file - Most common and standarized file
#Read.csv- Header=T & sep="," is default, dec="."
# For a text file - sep ="\t"
#read.delim - Header=T & sep="\t" is default


cust <- read.csv('CustomerMaster.csv',header=T,sep=',',stringsAsFactors = FALSE,na.strings = c("NA", ""))

##-----------------------------------------------------------
## Check the imported dataset / Data Summary
##-----------------------------------------------------------

head(trans, n = 10)    # Display top 10 rows
View(head(trans, n = 10)) 


str(trans)             # Display the metadata (data about data)

summary(trans$Branch_Number) # Summary statistics for the variables
summary(trans[,1])
summary(trans[,"Branch_Number"])

colnames(trans)           # Displays column names

rownames(trans)        # Displays the row names / numbers

dim(trans)

table(trans$Branch_Number)  #Showcases the frequency distribution of the values

##Renaming a column
names(trans)[which(names(trans) == 'System_Period')] <- 'System_month'
names(trans)[10] <- 'System_Period'

which()
#Getting the column index of a required column name
which(colnames(trans)=="Sales_Amount")


##-----------------------------------------------------------
## Access elements of the dataframe
##-----------------------------------------------------------

trans[1, 2]     # Get the element from 1st row, 2nd column

trans[1, ]      # Get the first row in form of a data frame

trans[, 1]      # Get the first column in form of a vector
a <- trans[,-1]      #Excludes the first column


class((trans[, 1]))     # Use class function to find the type of data structure 
class(trans[1,])


cust$Customer_Name[c(1,2,3)] # Pick the first few observations

##-----------------------------------------------------------
## Subset data frame based on some conditions
##-----------------------------------------------------------

which(cust$City == 'ATLANTA')           # Customers in the city of Atlanta
x <- which(cust$City == 'ATLANTA')  
atlantaCustomers <- cust[which(cust$City == 'ATLANTA'), ]
class(atlantaCustomers)
unique(atlantaCustomers$City)
unique(cust$City)

atlantaCustomers <- cust[which(cust$City == 'ATLANTA'), c(1,3)]  #Guess the no of rows and columns

# Get all transactions where Sales_Amount of $200 or more

highSales <- trans[which(trans$Sales_Amount >= 200),]
highSales <- trans[which(trans$Sales_Amount >= 200 & trans$Branch_Number==101419),]

##-----------------------------------------------------------
## Sort a data frame by some column
##-----------------------------------------------------------

#Understanding order(),rank() and sort() function 

#Order- order tells you how to get them in ascending order.Returns the indices
a <- c(45,50,10,96)
order(a)        #3,1,2,4
order(-a)       #4,2,1,3
a[order(a)]
a[order(-a)]

#rank - rank tells the rank of each element
a <- c(45,50,10,96)
rank(a)         #2,3,1,4
rank(-a)        #3,2,4,1

order(highSales$Sales_Amount)   # Get sorted indices in increasing order

#Sort function
a <- c(45,50,10,96)
sort(a)
sort(a,decreasing = TRUE)

#Sorting based on a particular column
sortedSales <- highSales[order(highSales$Sales_Amount),]   #Kind of rearranging the rows based of row indices
a <- highSales[order(-highSales$Sales_Amount),]   #In descending order

#Sorting based on multiple column
#The sequence follows, the first one , then in that the 2nd one, then in that the 3rd one
sortedSales <- highSales[order(highSales$System_Period, 
                               highSales$Sales_Amount),]

##-----------------------------------------------------------
## Identify missing values
##-----------------------------------------------------------
#NA


trans <- read.table(file = "TransactionMaster.csv", sep = ",",
                    header = TRUE,
                    stringsAsFactors = FALSE,
                    na.strings = c("NA", ""))

which(is.na(trans$Service_Date))

trans$Service_Date[c(45918, 46011)] <- "01-Jan-00"

#Directly replacing NAs by the values in single line
trans$Service_Date[which(is.na(trans$Service_Date))] <- "01-Jan-00"

#Subsetting a data frame based on NA condition
a <- trans[which(is.na(trans$Service_Date)==FALSE),]
a <- trans[which(is.na(trans$Service_Date)==TRUE),]

##-----------------------------------------------------------
## Delete objects from memory
##-----------------------------------------------------------

ls()
rm(sortedSales)

# Delete everything
rm(list = ls())

#Exporting a data
write.csv(trans,"temp.csv")
write.csv(trans,"temp.csv",row.names=FALSE)
