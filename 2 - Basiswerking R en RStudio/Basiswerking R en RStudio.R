##################################################
##                                              ##
##   SYNCHRONISCHE STUDIE VAN HET NEDERLANDS    ##
##                                              ##
##################################################

#### INLEIDING R en RSTUDIO ####

### RStudio interface -----

# Schrijf commando's in het script...

print("hello world")

# ...en stuur ze naar de console met CMD+ ENTER (Mac)
#                                  CTRL+ ENTER (Windows)

print("hello world")

### Basiswerking R -----

# rekenkundige commando's

2+7
2*7
2 + 7  # commando's niet spatie-gevoelig
2+7 # opmerkingen staan na het kardinaalsteken

2+7 # +100
2+7   +100

# opmerkingen zijn nuttig om je eigen code van commentaar te voorzien, als tussentiteltjes, en om aantekeningen toe te voegen bij een voorbeeldscript

### Elementen definiëren -----

# Aan de hand van de operator <- kan je één of meerdere waardes aan een element toekennen

a <- 2+7  # een waarde aan een element toekennen
          # cf. het 'Environment'-venster
a         # het zonet gedefinieerde element oproepen

a = 2+7  # idem

# De elementen die je op deze manier hebt gedefinieerd kan je nadien uiteraard ook gebruiken in verdere bewerkingen:

a - 3
a

# Maar ook complexer: kan je raden wat de output van de onderstaande bewerking zal zijn?

10*a+(1/3*a)

# Tot slot kan je ook een bestaande waarde overschrijven:

a <- a - 3  # element a overschrijven met de waarde van element a - 3
a           # het nieuw gedefinieerde element a oproepen

A # wel hoofdlettergevoelig


### Een basisfunctie: combine -----

c(1, 3, 5) # combineer de getallen 1, 3 en 5

b <- c(2, 4, 6)  # een reeks van elementen definiëren (= vector)
                 # functie combine: c()
b


a <- 2 + 7         # definieer a
b <- c(2, 4, 6)    # definieer b
a+b                # tel a en b bij elkaar op

x <- c(a, b)       # voeg a en b samen met de functie c(),
                   # en wijs toe aan nieuwe vector x

x                  # roep deze nieuwe vector x op




# Nu je met c() weet wat een functie is, kan je ook met andere functies experimenteren. Kan je op basis van de output raden wat de onderstaande frequente functies doen?

c <- c(9, 2, 4, 6, 5)
c
mean(c)
median(c)
min(b)
max(b)

# Sommige functies leveren een grafische output op, die in het 'Plots'-venster in voorvertoning wordt weergegeven. Kan je onderstaande grafiek lezen?

d <- c(2, 2.5, 3, 4, 6, 8, 10, 12, 13, 13.5, 14) # let op: Amerikaanse wijze van decimaalnotatie
plot(d)

# Functies kunnen ook binnen functies worden ingebed -- bijvoorbeeld:

plot(c(d, b)) # de ‘combine'-functie ingebed in de 'plot'-functie

# Een functie kan bovendien ook over meerdere regels worden gespreid:

plot(
  c)

# In dat geval kan je ofwel de verschillende regels selecteren waarover de code is uitgespreid en dan de sneltoets `CTRL/CMD` + `enter` ingeven, ofwel kan je de regels één voor één met de sneltoets ingeven. In dat laatste geval, wanneer je de code regel per regel invoert, zal de _R_-console een `+`-teken weergeven om aan te geven dat er nog code dient te volgen, o.a. omdat het programma weet dat een geopend haakje steeds verderop gevolgd moet worden door een gesloten haakje. (Om die vraag naar het vervolg van de code af te breken, druk je op `escape`). Als je de code direct met meerdere regels tegelijk ingeeft, behandelt R de code net alsof ze op één regel zou staan.

# Een regeleinde of nieuwe regel kan je overigens ook weergeven als `;` (puntkomma). De code...

vector <- c(0, 5, 10, 15)
vector

# ...is dus in de praktijk identiek aan:

vector <- c(0, 5, 10, 15); vector

# De typische structuur van een functie is als volgt:

function(x, y, option=FALSE)

# Als je hulp of meer uitleg over een functie nodig hebt, kan je de naam van de functie ingeven, voorafgegaan door een `?`. In het 'Help'-venster kan je vervolgens de officiële en meestal erg uitgebreide R-documentatie raadplegen. Probeer zelf eens:

?plot() # cf. 'Help'-venster
?max()
?c()

### Enkele voorbereidende handelingen -----


## werkruimte leegmaken (clear working space)

# Voor we aan de slag gaan met nieuwe data, is het vaak goed om de werkruimte met eerder opgeslagen elementen leeg te maken (= clear working space). Dit kan via de `clear all`-knop in het 'Environment'-venster van RStudio, maar kan binnen R zelf ook als volgt:

rm(list=ls(all=TRUE)) # cf. 'Environment'-venster


## Werkmap instellen

# Methode 1: 'point and click'

# De 'working directory' kan worden ingesteld via het 'Session'-menu in RStudio. Dit werkt voor alle besturingssystemen. Je klikt in de werkbalk achtereenvolgens op: Session > Set working directory > Choose directory. Vervolgens moet je in het venster dat geopend wordt navigeren naar de locatie van je werkmap op jouw computer, en je keuze bevestigen door op 'Open' te klikken.

# Het keuzevenster kan ook geopend worden met de sneltoets: CTRL + shift + H

# Methode 2: code

# Naast de klikmethode hieroven kan je ook gewoon de locatie van de 'working directory' handmatig ingeven binnen de functie `setwd()`.

# Voor mijn werkmap (Mac) ziet dat er bijvoorbeeld als volgt uit:

setwd("/Users/rikvosters/Dropbox/@ Documenten/Colleges - courses/Synchronische studie/HOC/2 - Basiswerking R en RStudio/")

# Op een Windows-computer kan dat er bijvoorbeeld als volgt uitzien:

setwd("C:/Users/rikvosters/Desktop/2 - Basiswerking R en RStudio/")

# Nagaan wat de huidige 'working directory' is:
getwd()

### Werken met pakketten -----


# installeren (eenmalig)
install.packages("tidyverse")

# alternatieve mogelijkheid:
    # Packages > Install Packages | Tools > Install Packages
    # Selecteer een CRAN Mirror (best: Austria)
    # Selecteer een pakket of zoek op pakketnaam

# inladen (bij elke sessie / aan het begin van elk script)
library(tidyverse)

# alternatieve mogelijkheid:
    # 'Packages'-venster > vink gewenste pakket aan

# meer informatie over de functies binnen een specifiek pakket:
help(package=tidyverse)


# Een pakket dat we af en toe zullen gebruiken voor datamanipulatie is `dplyr`. Laad het in met de onderstaande code:

install.packages("dplyr") # eenmalig


### Oefening: basiswerking RStudio -----

# a. Maak een nieuw script aan in RStudio (`File` > `New file` > `R Script`).
# b. Geef de onderstaande informatie in het script in. Je mag kopiëren en plakken.
# c. Voeg zelf minimaal één opmerking toe aan de code, en verander het jaartal '1994' in '1995'.
# d. Voer deze code nu uit in de console, en inspecteer de output die je hebt gegenereerd: wat doet deze code precies, stap voor stap?
# e. Sla tot slot dit miniscript op in je werkmap (`File` > `Save as` > ...), zodat je het eventueel later nog kan oproepen, hergebruiken en bewerken.

  # x <- c(1975, 1980, 1985, 1990, 1994, 2000, 2005, 2010, 2015)
  # x
  # y <- c(4, 9, 17, 32, 51, 78, 90, 96, 98)
  # y
  # plot(x, y, xlab="Jaar", ylab="Gebruik van constructie 'ik had zoiets van'")

