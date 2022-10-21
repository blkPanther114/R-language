##### Create a dataframe ######
player <- c("Jeremey Blake", "Meghan Agosta", "Tim Jones" , "Vicky Matt", "David Blake" )
age <- c(27,30,28,31,35)
british_player	<-	c ( TRUE,	FALSE,	FALSE,	TRUE,	TRUE)
df <- data.frame(player, age, british_player)
df
names(df)<-c( "Player", "Age", "British_Player" )
df <- data.frame(Player = player, Age = age, British_Player = british_player)
df

library(readr)
data1 <- read.csv("Path of data file\data.csv", header=TRUE, stringsAsFactors=FALSE)
library("readxl")
read_excel("Path of data file\data.xsls",sheet = "Your sheet name")

names(df)<-c( "Player", "Age", "British_Player" )
df <- data.frame(Player = player, Age = age, British_Player = british_player)
df

##### extract/subset column #####
df[2,2]
df[2,'Age']
df[2,]
df[,'Age']
df[c(2,5),c('Age','British_Player')]
df[2]
df$Name
df[["Player"]]
df[[1]]
df["Player"]
df[1]

###### Adding columns and rows #########
BMI <- c ( 23, 22, 24,22, 25)
df$BMI <- BMI
df


### Add column
BMI <- c ( 23, 22, 24,22, 25)
df <- cbind(df,BMI)

#Add row
harry <-data.frame(Player = "Harry Jack", Age = 20, British_Player = TRUE, BMI = 23)
df <- rbind(df,harry)

###### Sorting #####
sort(df$Age)
rank <- order(df$Age)
rank
df[rank,]
df[order( df$Age , decreasing = TRUE) , ]

install.packages("tidyverse")
library(tidyverse)

############# Activity 3 #############
# Create the data frame.
employee <- data.frame(
  employee_id = c (1:5), 
  employee_name = c("Adam" , "Bob" , "John", "Mike", "Sara"),
  Occupation = c("Clerical","Management ","Professional","Skilled Manual","Professional"), 
  DOB = as.Date(c("1998-02-01", "1988-05-30", "1990-12-15", "1994-05-16","1990-01-20")),
  stringsAsFactors = FALSE
)

#Now view the dataframe
employee

#add a new column, Gender
Gender <- c("Male","Male","Male","Male","Female")
emp
# Print the data frame.			
print(employee) 
str(employee)
print(summary(employee)) 

#Extract data
result <- data.frame(employee$employee_name,employee$DOB)
print(result)

#### rows 
result <- employee[1:3,]
print(result)


olympics<-read_excel("C:/Users/Effie/Downloads/Olympics_data.xlsx")
olympics

###### Sorting #####
sort(olympics$Age)
rank <- order(olympics$Age)
rank
olympics[rank,]
olympics[order( olympics$Age , decreasing = FALSE) , ]

##### filter ######
olympics %>%
  filter(Year == 2008)

olympics %>%
  filter(Team == "Great Britain")

olympics$Age
mean(olympics$Age)

olympics <- olympics %>%
  mutate(BMI = (olympics$Weight/olympics$Height/olympics$Height)*10000)

#summarise the means in a group
olympics %>%
  group_by(Sex) %>%
  summarise(meanage = mean(Age))
olympics %>%
  group_by(Sex) %>%
  summarise(meanage = mean(Height))
olympics %>%
  group_by(Sex) %>%
  summarise(meanage = mean(Weight))

olympics %>%#the mean ages of each team
  group_by(Team) %>%
  summarise(meanage = mean(Age))

olympics %>%
  group_by(Team,Sex) %>%#group by team and gender
  summarise(meanage = mean(Age))

olympics %>%
  group_by(Team) %>% #total number of medals won by each team
  count(Medal)

######check  Missing Values ######
x <- c(78, 8, 7, NA, NA)
is.na(x)
x <- na.omit(x)

install.packages("ggplot2")

x <- c(78, 8, 7, NA, NA)
install.packages("imputeTS")
library(imputeTS)
imputeTS::na_mean(x)
imputeTS::na_locf(x)

ggplot(data = olympics, aes(x = Height, y = Weight)) +
  geom_point(size = 2, alpha = 0.5, fill="steelblue") +
  labs(x = "Height of players",
       y = "Weight of players")

Medal_Gender <- olympics %>%
  group_by(Sex)%>%
  count(Medal)
ggplot(Medal_Gender, aes(x=Sex, y=n, fill=Medal)) +
  geom_bar(stat="identity") +
  scale_fill_grey()

### Formatting ###
ggplot(Medal_Gender, aes(x=Sex, y=n, fill=Medal)) +
  geom_bar(stat="identity") +
  ggtitle("Total Medal by Gender") +
  xlab("Gender") +
  ylab("Total Medals")

#### Changing colors ####
ggplot(Medal_Gender, aes(x=Sex, y=n, fill=Medal)) +
  geom_bar(stat="identity") +
  ggtitle("Total Medal by Gender") +
  xlab("Gender") +
  ylab("Total Medals")+
  scale_fill_manual(values=c("gold4","gold1","gray70"))

## Medals by each country ###
Medal_team <- olympics %>% 
  group_by(Team)%>% 
  count(Medal)


ggplot(Medal_team, aes(x=Team, y=n, fill=Medal)) + 
  geom_bar(stat="identity") +
  ggtitle("Total Medals won by Countries") +
  xlab("Countries") +
  ylab("Total Medals")+
  scale_fill_manual(values=c("gold4","gold1","gray70"))

##### Facet #######
ggplot(Medal_Gender, aes(x = Sex, y = n)) +
  geom_bar(stat="identity") +
  facet_grid(cols = vars(Medal))+
  ggtitle("Total Medals by Gender") +
  xlab("Gender") +
  ylab("Total Medals")