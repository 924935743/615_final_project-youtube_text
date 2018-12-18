library(tm)
library(wordcloud)
library(memoise)

#join them in one data frame
shiny_us<-us_tag_split %>%  group_by(tags)%>% mutate(n=1) %>% mutate(N=sum(n)) %>% filter(N>100) %>% select(tags)
shiny_ca<-ca_tag_split %>%  group_by(tags)%>% mutate(n=1) %>% mutate(N=sum(n)) %>% filter(N>100) %>% select(tags)
shiny_gb<-gb_tag_split  %>%  group_by(tags)%>% mutate(n=1) %>% mutate(N=sum(n)) %>% filter(N>100) %>% select(tags)
shiny_in<-in_tag_split  %>%  group_by(tags)%>% mutate(n=1) %>% mutate(N=sum(n)) %>% filter(N>100) %>% select(tags)

tags<-rbind(shiny_us,shiny_ca,shiny_in,shiny_gb)


# The list of countries
tag_countries <<- list( "US"=shiny_us,
                        "CA"= shiny_ca ,
                        "IN"=  shiny_in ,
                        "GB"=  shiny_gb)

# Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(country) {
   if (!(country %in% names(tag_countries)))
    stop("Unknown country")
  
  text <- tag_countries[country]
  
  
  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  
    myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
})



