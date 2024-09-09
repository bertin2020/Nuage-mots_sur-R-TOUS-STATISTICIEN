#@author: Bertin2020
# Responsable à TOUS STATISTICIEN

####################################################################################
## ANALYSE TEXTUELLE OU TEXMINING AVEC R TOUS STATISTICIEN 2024                                                                 ##
####################################################################################

# installation des packages nécessaires
install.packages("quanteda")
install.packages("quanteda.textplots")
install.packages("quanteda.textstats")
install.packages("dplyr")
install.packages("tydiverse")
install.packages("tidytext")
install.packages("wordcloud")
install.packages("ggplot2")
install.packages("quanteda")
install.packages("lubridate")
install.packages("textplot")
install.packages("RColorBrewer")
install.packages("igraph")
install.packages("treemap")
install.packages("ggraph")
install.packages("tweenr")
install.packages("pdftools")
install.packages("readr")


# chargement des packages
library(quanteda)
library(quanteda.textplots)
library(quanteda.textstats)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(tidytext)
library(wordcloud)
library(RColorBrewer)
library(textplot)
library(quanteda)
library(lubridate)
library(igraph)
library(readr)
library(readtext)
library(tm)
library(treemap)
library(quanteda.textmodels)
library(ggraph)
library(tweenr)
library(pdftools)
library(tidyr)




# Le nuage de mots-clés permet de mettre en exergue les principaux mots-clés d'un texte. 
# Vous disposez ainsi d'une vue d'ensemble. Les mots s'affichent en plus grands caractères en fonction de leur répétition
#En anglais : tag cloud, word cloud ou keyword cloud.
#getwd()

discours_BOURASSA_1910 = readtext("D:/TOUS STATISTICIEN/2024/2024 FORMATION/R/TOUS STATISTICIEN_Text_Mining/TOUS_STATISTICIEN_WEBINAIRE_TEXT_MINING/discours_BOURASSA_1910.txt")
View(discours_BOURASSA_1910)

discours_BOURASSA_1910 <- readtext("D:/TOUS STATISTICIEN/2024/2024 FORMATION/R/TOUS STATISTICIEN_Text_Mining/TOUS_STATISTICIEN_WEBINAIRE_TEXT_MINING/discours_BOURASSA_1910.txt")
view(discours_BOURASSA_1910) 

Corpus_discours = corpus(discours_BOURASSA_1910)
Corpus_discours
corpus_discours_sans_ponctuation=tokens(Corpus_discours, what="word", remove_numbers = TRUE, remove_punct = TRUE)
corpus_discours_sans_ponctuation
corpus_discours_sans_ponctuation<- tokens_remove(corpus_discours_sans_ponctuation, stopwords("french"),padding = FALSE)
motsEnleves=c("applaudissements","acclamations","plus", "où", "celui", "a", "n'a", "si")
corpus_discours_sans_certains_mots<- tokens_remove(corpus_discours_sans_ponctuation, motsEnleves, padding = FALSE)
corpus_discours_sans_certains_mots=dfm( corpus_discours_sans_certains_mots)
mesfrequences <- textstat_frequency(corpus_discours_sans_certains_mots) # frequence des mots
mesfrequences # avec ggplot2 on fait un diagramme à barre 

#x11()
textplot_wordcloud(corpus_discours_sans_certains_mots, color = c('black', 'orange', 'blue'))
#TreeMap