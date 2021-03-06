
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
#tbl_in_data <- tbl_df(in_data)
# table with relevant data
relevant_data<-in_data %>%filter(Date =="1/2/2007" | Date =="2/2/2007")  
rm(in_data)
#rm(tbl_in_data)

##################################################################
# 1. Do the Plot.
##################################################################


# Initialise the png device 
png(filename="plot4.png", height=480, width=480, bg="transparent") 
 

 # Create a 2x2 split 


 par(mfrow=c(2,2)) 

 # SUBPLOT 1 - same as Plot 2 


plot(datetime, relevant_data$Global_active_power, type="l", xlab="", ylab="Global Active Power") 


 # SUBPLOT 2 - voltage vs time 
 

 plot(datetime,         relevant_data$Voltage,               type="l",               xlab="datetime",               ylab="Voltage") 
 

 # SUBPLOT 3 - same as Plot 3 
 

 # Plot the first sub-meter 
 plot(datetime, 
              relevant_data$Sub_metering_1,               type="l",               xlab="",               ylab="Energy sub metering") 
 

 # Plot the second sub-meter 
 lines(datetime,        relevant_data$Sub_metering_2, type="l",col="red") 


 # Plot the third sub-meter 
 lines(datetime, relevant_data$Sub_metering_3,       type="l",     col="blue") 


 # Add the legend 
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1),lwd=2,col=c("black","red","blue"),bty="n") 


 # SUBPLOT 4 


plot(datetime,     relevant_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 
 
 # Save the figure 
dev.off() 

print("plot published")
