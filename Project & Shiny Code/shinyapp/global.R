library(tm)
library(wordcloud)
library(memoise)
library(readr)
library(NLP)
library(RColorBrewer)
library(devtools)
library(shiny)

#join them in one data frame
#shiny_us<-us_tag_split %>%  group_by(tags)%>% mutate(n=1) %>% mutate(N=sum(n)) %>% filter(N>100) %>% select(tags)
#shiny_ca<-ca_tag_split %>%  group_by(tags)%>% mutate(n=1) %>% mutate(N=sum(n)) %>% filter(N>100) %>% select(tags)
#shiny_gb<-gb_tag_split  %>%  group_by(tags)%>% mutate(n=1) %>% mutate(N=sum(n)) %>% filter(N>100) %>% select(tags)
#shiny_indep<-in_tag_split  %>%  group_by(tags)%>% mutate(n=1) %>% mutate(N=sum(n)) %>% filter(N>100) %>% select(tags)


#write.csv(shiny_us,file = "shiny_us.csv")
#write.csv(shiny_ca,file = "shiny_ca.csv")
#write.csv(shiny_gb,file = "shiny_gb.csv")
#write.csv(shiny_in,file = "shiny_in.csv")

shiny_us<-read_csv("shiny_us.csv")
shiny_ca<-read_csv("shiny_ca.csv")
shiny_gb<-read_csv("shiny_gb.csv")
shiny_in<-read_csv("shiny_in.csv")

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



