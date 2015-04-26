plot1<-function(){
  
  #Read in data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  # massage the data
  data <- aggregate(NEI$Emissions,by= list(NEI$year),FUN=sum )
  #plot the graph
  png("plot1.png")
  plot(data$Group.1,data$x/1000000,xlab = "Year",ylab = "Total Emission",type = "l",col="black")
  title(main = "Yearly total Emission of PM2.5 in Megaton")
  dev.off()
}