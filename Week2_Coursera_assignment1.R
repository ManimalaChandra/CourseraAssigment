pollutantmean<-function(dir,pollutant,id=1:332)
{
  setwd(dir)
  file_list<-list.files()
  my_list<-file_list[c(id)]
  
  for (file in my_list)
  {
    if(!exists("dataset"))
    {
      dataset<-read.csv(file,header=TRUE,sep=",")
    }
    if(exists("dataset"))
    {
      temp_dataset<-read.csv(file,header=TRUE,sep=",")
      dataset<-rbind(dataset,temp_dataset)
      rm(temp_dataset)
    }
  }
  data<-na.omit(dataset)
  
  if(pollutant=="sulfate") {
    sum1<-sum(data$sulfate)
    cnt1<-length(data$sulfate)
    mean1<-sum1/cnt1
    }
  if(pollutant=="nitrate") {mean(dataset$nitrate,na.rm=TRUE)}

}
