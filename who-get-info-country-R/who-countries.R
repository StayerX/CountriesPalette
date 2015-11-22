library(XML)

file<-"C:\\Users\\CBLadmin\\Dropbox\\repo\\CountriesPallete\\CountriesWith3AlphaCode.txt"
countries<-read.csv(file,sep="\t",header=FALSE)
dimnames(countries)[[2]]<-list("code","name")

cleanFun <- function(htmlString) {
  return(gsub("<.*?>", "", htmlString))
}

fields<-c("Total population","Gross national income","Life expectancy","Probability of dying under"," Probability of dying between","Total expenditure on health per capita","Total expenditure on health as % of GDP")
mypattern <- '^ *(?:<.*?>)+?([^<]+)(?:<.*?>)+'
getexpr <- function(s,g)substring(s,g,g+attr(g,'match.length')-1)
for (code in countries$code){
  url<-paste("http://www.who.int/countries/",tolower(code),"/en/" ,sep="")
  thepage <- readLines(url)
  for (query in fields){
    datalines<-thepage[grep(query,thepage)+1]
    gg <- gregexpr(mypattern,datalines)
    matches <- mapply(getexpr,datalines,gg)
    result <- gsub(mypattern,'\\1',matches)
    names(result) <- NULL
    print(paste(query," : ",result))
  }
}