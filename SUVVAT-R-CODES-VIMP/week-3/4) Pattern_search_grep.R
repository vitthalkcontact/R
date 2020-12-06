setwd("E:\\R Training Learnbay\\Week 2 classes")

###Usage of %in%...Alternate could have been done using join too-------
data <- data.frame(name=c('Ashwin','Saagar','Anil','Ankit'),
                marks=c(50,90,80,40),
                stringsAsFactors = FALSE)

a <- c("Ashwin","Saagar")

data$Flag <- ifelse(data$name %in% a, 'High', 'Low')

######--------------------------
####Using grep function- regular expression function...Used for wildcard search
####-------------------------
x <- c('red','abbblue1','blue2', 'red2')
grep("blue", x)                   #Returns the indices
grep("blue", x,value=TRUE)        #Returns the values


###Combining both to do a wildcard search--------

data$Flag <- NULL  
a <- c("dsds Ashwin","Saagardsdds")

data$Flag <- NA
for (i in 1:4)
{
data$Flag[i] <- ifelse(length(grep(data$name[i],a)),'High','Low')
}

