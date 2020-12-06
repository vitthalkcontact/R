##-----------------------------------------------------------
## Set working directory
##-----------------------------------------------------------

setwd("E:\\R Training Learnbay\\Week 2 classes")

##-----------------------------------------------------------
## Load the file
##-----------------------------------------------------------
trans <- read.table(file = "TransactionMaster.csv", sep = ",",
                    header = TRUE,
                    stringsAsFactors = FALSE,
                    na.strings = c("NA", ""))
cust <- read.csv('CustomerMaster.csv',stringsAsFactors = FALSE,na.strings = c("NA", ""))
###------------------------------------------------------------
### Basic Functions
###------------------------------------------------------------

summary(trans)

sum(trans$Sales_Amount)  			# Total Sales

sum(trans$Sales_Amount, na.rm = T)  #na.rm - Removes NA while taking a sum of the column


maxSales <- max(trans$Sales_Amount, na.rm = T)


###------------------------------------------------------------
### How many unique customers in total 
###------------------------------------------------------------

length(trans$Customer_Number) #Total no of values

unique(trans$Customer_Number)  # unique values
length(unique(trans$Customer_Number))  # No of unique values

###------------------------------------------------------------
### Aggregate functions
###------------------------------------------------------------

# Average  Sales by Branch
a <- aggregate(formula = Sales_Amount ~ Branch_Number, 
               data = trans, 
               FUN = mean)

# Total  Sales by Branch
a <- aggregate(formula = Sales_Amount ~ Branch_Number, 
          data = trans, 
          FUN = sum)
#The NA's are automatically taken care of (in the aggregated metric).So, no need to write to na.rm=T

###Aggregating using multiple columns

# Total Sales By Branch & Product
b <- aggregate(formula = Sales_Amount ~ 
            Branch_Number + Product_Number, data = trans, FUN = sum)

trans$Flag <- 1
c <- aggregate(formula = cbind(Sales_Amount,Flag) ~ 
                 Branch_Number + Product_Number, data = trans, FUN = sum)

rm(a,b,c)

###------------------------------------------------------------
### Perform joins in R
###------------------------------------------------------------

# Full Outer Join
outer <- merge(x = trans, y = cust, 
               by.x = "Customer_Number" , 
               by.y = "Customer_Number", 
               all = TRUE)

# Inner Join
inner <- merge(x = trans, y = cust, 
               by.x = "Customer_Number" , 
               by.y = "Customer_Number", 
               all = FALSE)

# Left Join
left <- merge(x = trans, y = cust, 
              by.x = "Customer_Number" , 
              by.y = "Customer_Number", 
              all.x = TRUE)

# Right Join
right <- merge(x = trans, y = cust, 
               by.x = "Customer_Number" , 
               by.y = "Customer_Number", 
               all.y = TRUE)

#Joining on multiple columns
inner_1 <- merge(x = trans, y = cust, 
               by.x = c("Customer_Number","Branch_Number") , 
               by.y = c("Customer_Number","Branch_Num"), 
               all = FALSE)


a <- data.frame(name=c('Ashwin','Saagar','Anil','Ankit'),
                marks=c(50,90,80,40),
                stringsAsFactors = FALSE)

b <- data.frame(name=c('Ashwin','Anil','Saagar','George'),
                section=c('A','B','C','A'),
                stringsAsFactors = FALSE)

#By default sorting happens after merge.The sorting happens on the column being used for merge.
#If we want to retain the original order of the x table,metion sort=FALSE

a_b_left <- merge(x = a, y = b, 
                   by="name",
                   all.x = TRUE
                  )

a_b_left <- merge(x = a, y = b, 
                  by="name",
                  all.x = TRUE,
                  sort=FALSE)     

