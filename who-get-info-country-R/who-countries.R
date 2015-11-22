###
# Libs
###
# Parsing webpage
require(XML)
# Database
require(sqldf)#for validation of connection
require(RPostgreSQL)
###
# Parameters Setup
###
# countries file # ToDo should replace with read from postgress in future
file<-"C:\\Users\\CBLadmin\\Dropbox\\repo\\CountriesPallete\\CountriesWith3AlphaCode.txt"
# DB
Connection <- list(host="localhost", user= "postgres", password="fhu8jmn3", dbname="countries_pallete",port="5432")
tableName<-"countries";
#Fields to extract
fields<-list(population="Total population",life_expectancy="Gross national income",gying_under_five="Life expectancy",dying_between_sixty="Probability of dying under","Probability of dying between",expenditure_per_capita="Total expenditure on health per capita",expenditure_as_gdp="Total expenditure on health as % of GDP")
###
# Code
###
CheckDatabase <- function(Connection) {
  options(sqldf.RPostgreSQL.user      = Connection$user, 
          sqldf.RPostgreSQL.password  = Connection$password,
          sqldf.RPostgreSQL.dbname    = Connection$dbname,
          sqldf.RPostgreSQL.host      = Connection$host, 
          sqldf.RPostgreSQL.port      = Connection$port)
  
  out <- tryCatch(
    {
      sqldf("select TRUE;")
    },
    error=function(cond) {
      out <- FALSE
    }
  )    
  return(out)
}


if (!CheckDatabase(Connection)) {
  stop("Not valid PostgreSQL connection.") 
} else {
  message("PostgreSQL connection is valid.")
}



con <- dbConnect(PostgreSQL(), host=Connection$host, user= Connection$user, password=Connection$password, dbname=Connection$dbname, port=Connection$port)

countries<-read.csv(file,sep="\t",header=FALSE)
dimnames(countries)[[2]]<-list("code","name")

cleanFun <- function(htmlString) {
  return(gsub("<.*?>", "", htmlString))
}


mypattern <- '^ *(?:<.*?>)+?([^<]+)(?:<.*?>)+'
getexpr <- function(s,g)substring(s,g,g+attr(g,'match.length')-1)



df <- data.frame(matrix(vector(),dim(countries)[1],length(fields)+2),
                stringsAsFactors=F)
dimnames(df)[[2]]<-c(names(countries),names(fields))


for (code in countries$code){
  url<-paste("http://www.who.int/countries/",tolower(code),"/en/" ,sep="")
  validPage<-TRUE
  tryCatch(thepage <- readLines(url),  error = function(e) validPage<-FALSE , finally = print("Hello"))
  extracted_vals<-list()
  if(validPage){
    for (query in names(fields)){
      
      datalines<-thepage[grep(fields[query],thepage)+1]
      print(paste(query," : ",cleanFun(datalines)))
      extracted_vals[query] <- 
    }
    df[df$code==code,]<-extracted_vals<-NULL
  }else{
    # Do Nothing
  }
}

if(dbExistsTable(con,tableName)) {dbRemoveTable(con,tableName)}
# Finally write a new table:
dbWriteTable(con,tableName, x)
