print('Shivam Tyagi')                                   #Print your name at the top of the script
install.packages("vcd") #                               #Install the vcd package
help(package="vcd")                                     
library(vcd)                                            #Import the vcd library
Sales_data <- c(7,11,15,20,19,11,18,10,6,22)        
Temperature_data <- c(69,81,77,84,80,97,87,70,65,90)
plot(Sales_data,Temperature_data)                       #Plot a sales ~ temp scatter plot
mean(Temperature_data)                                  #Find the mean temperature
Sales_data[-(3)]                                        #Delete the 3rd element from the sales vector
Sales_data[3]<-16                                       #Insert 16 as the 3rd element into the sales vector
Names <- c("Tom","Dick","Harry")                        #Create a vector <names> with elements Tom, Dick, Harry 
m <- matrix(1:10, nrow=5, ncol=2)                       #Create a 5 row and 2 column matrix of 10 integers
icSales <- data.frame(Sales_data,Temperature_data)      #Create a data frame <icSales> with sales and temp attributes
str(icSales)                                            #Display the data frame structure of icScales
summary(icSales)                                        #Display a summary of the icScales data frame
File = read.csv("C:\\Users\\Shivam\\Downloads\\Student.csv") #Import the dataset Student.csv
colnames(df1)                                           
colnames(File)                                          #Display only the variable names of the Student.csv dataset
