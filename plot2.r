plot2<-function(){
  #Read in data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  
  # massage the data
  data<- NEI[NEI$fips=="24510",]
  data <- aggregate(data$Emissions,by= list(data$year),FUN=sum )
  #plot the graph
  png("plot2.png")
  plot(data$Group.1,data$x,xlab = "Year",ylab = "Total Emission",type = "l",col="black")
  title(main = "Yearly total Emission of PM2.5in the Baltimore City, Maryland")
  dev.off()
}