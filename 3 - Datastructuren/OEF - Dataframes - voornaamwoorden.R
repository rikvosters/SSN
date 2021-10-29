## Oefening: dataframes (voornaamwoorden)

# (Oefening gebaseerd op Gries 2009)
#
# Laad om te beginnen het bestand `voornaamwoorden.xlsx` als dataframe `vnw` in.
#
# 1. Haal uit dit dataframe:
# - de waarden uit de tweede rij en vierde kolom
# - de waarden van de derde en de vierde kolom én de eerste tot vijfde rij
# - alle rijen met meervoudsvormen
# - alle rijen met objectvormen van het voornaamwoord in de derde persoon
#
# 2. Bekijk nu de frequenties waarmee deze voornaamwoorden in een fictief corpus voorkomen. Bereken de gemiddelde frequentie van alle voornaamwoorden als subjectvorm, en vergelijk dit met de gemiddelde frequentie van alle voornaamwoorden als objectvorm: hoe groot is het verschil tussen beide?


## Oplossing

library(xlsx)
vnw <- read.xlsx("voornaamwoorden.xlsx", sheetIndex=1)
# alternatief
vnw <- read.csv("voornaamwoorden.txt", sep="\t")

vnw

# 1. Haal uit dataframe:

vnw[2,4] # waarden uit de tweede rij en vierde kolom
vnw[1:5,3:4] # de waarden van de derde en de vierde kolom én de eerste tot vijfde rij
vnw[vnw$Getal=="Pl",] # alle rijen met meervoudsvormen
vnw[(vnw$Persoon==3 & vnw$Vorm=="Object"),] # alle rijen met objectvormen van het voornaamwoord in de derde persoon

# 2. Bereken gemiddelde frequenties:

freq_S <- mean(vnw$Frequentie[vnw$Vorm=="Subject"]) # bereken Gem. subjectvormen en sla op als object 'freq_S'
freq_S
freq_O <- mean(vnw$Frequentie[vnw$Vorm=="Object"]) # bereken Gem. objectvormen en sla op als object 'freq_O'
freq_O
freq_S-freq_O # verschil tussen beide
