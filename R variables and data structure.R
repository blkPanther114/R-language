# NewString<-"hello"
# print(NewString)
# 
# variable<-45.8
# print(class(variable))
# 
# variable<-7S
# print(class(variable))
# 
# variable<-'hello'
# print(class(variable))
# 
# variable<-"23"
# print(class(variable))
# 
# #### Create a vector.#####
# Cities <- c('London','Oxford',"Leeds")
# print(Cities)
# # Get the class of the vector.
# print(class(Cities))
# 
# #### Create a list.####
# new_list <- list(c(5,9,34),999)
# # Print the list.
# print(new_list)
# 
# #### Create a matrix ####
# M = matrix( c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol = 3, byrow = TRUE)
# print(M)
# 
# ### Create an array####
# arr <- array(c('1','0'),dim = c(3,3,2))
# print(arr)
# 
# #### Create a vector.####
# Gender <- c('Male','Female','Female','Male','Female','Male')
# # Create a factor object.
# factor_gender <- factor(Gender)
# # Print the factor.
# print(factor_gender)
# print(nlevels(factor_gender))

# Create the data frame.
Players <- 	data.frame(
  Name = c("Jermey Blake", "Meghan Agosta", "Tim Jones" , "Vicky Matt"),
  Gender = c("Male","Female","Male","Female"),
  Country = c("USA", "Canada" , "USA" , "Canada"),
  Age = c(27,30,28,31)
)
print(Players)

#### Variables #####
# Print variable x
Name <- "Tim Jones"
Name
Age  <- 28
Age
# We call a and b and apply subtraction
a = 10
b = 5
a-b

############ Logical operators ######
# Create a vector from 1 to 10
logical_condition <- c(1:10)
logical_condition %%2 == 0
# Print multiple of 2
logical_condition[(logical_condition%%2 == 0)]

###### for loop #####
values <- c(1:10)
count <- 0
for (val in values) {
  if(val %% 3 == 0)  count = count + 1
}
print(count)

Divisible_by_5 <- function(val) {
  for(num in 1:val) {
    if(num%%5 == 0)
      print(num)
  }
}
Divisible_by_5(30)

