
##################################################################
# 0. Prepare the environment.
##################################################################

# Set the Working directory
setwd("H:/Coursera/Data Scientist/Exploratory Data Analysis/week1")

# Load relevant Packages
install.packages("readr")
install.packages("dplyr")
#install.packages("data.table")
#library(data.table)
library(readr)
library(dplyr)
# Load all data
in_data<-read_delim("household_power_consumption.txt", col_names = TRUE,n_max= -1,delim = ";", col_types = c("ccnnnnnnn"), na="?") 
tbl_in_data <- tbl_df(in_data)
# table with relevant data
#relevant_data<-in_data %>%filter(Date =="1/2/2007" | Date =="2/2/2007")  
rm(in_data)
#rm(tbl_in_data)
##################################################################
# 1. Do the Plot.
##################################################################

datetime <- strptime(paste(relevant_data$Date, relevant_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480) 
 
plot(datetime, relevant_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

print("plot published")
dev.off()