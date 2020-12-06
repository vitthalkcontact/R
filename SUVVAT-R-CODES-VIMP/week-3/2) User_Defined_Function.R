############################### Functions ##################################################
#Syntax:
#function_name <- function(arg_1, arg_2, ...) {
#  Function body 
#}

#Defining a function 
#First the function body needs to be executed.Then only , we can call that function.
my_fun <- function(arg1,arg2)
{
  new_var <- max(arg1,arg2)
  return(new_var)
}

#Calling the function
my_fun(27,41)
my_fun(27,10)

# Create a function without an argument.
new.function <- function() {
  for(i in 1:5) {
    print(i^2)
  }
}	

# Call the function without supplying an argument.
new.function()


# Create a function with arguments.
new.function <- function(a,b,c) {
  result <- a * b + c
  print(result)
}

# Call the function by position of arguments.
new.function(5,3,11)

# Call the function by names of the arguments.
new.function(a = 11, b = 5, c = 3)


#-----------------------------------------------------------------
#########Create a function with default values in arguments##
#------------------------------------------------------------------
new.function <- function(a = 3, b = 6) {
  result <- a * b
  print(result)
}

# Call the function without giving any argument.
new.function()

# Call the function with giving new values of the argument.The parametric values in function gets overwritten.
new.function(9,5)

###############Returning multiple values from a function using return##########
####
my_fun <- function(arg1,arg2)
{
  new_var <- max(arg1,arg2)
  new_var_1 <- arg1+arg2
  return(list(new_var,new_var_1))
}

a <- my_fun(10,20)

##Creating a function with dynamic no. of parameters...
test_fun1 <- function(...)
{
  
  a <- 0
  for (i in list(...))
  {
    a <- a+i 
  }
  return(a)
}

a <- test_fun1(1,2,3,4)
b <- test_fun1(1,2)


