plot4<-function(){
  #Read in data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  # massage the data
  scccoaldata <- SCC[grepl("Coal", SCC$Short.Name),]
  data <- merge(x=NEI, y=scccoaldata, by='SCC')
  dataCoalcomb <- aggregate(data$Emissions,by= list(data$year),FUN=sum )
  #plot the graph
  png("plot422.png")
  plot(dataCoalcomb$Group.1,dataCoalcomb$x/10000,xlab = "Year",ylab = "Total Emission in Kilo tons",type = "l",col="black")
  title(main = "Yearly total Emission of PM2.5 ")
  dev.off()
}