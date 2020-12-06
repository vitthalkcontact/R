############################### Functions ##################################################
#Syntax:
#function_name <- function(arg_1, arg_2, ...) {
#  Function body 
# <return()> # optional
#}

####### Example of function with no argument ###########################
# Create a function without an argument.

new.function <- function() { # function defination
  for(i in 1:5) {
    print(i^2)
  }
}	

# Call the function without supplying an argument.
new.function()

######## function with positional arguments ############################
# 1) Create a function with definite arguments.

### WAP to find maximum of two numbers.
my_fun <- function(arg1,arg2)
{
  # This function returns largest of the two numbers.
  new_var <- max(arg1,arg2)
  return (new_var)
}

#Calling the function
my_fun(27,41)
# my_fun(27)


# 2) Create a function with default arguments.
new.function <- function(c, a = 3, b = 6) {
  result <- a * b  - c
  print(result)
}

# Call the function.
new.function(5)

## valid ways to call a parametric function default arguments.
new.function(5)
new.function(5,9,5)
new.function(c = 5,9,5)
new.function(5,b = 9,5)
new.function(5,b = 9,c = 5)
new.function(5,9,c = 5)

# 3) Create a function with dynamic no. of parameters
test_fun1 <- function(...)
{
  
  a <- 0
  for (i in c(...))
  { a <- a+i }
  return(a)
}


test_fun1()
a <- test_fun1(1,2,3,4, 5,6,7, 5, 6,2)
b <- test_fun1(a = 1,b = 2,c = 3,d = 4, string_ = 5)
c <- test_fun1(1,2)


########## Returning multiple values from a function using return ##########
my_fun <- function(arg1,arg2)
{
  new_var <- max(arg1,arg2)
  new_var_1 <- arg1+arg2
   #return(list(new_var,new_var_1))# valid 
  return(c(new_var,new_var_1)) # this is valid
  #return((new_var,new_var_1)) # will result into an error
}

a <- my_fun(10,20)


