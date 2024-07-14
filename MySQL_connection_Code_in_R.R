#RMySQL Package
install.packages("RMySQL")
===================================
#Connecting R to MySql

# Create a connection Object to MySQL database.
# We will connect to the sampel database named "sakila" that comes with MySql installation.
mysqlconnection = dbConnect(MySQL(), user='root', password='', dbname='sakila', host='localhost')
# List the tables available in this database.
dbListTables(mysqlconnection)
===================================
#Querying the Tables
# Query the "actor" tables to get all the rows.
result = dbSendQuery(mysqlconnection, "select * from actor")
# Store the result in a R data frame object. n=5 is used to fetch first 5 rows.
data.frame = fetch(result, n=5)
print(data.fame)
===================================

#Query with Filter Clause
result = dbSendQuery(mysqlconnection, "select * from actor where last_name='TORN'")
# Fetch all the records(with n = -1) and store it as a data frame.
data.frame = fetch(result, n=-1)
print(data)

===========================
#Updating Rows in the Tables
dbSendQuery(mysqlconnection, "update mtcars set disp = 168.5 where hp = 110")


==========================
#Inserting Data into the Tables
dbSendQuery(mysqlconnection, "insert into mtcars(row_names, mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb)
values('New Mazda RX4 Wag', 21, 6, 168.5, 110, 3.9, 2.875, 17.02, 0, 1, 4, 4)"

==========================
#Creating Tables in MySql
# Create the connection object to the database where we want to create the table.
mysqlconnection = dbConnect(MySQL(), user='root', password='', dbname='sakila', host='localhost')
# Use the R data frame "mtcars" to create the table in MySql.
# All the rows of mtcars are taken inot MySql.
dbWriteTable(mysqlconnection, "mtcars", mtcars[, ], overwrite = TRUE)
==========
Dropping Tables in MySql
dbSendQuery(mysqlconnection, 'drop table if exists mtcars')








