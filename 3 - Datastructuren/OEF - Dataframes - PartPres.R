## Oefening: dataframes (PartPres)

# Het databestand `PartPres.xlsx` is afkomstig van een fictieve studie naar de frequentie van Participia Presens in het geschreven taalgebruik. 35 Nederlanders werd gevraagd een formeel essay te schrijven, en onderzoekers telden hoe vaak tegenwoordige deelwoorden voorkwamen in elk werkstuk.

# 1. Laad het bestand in en bekijk de gegevens.

# 2. Merk op dat de absolute frequenties in de kolom `Frequentie` je niet veel zeggen, aangezien ze niet zijn gecorrigeerd voor de lengte van de geschreven teksten. Maak daarom een extra kolom in het dataframe met de genormaliseerde frequenties van de Participia Presens per respondent (per 10.000 woorden). De genormaliseerde frequenties per 10.000 woorden kan je berekenen door de ruwe frequenties per respondent te delen door het aantal woorden per respondent, en dat getal te vermenigvuldigen met 10.000. Rond af op twee getallen na de komma.

# 3. Ga na of alle respondenten slechts eenmaal in de lijst voorkomen, en zorg ervoor dat R hun namen volledig in hoofdletters weergeeft.

# 4. Een voorwaarde om aan de studie deel te nemen was dat de respondenten op het moment van de studie (in 2015) meerderjarig waren. Ga na of er minderjarige respondenten in je dataset zitten, en maak zo nodig een nieuwe dataset op basis van je bestaande data maar met enkel de respondenten in of vóór 1997 geboren zijn. (Tip: met de functie str() (zie later) kan je beide dataframes inspecteren en vergelijken. Hetzelfde kan ook via het 'Environment'-venster.)

# 5. Gebruik de functie `plot()` om te zien of er een verband is tussen het geboortejaar van de respondent en het (genormaliseerde) gebruik van PartPres-constructies in het schriftelijke taalgebruik. De functie `plot()` neemt dan al eerste argument de kolom met de genormaliseerde frequenties, en als tweede argument de kolom met de geboortejaren. Wat vertellen deze resultaten je?

## Oplossing

# 1. inladen en bekijken
PartPres <- read.xlsx("PartPres.xlsx", sheetIndex=1)
PartPres <- read.csv("PartPres.txt", sep="\t")
PartPres

# 2. genormaliseerde frequenties berekenen
PartPres$Frequentie_norm <- round((PartPres$Frequentie/PartPres$WordCount)*10000, 2)
PartPres

# 3. kruistabel dubbele namen + namen in hoofdletters
table(PartPres$Respondent) # tabel met frequentie/voorkomen van elke respondents naam
PartPres$Respondent <- toupper(PartPres$Respondent) # namen in hoofdletters
PartPres

# 4. minderjarige respondenten
PartPres[PartPres$Geboortejaar>1997,] # minderjarige respondenten (2015-18 = geboren na 1997)
PartPres2 <- PartPres[PartPres$Geboortejaar<=1997,] # nieuwe dataset van enkel meerderjarige respondenten
PartPres2

# idem, maar iets omslachtiger (via stoplijst)
PartPres[PartPres$Geboortejaar>1997,] # minderjarige respondenten (2015-18 = geboren na 1997)
stoplijst <- c("BAREND BALTA", "BAS BANDSEMA")
PartPres2 <- PartPres[!PartPres$Respondent %in% stoplijst,]

# vergelijk
str(PartPres) # "35 obs. of  5 variables"
str(PartPres2) # "33 obs. of  5 variables" -- zo zie je dat de twee minderjarige observaties met succes uit de dataset werden verwijderd

# 5. plot
plot(PartPres2$Geboortejaar, PartPres2$Frequentie_norm)
# duidelijke correlatie: hoe jonger de respondent, hoe minder gebruik van PartPres