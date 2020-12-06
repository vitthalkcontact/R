##################################### Conditional Statements ########################################

##################If statement##################
#syntax
#if (test_expression) {
#  statement
#}
num <- 4
if (num > 0){
  print("Positive number")
  print('....')
}


##################If else statement#################
#Syntax
#if (test_expression) 
#   { statement1 }
#    else 
#  { statement2 }


num = -5
if (num>0) { print("positive")
} else 
  { print('Negative') 
  print('zero')
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
num = 0
if (num>0) {
  print("positive")
} else if  (num < 0) {
  print('Negative')
} else {
  print('zero')
}


##################################### Loops ########################################
### There are 3 types of loops in R
####repeat
####While 
####For
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
  print(v) #
  cnt <- cnt+1
  if(cnt > 5) {
    break
  }
}
#break is used to stop the iteration and control flow will jump outside the loop

######################################While Loop#############################################

#Syntax: 
# variable 
#while (test_expression) {
#  statement
#  <update of the counter variable> (<optional>)
#}

v <- c("Hello","while loop")
cnt <- 2 # 

while (cnt < 7) {
  # print(cnt)
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

for (var in 1:3){
  var <- var + 1
  print(var)
}

for (i in c('a','b','c')){
  print(i)
}

# python ~ # R
# break - break
# continue - next


######################################### NEXT and BREAK ##################################
##########################################Next################################################

#When we want to skip a certain iteration without coming out of the loop
#Syntax: next
# print from 1 to 5 except 2.
for (i in 1:5)
{
  if (i==2){next}
  print(i)
}

# generating a vector thorough for loop
empty_v = c()
for (i in 1:10){
  empty_v = append(empty_v,i)
}
print(empty_v)

##########################################Break################################################
#When we want to come out of the loop after certain iteration using break keyword.
#Syntax: break
# print from 1 to 9 and come out of the loop.
for (i in 1:10)
{
  if (i==9){break}
  print(i)
}
