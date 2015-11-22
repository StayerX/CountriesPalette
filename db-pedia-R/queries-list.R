stop("Do not Run this file")

#Music by town # working
city<-"Leeds"
query <-paste("
  \"select ?band
where {
?band rdf:type <http://schema.org/MusicGroup>.
?band dbo:hometown dbr:",city,".
}\"",sep="")


# Capital by coutry # working
query <-paste("
\"SELECT DISTINCT ?city ?country 
WHERE { ?city rdf:type dbo:City ; 
  rdfs:label ?label ; 
  dbo:country ?country .
  ?city rdf:type dbo:capital.
}\"",sep="")


# ?country, ?capital, ?largestCity, ?pop, ?band # workign
query <-paste("\"select ?country, ?capital, ?largestCity, ?pop, ?band
where {
  ?capital rdf:type umbel-rc:Country.
  ?country dbp:capital ?capital.
  ?country dbp:largestCity ?largestCity.
  ?country dbp:populationCensus  ?pop.
  MINUS { ?country dbp:yearEnd ?end }.
  ?band rdf:type <http://schema.org/MusicGroup>.
  ?band dbo:hometown ?capital.
} ORDER BY DESC(xsd:Integer(?pop))
LIMIT 100\"",sep="")
cat(query)



# Capital by coutry # working
SELECT DISTINCT *
              WHERE {
              ?band <http://dbpedia.org/page/Noah_and_the_Whale>;
              ?city rdf:type dbo:City ; 
              rdfs:label ?label ; 
              dbo:country ?country .
              ?city rdf:type dbo:capital.
              }


select ?country, ?capital, ?largestCity, ?pop, ?band
where {
  ?country rdf:type umbel-rc:Country.
  ?country dbp:capital ?capital.
  ?country dbp:largestCity ?largestCity.
  ?country dbp:populationCensus  ?pop.
  MINUS { ?country dbp:yearEnd ?end }.
  ?band rdf:type <http://schema.org/MusicGroup>.
  ?band dbo:hometown ?capital.
  VALUES ?band {<http://dbpedia.org/page/Noah_and_the_Whale>}. 
} ORDER BY DESC(xsd:Integer(?pop))
LIMIT 100



select ?country, ?capital, ?largestCity, ?pop, ?band
where {
  ?country rdf:type umbel-rc:Country.
  ?country dbp:capital ?capital.
  ?country dbp:largestCity ?largestCity.
  ?country dbp:populationCensus  ?pop.
  MINUS { ?country dbp:yearEnd ?end }.
  ?band rdf:type <http://schema.org/MusicGroup>.
  ?band dbo:hometown ?capital.
  VALUES ?country {<http://dbpedia.org/resource/Aruba>}. 
  } ORDER BY DESC(xsd:Integer(?pop))
  LIMIT 100
  




select ?country, ?capital, ?largestCity, ?pop, ?band
where {
  ?country rdf:type umbel-rc:Country.
  ?country dbp:capital ?capital.
  ?country dbp:largestCity ?largestCity.
  ?country dbp:populationCensus  ?pop.
  MINUS { ?country dbp:yearEnd ?end }.
  ?band rdf:type <http://schema.org/MusicGroup>.
  ?band dbo:hometown ?capital.
  VALUES ?country {",df$country[countries$matching_id[countryID]],". 
} ORDER BY DESC(xsd:Integer(?pop))
LIMIT 100


# code --------------------------------------------------------------------

SELECT DISTINCT ?city ?country 
WHERE { ?city rdf:type dbpedia-owl:City ; 
  rdfs:label ?label ; 
  dbo:country ?country 
}

# code --------------------------------------------------------------------










## Later
# big cities by State by Coutry
query <-
  "select ?band
where {
?band rdf:type <http://schema.org/MusicGroup>.
?band dbo:hometown dbr:Leeds.
}"