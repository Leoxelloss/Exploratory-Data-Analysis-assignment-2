plot3<-function(){
  #Read in data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  # massage the data
  data<- NEI[NEI$fips=="24510",]
  datapoint <- aggregate(data$Emissions,by= list(data$year,data$type),FUN=sum )
  #plot the graph
  png("plot3.png")
  qplot(datapoint$Group.1, datapoint$x, 
        data = datapoint, 
        color = datapoint$Group.2,
        geom = "line", 
        xlab="Year",
        ylab="Emission"
        ,main = "Total Emissions in U.S. by Type of Pollutant") +
    guides(fill=guide_legend(title="Types", reverse=TRUE))
  dev.off()
}