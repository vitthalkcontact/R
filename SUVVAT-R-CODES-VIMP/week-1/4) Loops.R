#3 types of loops
#repeat
#While 
#For

##################If statement##################
#syntax
#if (test_expression) {
#  statement
#}

x <- 5
if(x > 0){
  print("Positive number")
}

##################If else statement#################
#Syntax
#if (test_expression) 
#   { statement1 }
#    else 
#  { statement2 }

x <- 5
if(x > 0){
  print("Non-negative number")
} else {
  print("Negative number")
}

#############################If else ladder###########
#Syntax
#if ( test_expression1) {
#  statement1
#} else if ( test_expression2) {
#  statement2
#} else if ( test_expression3) {
#  statement3
#} else {
#  statement4
#}

x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")
################################Repeat Loop##########################################
#Syntax:
# repeat { 
#   commands 
#   if(condition) {
#     break
#   }
# }

v <- c("Hello","loop")
cnt <- 2

repeat {
  print(v)
  cnt <- cnt+1
  #print(cnt)
  if(cnt > 5) {
    break
  }
}
#break is used to stop the iteration and control flow will jump outside the loop

######################################While Loop#############################################

#Syntax: 
#while (test_expression) {
#  statement
#}

v <- c("Hello","while loop")
cnt <- 2

while (cnt < 7) {
  print(cnt)
  print(v)
  cnt = cnt + 1
}


####################################for loop##################################################

#Syntax:
#  for (value in vector) {
#  statements
#}


for (i in 1:3)
{
  i <- i+1
  print(i)
}

x<- c(2,4,6,8)
for (n in x)
{
  print(n)
  print(n^2)
}

x<- c("a","b","c")
for (n in x)
{
  print(n)
}

for (i in seq(1,10,2))             #seq function
{
  print(i)
}

##########################################Next################################################

#When we want to skip a certain iteration without coming out of the loop
#Syntax: next
for (i in 1:5)
{
  if (i==2){next}
  print(i)
}

