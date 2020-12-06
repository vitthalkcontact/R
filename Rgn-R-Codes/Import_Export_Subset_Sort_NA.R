##-----------------------------------------------------------
## Set working directory
##-----------------------------------------------------------

getwd()
setwd("C:/Users/Dell/Desktop/R/day 2") # set this path where csv files are located

str(data.frame('rollno'=c(1,2,3,4,5,7,8), 'names'=c('A','B','D','C','A','B','C'), stringsAsFactors = T))
str(data.frame('rollno'=c(1,2,3,4,5,7,8), 'names'=c('A','B','D','C','A','B','C'), stringsAsFactors = F))
##-----------------------------------------------------------
## Read a CSV file into R
##-----------------------------------------------------------
#read.table() - mother for reading any file - Reads any file in table format and create a data frame from it
#no of arguments are huge

transaction_df <- read.table(file = "TransactionMaster.csv",sep = "," ,
                    header = TRUE,
                    stringsAsFactors = FALSE,
                    na.strings = c(""))

#read.csv()- custom made for only csv 
#read.delim() - custom made for text 

#header = T - Read the first row of the file as variable name
#sep- How fields in the data file are separated
#CSV file - Most common and standarized file
#Read.csv- Header=T & sep="," is default, dec="."
# For a text file - sep ="\t"
#read.delim - Header=T & sep="\t" is default

### read csv file using read.csv
cust <- read.csv('CustomerMaster.csv',
                 stringsAsFactors = FALSE,
                 na.strings = c("NA"))

##-----------------------------------------------------------
## Check the imported dataset / Data Summary
##-----------------------------------------------------------
#### operations on dataframe object
### str() ->  data types of the columns
### summary() -> statistical summary of the dataframe (~describe)
### head() -> displays top six records of the dataframe
### tail() -> displays last siz records of the dataframe
### View() -> displays  dataframe in tabular form
### colnames() -> lists out columns names
### rownames() -> lists out rows names
### dim() -> returns dataframe shape
### names(dataframe) -> returns lists of columns 
### table() -> returns frequency distribution of the values
### which()
### rm()
### length()
### unique()

head(transaction_df, n = 10)    # Display top 10 rows
tail(transaction_df, n = 10)    # Display bottom 10 rows
View(head(transaction_df, n = 10)) 

# cust$City
# cust[, 6]
# cust[,'City']
# View(head(cust, 5))
str(cust) # info()
summary(cust) # describe()
summary(cust$Customer_Number)


##################### selecting column/columns #################################
## let's consider selecting column 'Branch_Number'
transaction_df$Branch_Number
transaction_df[,1]
transaction_df[,"Branch_Number"]

# selecting multiple columns
View(transaction_df[,c(1,3,4)])
View(transaction_df[,c("Branch_Number",'Customer_Number','Invoice_Date')])

# select mutliple columns /rows
View(transaction_df[c(1,2,3,4,5),c("Branch_Number",'Customer_Number')])
View(transaction_df[1:5,c("Branch_Number",'Customer_Number')])
View(transaction_df[seq(1,5),c("Branch_Number",'Customer_Number')])

################################ display columns and rows names ################
colnames(transaction_df)  
names(transaction_df)
rownames(transaction_df)       
dim(transaction_df) # (rows, columns)

summary(cust)

####################### which function ##########################################
which(colnames(transaction_df)=="Sales_Amount")

################################## rename columns ##############################
##Renaming a column'
names(transaction_df)[10] <- 'System_Period_1'
names(transaction_df)[which(names(transaction_df) == 'System_Period_1')] <- 'System_Period'
# names(transaction_df)[which(names(transaction_df) == 'System_Period_1')] <- 'System_Period'
# which((names(transaction_df) == 'System_Period_1') & names(transaction_df == 'Branch_Number'))
# renaming multiple columns
names(cust)[which((names(cust)=='City') | (names(cust)=='State'))] = c('City_N','State_N')
names(cust)[which((names(cust)=='City_N') | (names(cust)=='State_N'))] = c('City','State')


############################# frequency of values - table function #########################
table(transaction_df$Branch_Number)  #Showcases the frequency distribution of the values

##-----------------------------------------------------------
## Access elements of the dataframe
##-----------------------------------------------------------
transaction_df[1, 2]     # Get the element from 1st row, 2nd column
# Get the element from 1st row, 2nd and 3rd columns
print(transaction_df[1, c(2,3)] )
print(transaction_df[1, 2:3])
print(transaction_df[1, seq(2,3)] )

transaction_df[1, ]      # Get the first row in form of a data frame

transaction_df[, 1]      # Get the first column in form of a vector
transaction_df[,-1]      #Excludes the first column

class((transaction_df[, 1]))     # Use class function to find the type of data structure 

cust$Customer_Name[c(1,2,3)] # Pick the first few observations

summary(cust) #~describe()
summary(cust$Customer_Number)
names(cust)

str(cust) # ~info()

##-----------------------------------------------------------
## Subset data frame based on some conditions using which function
##-----------------------------------------------------------
### 
# select Customers in the city of Atlanta
atlantaCustomers <- cust[which(cust$City == 'ATLANTA'), ]
View(atlantaCustomers)

#Guess the no of rows and columns
atlantaCustomers <- cust[which(cust$City == 'ATLANTA'), c(1,3)] 

### select records where city = 'ATLANTA' and postal code = "30336", "30316"

View(cust[which((cust$City == 'ATLANTA') & (cust$Postal_Code %in% c("30336", "30316"))), ])
View(cust[which((cust$City == 'ATLANTA') & (cust$Postal_Code == c("30336", "30316"))), ])

### select records where city != 'ATLANTA' and postal code != "30336", "30316"
View(cust[which(((cust$City == 'ATLANTA') & (cust$Postal_Code == c("30336", "30316")))==FALSE), ])
View(cust[which(((cust$City == 'ATLANTA') & (cust$Postal_Code %in% c("30336", "30316")))==FALSE), ])

# Get all transaction_dfactions where Sales_Amount of $200 or more
highSales <- transaction_df[which(transaction_df$Sales_Amount >= 200),]
dim(highSales)

unique(highSales$Sales_Amount)

##-----------------------------------------------------------
## Sort a data frame by some column
##-----------------------------------------------------------
#Understanding order() and sort() function 

#working of order() function
a <- c(45,50,10,96)
order(a)        #3,1,2,4 => Ascending order
order(-a)       #4,2,1,3 => Descending order
a[order(a)]  # => returns sorted data/values in ascending order
a[order(-a)] # => returns sorted data/values in descending order

#working of Sort function
a <- c(45,50,10,96)
sort(a)  # Ascending order
sort(a,decreasing = TRUE) # Descending order

### sort data based on column Sales_Amount
# highSales
order(highSales$Sales_Amount)   
sortedSales <- highSales[order(highSales$Sales_Amount),] # ascending order
sortedSales <- highSales[order(-highSales$Sales_Amount),]   #In descending order

View(highSales[sort(highSales$Sales_Amount), ])

# sort(highSales$Sales_Amount)


# sort(cust$Phone_Number)


##-----------------------------------------------------------
## Identify and handling missing values
##-----------------------------------------------------------
#NA
transaction_df <- read.table(file = "TransactionMaster.csv", sep = ",",
                    header = TRUE,
                    stringsAsFactors = FALSE,
                    na.strings = c("NA"))

# get index value where 'Service_Date' is null. 
print(which(is.na(transaction_df$Service_Date)))


#Subsetting a data frame based on NA condition
a <- transaction_df[which(is.na(transaction_df$Service_Date)==FALSE),] # records where column Service_Date is not null.
a <- transaction_df[which(is.na(transaction_df$Service_Date)==TRUE),] # records where column Service_Date is null.

#Directly replacing NAs by the values in single line
transaction_df$Service_Date[which(is.na(transaction_df$Service_Date))] <- "01-Jan-00"
# "01-Jan-00" => mean(col, rm.na = TRUE)

#### Adding and deleting columns ######
## adding a column
transaction_df$new_col <- 5
transaction_df$Sales_Amount_new  <- transaction_df$Sales_Amount*5

# delete a column
transaction_df$new_col <- NULL


##-----------------------------------------------------------
## Delete objects from memory
##-----------------------------------------------------------
ls()
#rm(<object>) # pass object to be removed

### Delete specific object
rm(transaction_df)

# Delete everything
rm(list = ls())



### Exporting data.frame object as csv file
# write.csv(Your DataFrame,"Path where you'd like to export the DataFrame\\File Name.csv", row.names = FALSE)


