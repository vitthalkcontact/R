##-----------------------------------------------------------
## Set working directory
##-----------------------------------------------------------

setwd("C:/Users/Dell/Desktop/R/day 2")
print(getwd())

##-----------------------------------------------------------
## Load the file
##-----------------------------------------------------------
transaction_df <- read.table(file = "TransactionMaster.csv", sep = ",",
                    header = TRUE,
                    stringsAsFactors = FALSE,
                    na.strings = c("NA", ""))

customer_df <- read.csv('customerMaster.csv',
                        stringsAsFactors = FALSE,na.strings = c("NA", ""))

###------------------------------------------------------------
### Basic Functions and Operations
###------------------------------------------------------------
### max(), min()
### length()
### sum()
### unique()
### mean()

#sum of Sales_Amount
sum(transaction_df$Sales_Amount)  			# Total Sales

#na.rm - Removes NA while taking a sum of the column
sum(transaction_df$Sales_Amount, na.rm = T)  

# MAximum of Sales_Amount
maxSales <- max(transaction_df$Sales_Amount, na.rm = T)
print(maxSales)


###------------------------------------------------------------
### How many unique customer_Number in total 
###------------------------------------------------------------
length(transaction_df$Customer_Number) #Total no of values
unique(transaction_df$Customer_Number)  # unique values
length(unique(transaction_df$Customer_Number))  # No of unique values
length(transaction_df$Sales_Amount)
unique(transaction_df$Sales_Amount)


###------------------------------------------------------------
### Aggregate functions
###------------------------------------------------------------
# Method1: Average Sales by Branch
b <- aggregate(x =  transaction_df$Sales_Amount, ### name of the column(s) on which aggregation is  required
               by = list(transaction_df$Branch_Number), ## name of the column(s) by which spliting happens
               FUN = mean)  ## FUN -> aggregate function name

# Method2: Average  Sales by Branch : split => branch number; aggregattion on sales amount, operation : average
a <- aggregate(formula = Sales_Amount ~ Branch_Number, # ON ~ BY
               data = transaction_df, 
               FUN = mean)

# Total Sales by Branch
a <- aggregate(formula = Sales_Amount ~ Branch_Number, 
          data = transaction_df, 
          FUN = sum)
#The NA's are automatically taken care of (in the aggregated metric).So, no need to write to na.rm=T

###Aggregating using multiple columns

# Total Sales By Branch & Product
b <- aggregate(formula = Sales_Amount ~ Branch_Number + Product_Number, data = transaction_df, FUN = sum) #ON ~ BY (col1+col2)

b1 <- aggregate(formula = Sales_Amount ~ 
                 Product_Number + Branch_Number, data = transaction_df, FUN = sum) #ON ~ BY (col1+col2)

a_total <- aggregate(x = transaction_df$Sales_Amount, by = list(transaction_df$Branch_Number, transaction_df$Product_Number), FUN = sum)

a_avg <- aggregate(x = transaction_df$Sales_Amount, 
               by = list(transaction_df$Branch_Number, transaction_df$Product_Number), 
               FUN = mean)

##Method 3: Total sales amount and flag score for each branch_number and product_number.
transaction_df$Flag <- 1
c <- aggregate(formula = cbind(Sales_Amount,Flag) ~ 
                 Branch_Number + Product_Number, data = transaction_df, FUN = sum) # ON (cbind(col1, col2)) ~ BY

c <- aggregate(x = transaction_df[,c("Sales_Amount","Flag")],
               by = list(transaction_df$Branch_Number, transaction_df$Product_Number),
               FUN = sum)



# Example: number of records for each branch_number.
aggregate(x = transaction_df$Sales_Amount, by = list(transaction_df$Branch_Number), FUN = length)
# Example: minimum and maximum on sales amount
aggregate(x = transaction_df$Sales_Amount, by = list(transaction_df$Branch_Number), FUN = min)
aggregate(x = transaction_df$Sales_Amount, by = list(transaction_df$Branch_Number), FUN = max)

rm(a,b,c)

###------------------------------------------------------------
### Perform joins in R
###------------------------------------------------------------

# to perform join -> 1) type of join 2) common column(s)

# type s of joins -> 2 types -> inner join and outer join 
                                # outer join -> left outer join, right outer join and full outer join

      # inner join -> intersection operation
      # full outer join -> union operation

### Understanding merge() working
a <- data.frame(name=c('Ashwin','Saagar','Anil','Ankit','Peter'),
                marks=c(50,90,80,40,20),
                stringsAsFactors = FALSE)

b <- data.frame(name=c('Ashwin','Anil','Saagar','George'),
                section=c('A','B','C','A'),
                stringsAsFactors = FALSE)

# all = T -> full outer join
# all = F -> inner join
# left outer join -> all.x = T
# right outer join -> all.y = T

# Example of left outer join
a_b_left <- merge(x = a, y = b, 
                  by="name",
                  all.x = TRUE)

 

## Joins examples on dataframe objects
# Full Outer Join (union)
outer <- merge(x = transaction_df, y = customer_df, 
               by.x = "Customer_Number" , 
               by.y = "Customer_Number", 
               all = TRUE)

outer <- merge(x = transaction_df, y = customer_df, 
               by = "Customer_Number",
               all = TRUE)

# Inner Join
inner <- merge(x = transaction_df, y = customer_df, 
               by.x = "Customer_Number" , 
               by.y = "Customer_Number", 
               all = FALSE)

# Left outer Join
left <- merge(x = transaction_df, y = customer_df, 
              by.x = "Customer_Number" , 
              by.y = "Customer_Number", 
              all.x = TRUE)

# Right outer Join
right <- merge(x = transaction_df, y = customer_df, 
               by.x = "Customer_Number" , 
               by.y = "Customer_Number", 
               all.y = TRUE)

#Joining on multiple columns (inner join)
inner_1 <- merge(x = transaction_df, y = customer_df, 
               by.x = c("Customer_Number","Branch_Number"), 
               by.y = c("Customer_Number","Branch_Num"), 
               all = FALSE)

