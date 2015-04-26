plot6<-function(){
  #Read in data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  # massage the data
  sccvehdata <- SCC[grepl("Veh", SCC$Short.Name),]
  data <- merge(x=NEI, y=sccvehdata, by='SCC')
  #Baltimore data
  dataBal<- data[data$fips=="24510",]
  dataBal <- aggregate(dataBal$Emissions,by= list(dataBal$year),FUN=sum )
  #LA data
  dataLA<- data[data$fips=="06037",]
  dataLA <- aggregate(dataLA$Emissions,by= list(dataLA$year),FUN=sum )
  #plot the graph
  png("plot6.png")
  par(mfrow=c(2,1))
  plot(dataBal$Group.1,dataBal$x,xlab = "Year",ylab = "Total Emission in tons",type = "l",col="black")
  title(main = "Yearly total Emission of PM2.5 by vehicle in Baltimore")
  plot(dataLA$Group.1,dataLA$x,xlab = "Year",ylab = "Total Emission in tons",type = "l",col="black")
  title(main = "Yearly total Emission of PM2.5 by vehicle in LA")
  dev.off()
}