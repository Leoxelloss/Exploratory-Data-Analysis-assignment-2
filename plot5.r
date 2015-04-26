plot5<-function(){
  #Read in data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  # massage the data
  sccvehdata <- SCC[grepl("Veh", SCC$Short.Name),]
  data <- merge(x=NEI, y=sccvehdata, by='SCC')
  data<- data[data$fips=="24510",]
  datavshcomb <- aggregate(data$Emissions,by= list(data$year),FUN=sum )
  #plot the graph
  png("plot5.png")
  plot(datavshcomb$Group.1,datavshcomb$x,xlab = "Year",ylab = "Total Emission in tons",type = "l",col="black")
  title(main = "Yearly total Emission of PM2.5 by vehicle in Baltimore")
  dev.off()
}