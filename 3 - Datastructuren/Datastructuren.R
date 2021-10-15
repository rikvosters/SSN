##################################################
##                                              ##
##   SYNCHRONISCHE STUDIE VAN HET NEDERLANDS    ##
##                                              ##
##################################################


#### DATASTRUCTUREN ####

# We hebben reeds gezien hoe diverse datapunten (bijv. frequentieaantallen, jaartallen, enz.) in een vector kunnen worden geplaatst met de `c()`-functie ('combine'). R kent diverse soorten vectoren:

# - numerieke vectoren, met reeksen getallen ('numeric vectors');
# - tekstvectoren, met reeksen tekst (letters, woorden, zinnen; 'character vectors');
# - logische vectoren, met logische TRUE- en FALSE-antwoorden ('logical vectors').

# Naast vectoren kent R ook dataframes, lijsten en nog enkele andere, voor ons minder belangrijke datastructuren. We behandelen de diverse mogelijkheden hieronder. Voor het inladen en doorzoeken van corpora maken we vooral gebruik van (tekst)vectoren. Voor het inladen van hele datasets, bijvoorbeeld voor statische analyse, maken we met name gebruik van dataframes.

### Numerieke vectoren: getallen -----

# We definiëren een vector met de functie `c()`:
vekkie <- c(90, 95, 100, 105, 110)

# Vervolgens roepen we de opgeslagen vector op met de gekozen naam:
vekkie

# We kunnen het soort vector nagaan met de functie `class()`:
class(vekkie) # een numerieke vector (i.e. alle elementen zijn getallen)

## Subsets selecteren: een deel van een vector oproepen -----

# Met de naam van de vector roepen we de inhoud van de hele vector op:
vekkie # roept hele vector op

# Om slechts een deel van een vector op te roepen, gebruiken we vierkante haakjes `[]`. Tussen die haakjes kunnen we getallen plaatsen, die overeenkomen met de positie van de elementen die we willen oproepen.

# We kunnen er één enkel getal in plaatsen...
vekkie[1] # roept eerste element in vector op

# ...maar ook een reeks getallen aangeduid met een minimumwaarde en een maximumwaarde, van elkaar gescheiden door een dubbele punt.
vekkie[1:3] # roept eerste drie elementen in vector op


## Enkele functies: round, sort en plot -----

# Op een vector kunnen we vervolgens allerlei bewerkingen uitvoeren. Laten we ter illustratie wat gegevens genereren. De onderstaande functie genereert een fictionele dataset met 100 woordfrequenties, bestaande uit een normaal verdeelde reeks gegevens met een gemiddelde waarde van 180 en een standaardafwijking van 40 -- let voorlopig niet op de code, maar bekijk de numerieke vector die als resultaat wordt aangemaakt.

woordfrequenties <- rnorm(100, mean=180, sd=40)
woordfrequenties

# Round

# Een eenvoudige bewerking die we op een numerieke vector kunnen uitvoeren, is `round()`. Deze functie rondt elke waarde binnen de inputvector af. De afronding gebeurt standaard zonder decimaalcijfers, maar dit kan met een optioneel argument worden aangepast. Bekijk zelf eens het resultaat:

round(woordfrequenties)
round(woordfrequenties, 2)  # optie: afronding tot op twee decimaalcijfers


# opslaan = overschrijven:
woordfrequenties <- round(woordfrequenties) # sla afgeronde woordfrequenties op (overschrijven)
woordfrequenties


# Sort

# Naast afronden is het vaak ook handig om de waardes in een numerieke vector te sorteren. Dit kan met de functie `sort()`. Standaard sorteert deze functie de waardes in de vector in stijgende grootteorde Als je je data liever in dalende orde sorteert, kan je het optionele argument `decreasing=TRUE` of `decreasing=T` toevoegen.

sort(woordfrequenties) # van klein naar groot (= standaardwaarde)
sort(woordfrequenties, decreasing=T) # optie: van groot naar klein

# Plot

# Uiteraard kunnen we de numerieke waardes uit onze vector ook visueel weergeven. Dit kan met de functie `plot()`, met als argument de naam van onze vector, eventueel gesorteerd in stijgende grootteorde. Vergelijk:

plot(woordfrequenties)
plot(sort(woordfrequenties))

# Een alternatieve manier om numerieke data weer te geven is met een histogram. Kan je op basis van de onderstaande grafiek nagaan wat een histogram precies toont?
hist(woordfrequenties)


# Varia

# Tot slot hieronder nog enkele andere nuttige functies, die later nog zullen terugkomen. Kan je op basis van de output nagaan wat de functies precies doen?

length(woordfrequenties) # aantal elementen in een vector
sum(woordfrequenties) # totale waarde van alle elementen in een vector
min(woordfrequenties) # minimale waarde in de vector
max(woordfrequenties) # maximale waarde in de vector


## Verdere subsets selecteren -----

# We zagen reeds eerder dat we subsets van een vector kunnen selecteren door de positie van het gewenste element (of van de gewenste elementen) tussen vierkante haakjes te specifiëren. Om bijvoorbeeld de eerste 10 woordfrequenties te krijgen, kunnen we de code `woordfrequenties[1:10]` gebruiken. Er zijn echter nog betere mogelijkheden om subsets op te vragen.

# Zo kan je een logische expressie tussen vierkante haakjes plaatsen -- bijvoorbeeld:

woordfrequenties[woordfrequenties>=200] # alle waardes in de vector groter of gelijk aan 200

# Volgende logische expressies zijn beschikbaar:
    #      <         kleiner dan
    #      <=        kleiner dan of gelijk aan
    #      >         groter dan
    #      >=        groter dan of gelijk aan
    #      ==        gelijk aan
    #      !=        niet gelijk aan

# Kan je bedenken wat dus het resultaat zal zijn van de onderstaande functies?
woordfrequenties[woordfrequenties != 210]
woordfrequenties[woordfrequenties >= 210]

# Uiteraard kan je deze subsets ook inpassen in andere functies.
length(woordfrequenties[woordfrequenties>200]) # hoeveel woordfrequenties in onze vector >= 200?

# Bovendien kan je logische voorwaarden combineren met de OF-operator `|`, zoals bijvoorbeeld in:
length(woordfrequenties[woordfrequenties >= 210 | woordfrequenties <=150])


### Oefening: numerieke vectoren (uren slaap) -----

# 1. Maak de werkruimte leeg.
# 2. Maak een vector aan met het (geschatte) aantal uren slaap dat je per nacht vorige week hebt gehad. Maak een schatting tot 1 cijfer na de komma (bijv. 8.5) per nacht, te beginnen bij vorige week maandag en eindigend bij afgelopen zondag (= 7 cijfers in totaal).
# 3. Bereken je gemiddelde aantal uren slaap op basis van die vector. Rond af op twee cijfers na de komma.
# 4. Bereken met een functie hoeveel nachten je minder dan 7 uur slaap hebt gehad.
# 5. Ga eveneens na in hoeveel percent van alle nachten vorige week je 8 of meer uur slaap hebt gehad.
# 6. Bereken het verschil tussen je gemiddelde aantal uren slaap in de week (= maandagnacht t.e.m. vrijdagnacht) tegenover het weekend (= zaterdagnacht en zondagnacht). Gebruik hiervoor een subset van de eerste vijf en de laatste twee elementen in je vector.



### Tekstvectoren -----

# Zoals numerieke vectoren bestaan tekstvectoren uit een reeks elementen die met de `c()`-functie aan elkaar worden geschakeld. Anders dan bij numerieke vectoren zijn die elementen bij een tekstvector echter woorden of reeksen karaktertekens. We zetten ze tussen aanhalingstekens om R duidelijk te maken dat de gegeven tekst niet als namen van opgeslagen elementen moeten worden geïnterpreteerd, maar dat we met letterlijke tekenreeksen te maken hebben.

# We maken een tekstvector die bestaat uit vijf tekstelementen, waarbij elk element één woord is:
vekkie_noam <- c("Colorless", "green", "ideas", "sleep", "furiously") # vector definiëren
vekkie_noam # vector oproepen

# We kunnen echter ook hele zinnen of stukken van zinnen als elementen in een tekstvector opslaan -- in dit geval (drie) versregels:
vekkie_hamelink <- c("Krom beest aan je trog", "Dat de lucht van gekookte aardknollen rook,", "je zag niks van mijn misdadige heldendaad.")
vekkie_hamelink

# Merk op dat je in de namen van vectoren geen spaties mag verwerken -- een underscore (`_`) is wel toegelaten.
vekkie test <- c("Aa", "Bb", "Cc")
vekkie_test <- c("Aa", "Bb", "Cc")

## Subsets en stoplijsten -----

# Het oproepen van subsets is identiek aan de methode voor numerieke vectoren.

# selecteer het eerste element uit de Hamelink-vector
vekkie_hamelink[1]

# selecteer de laatste drie elementen uit de Chomsky-vector
vekkie_noam[3:5]

# Stoplijsten

# Een extra mogelijkheid bij tekstvectoren is het gebruiken van een stoplijst. Een stoplijst is een lijst woorden die we uit ons corpus of uit onze woordenlijst willen filteren. Wanneer je bijvoorbeeld een woordenlijst met de meest frequente woorden uit een krantencorpus wil halen, wil je je waarschijnlijk liefst beperken tot de lexicale woorden. Je kan dan een stoplijst maken met alle mogelijke functiewoorden, en vertelt R vervolgens dat je een frequentielijst wil met die bewuste functiewoorden eruit gefilterd.

# Ter illustratie laden we een vector in met losse woorden uit een kort stukje tekst uit een Vlaamse kwaliteitskrant.

woordenlijst <- c("Miles", "Davis", "stierf", "bijna", "een", "kwarteeuw", "geleden", "dus", "nieuw", "werk", "verschijnt", "nog", "zelden", "Maar", "dankzij", "de", "Bootleg", "Series", "werd", "nog", "wat", "oud", "goud", "opgedolven", "We", "bespreken", "vanaag", "dit", "nieuwe", "werk", "van", "Miles", "Davis")

# We definiëren vervolgens een minimale stoplijst die bestaat uit de lidwoorden en enkele voornaamwoorden. In de praktijk is zo'n stoplijst natuurlijk langer, maar om het concept duidelijk te illustreren beperken we ons tot een korte lijst met stopwoorden.

# stoplijst definiëren
stoplijst <- c("de", "het", "een", "die", "dat", "deze")

# Tot slot gebruiken we de operator `%in%` om een subset te definiëren: het programma vergelijkt de elementen uit de vector vóór de `%in%` en geeft met een logische waarde (TRUE/FALSE) aan of ze voorkomen in de vector na de `%in%`. Met de syntaxis...

woordenlijst[woordenlijst %in% stoplijst]

# ...gaan we dus na welke elementen van de vector 'woordenlijst' voorkomen in de vector 'stoplijst'. Met onze stoplijstopzet willen we echter precies het omgekeerde: we willen net die elementen uit de vector 'stoplijst' die niet in de vector 'woordenlijst' voorkomen. Dit bereiken we door de operator `!` voor onze subsetparameters te plaatsen.

woordenlijst[!woordenlijst %in% stoplijst]

# Als we de nieuwe woordenlijst zonder stopwoorden willen opslaan, dienen we ze aan een nieuwe vector toe te kennen:
woordenlijst_zonder_stopwoorden <- woordenlijst[!woordenlijst %in% stoplijst]


## Andere nuttige functies -----

# Bij het inladen van een corpus kan het soms handig zijn om alle tekst te converteren naar kleine letters (of hoofdletters), om hoofdletterongevoelige zoekfuncties eenvoudiger te maken. Dit kan met de functies `tolower()` en `toupper()`.

tolower(vekkie_noam) # alles in kleine letters
toupper(vekkie_noam) # alles in hoofdletters

# Andere nuttige functies zijn:
nchar(vekkie_noam) # tel het aantal tekens voor elk element van een vector
substr(vekkie_noam, 1, 3) # substring: geef tekens 1 tot en met 3 van elk element uit de vector weer


## Types en tokens -----

# Het is eenvoudig om uit een lange woordenlijst alle types te extraheren. We gebruiken hiervoor de functie `unique()`: die geeft een lijst van alle unieke voorkomens. Herinner je bijvoorbeeld onze eerdere vector met de inleiding van een krantenbericht over Miles Davis: `woordenlijst`.

woordenlijst

# Die bestond uit 33 elementen -- of in dit geval: 33 tokens:
length(woordenlijst)


# Met `unique()` halen we de dubbele voorkomens eruit en houden we dus enkel de types over.
unique(woordenlijst)

# De functie `table()` produceert een kruistabel waarin alle types voorkomen, samen met hun frequentie.
table(woordenlijst)


# Je kan de types uiteraard ook op frequentie sorteren met de eerder geziene functie `sort()`.
sort(table(woordenlijst), decreasing=T)


# Tot slot nog een woordje over 'missing values', of ontbrekende waardes. Wanneer een vector of een dataset een ontbrekende waarde heeft, wordt die binnen R met `NA` gecodeerd ('not available'). Gebruik wanneer je zelf data ingeeft dus geen andere aanduidingen als `?` of `(geen)`: bij de code `NA` weet R immers dat deze onvolledige datapunten niet moeten worden meegenomen in analyses of grafieken. Als we dus een vector met ontbrekende waardes inladen, zullen we zien dat de `NA`-codes automatisch wegvallen wanneer we een kruistabel van de types in die vector maken.
konami <- c("omhoog", "omhoog", "links", NA, "links", NA, "B", "A", "start")
table(konami) # 'NA' komt niet in kruistabel voor



### Oefening: tekstvectoren (belgicismen) -----

# Hieronder vind je een selectie van woorden en uitdrukkingen die volgens het Gele boekje van De Standaard niet-standaardtalige belgicismen zijn. De eigenlijke lijst is langer, maar we beperken ons voor deze oefening tot de woorden die beginnen met de letters 'A' en 'B'.

# > "Afgevaardigd Beheerder", "Ajuin", "Alcoholieker", "Alleszins", "Ardeens", "Autostrade", "Autotaks", "Allergisch Aan", "Aftrekker", "Afkuisen", "Baxter", "Bedanking", "Bedelen", "Beenhouwer", "Begankenis", "Bekwaam Om", "Benadeligen", "Bereide Schotel", "Beschaamd", "Beteugelen", "Betoelagen", "Betonneren", "Betrachten", "Betrachting", "Betrouwen", "Bic", "Bijhuis", "Binnendoen", "Binnenkoer", "Baxter", "Botermelk", "Boerenbuiten", "Brol", "Brossen", "Buitensmijten", "Bureel"

# De opgave luidt:

# 1. Laad de woordenlijst in.
# 2. Converteer de tekst naar kleine letters.
# 3. Maak een kruistabel van de woordenlijst om te controleren of er geen woorden per abuis dubbel worden opgelijst.
# 4. Verwijder zo nodig dubbele woorden uit de lijst.
# 5. Ga vervolgens met behulp van subsetting na welk van de woorden 'beschaamd', 'bisser', 'achterpoortje', 'benadeligen' en 'boterkoek' in de lijst met afgekeurde belgicismen voorkomen.



### Dataframes -----

# Tot nu toe hebben we ons geconcentreerd op ééndimensionele datastructuren, d.w.z. vectoren. Deze bestaan uit een vlakke aaneenschakeling van losse elementen. Dat is handig wanneer we bijvoorbeeld met hele tekstcorpora aan de slag gaan: we kunnen alle woorden of zinnen uit zo'n corpus in een grote vector inladen, en die vector vervolgens doorzoeken op de linguïstische kenmerken die ons interesseren.

# De gegevens die uit een corpusonderzoek voorkomen, hebben echter vaak de vorm van een tweedimensionele datastructuur: denk aan een typisch rekenblad uit spreadsheetapplicatie zoals Microsoft Excel of OpenOffice Calc, dat bestaat uit rijen en kolommen. Zo'n rekenblad heeft de prototypische structuur van een databestand met de resultaten van een corpusonderzoek: elke rij stelt dan bijvoorbeeld één spreker of één attestatie van het gezochte woord of kenmerk voor, en elke kolom bevat de bestudeerde afhankelijke en onafhankelijke variabelen (bijvoorbeeld kenmerken die samenhangen met de spreker of met het woord). Om met deze tweedimensionele gegevens te kunnen werken maken we gebruik van dataframes. Voor we echter dieper ingaan op de werking van dataframes in R, staan we eerst kort even stil bij de mogelijkheden die we hebben om bestaande bestanden of datasets in te laden.

## Bestanden inladen -----

# Als we een reeds bestaande dataset (of om het even welk tekstbestand) willen inladen, kan dat op diverse manieren. We overlopen enkele van de mogelijkheden.

# Methode 1: Spreadsheets als tekstbestanden -----

# De meest gebruikelijke en robuste methode bestaat erin om het in te laden bestand als een tekstbestand op te maken, waarbij de diverse kolommen van elkaar gescheiden worden door een tab (in R-code: `\t`). Dit is de manier die schuilgaat achter Excel- of Calc-spreadsheets. Je kan een spreadsheetdocument rechtstreeks inladen (zie hieronder), maar veiliger is om het binnen bijv. Excel eerst op te slaan als tekstdocument. Kies in de werkblad `Bestand` > `Opslaan als...` en verander in het menu 'Indeling' de standaardindeling ('Excel-werkmap (.xlsx)') naar 'Door tabs gescheiden tekst (.txt)' (zie schermafbeelding in syllabus).

# Als je het document eenmaal als `.txt`-bestand hebt opgeslagen, kan je het in R inladen met de functie `read.csv()` gebruiken. Net zoals bij het definiëren van een vector, wijzen we het in te laden object aan een nieuw element in de workspace toe, dat we in dit geval de naam `erren` geven. Verder geven we de functie `read.csv()` ook altijd het 'separator'-argument `sep="\t"` mee: dit informeert R erover dat de tekst in de kolommen door tabs (`\t`) van elkaar gescheiden wordt.

# We laden hier als voorbeeld een fictieve dataset in over de uitspraak van de (r) bij 20 sprekers. Eerst stellen we wel de werkmap in op de locatie waarin dat bestand zich bevindt.
setwd("~/Dropbox/@ Documenten/Colleges - courses/Synchronische studie/HOC/3 - Datastructuren/")
erren <- read.csv("erren.txt", sep="\t")
erren

# In dit geval specifiëren we enkel de naam van het in te laden bestand. R gaat dit bestand in de huidige werkmap zoeken. Je kan ook documenten uit andere mappen inladen, door de locatie van het bestand expliciet uit te schrijven -- bijvoorbeeld:
read.csv("C:/Users/rikvosters/Desktop/erren.txt", sep="\t") # Windows
# of:
read.csv("~/Desktop/erren.txt", sep="\t") # Mac

# Standaard gaat de functie `read.csv()` ervan uit dat de eerste rij uit een dataframe de hoofding is, zoals hier inderdaad het geval is. Als dat niet zo is, kan je optioneel het argument `header=FALSE` of `header=F` toevoegen. Probeer zelf maar eens wat in dit geval het resultaat zou zijn.
read.csv("erren.txt", sep="\t", header=F)

# Een alternatief voor `read.csv()` is het sterk verwante `read.table()`. Als je wil weten wat precies de verschillen zijn tussen `read.csv()` en `read.table()`, kan je de documentaties van beide functies erop naslaan.
?read.table()
?read.csv()


# Methode 2: Spreadsheets rechtstreeks inladen -----

# Toch kunnen we spreadsheetbestanden ook rechtstreeks in R inladen. We maken daarvoor gebruik van het `readxl`-pakket, aangezien deze functionaliteit niet standaard in R aanwezig is. Als je het pakket voor het eerst op een computer gebruikt, moet je het (met een werkende internetverbinding) eerst even installeren met de functie `install.packages()` -- dit is echter een eenmalige handeling.
install.packages("readxl") # eenmalig - enkel de eerste keer

# Nadat het pakket geïnstalleerd is, moet je het voor gebruik steeds inladen met de functie `library()`. In tegenstelling tot het installeren van het pakket, moet je deze handeling wel iedere keer uitvoeren voordat je een functie uit het `xlsl`-pakket kan gebruiken.
library(readxl)

# Eenmaal het pakket is ingeladen, kan je de functie `read.xlsx()` gebruiken om een Excel-document uit je werkmap in te laden. 
erren2 <- read_excel("erren.xlsx") # zie ?read_excel() voor meer opties
erren2

# Deze methode is eenvoudiger dan de voorgaande methode met tekstbestanden, maar er duiken soms wel fouten in op: het kan voorvallen dat er bijvoorbeeld een extra, lege kolom vol `NA`-waardes aan het ingeladen databestand wordt toegevoegd. In dat geval is het beter om methode 1 toe te passen.

# Merk op dat deze functie de data inlaadt als 'tibble'. Dat is een (iets gebruiksvriendelijkere) variant van een dataframe, vooral gebruikt binnen Tidyverse (zie later)

# Methode 3: de importeerfunctie in RStudio -----

# RStudio biedt je eveneens een grafische interface om bestanden te importeren, waarbij je met een 'point-and-click'-aanpak diverse opties en instellingen kan aanpassen. Om hiervan gebruik te maken klik je op: `File` > `Import dataset` > `From text (Base)` (zie screenshot in syllabus) of `File` > `Import dataset` > `From Excel`. De in dit menu aanwezige opties (encoding, heading, row names, enz.) komen overeen met de optionele argumenten van de functies `read.csv` en `read_excel`. Zie de helpfunctie voor meer informatie. 


## Structuur van een dataframe -----

# Na het inladen zie je de nieuwe dataset overigens ook in het `Environment`-venster verschijnen, in dit geval onder de naam `erren`. Als je op deze naam klikt, krijg je de dataset in spreadsheetformaat te zien, en als je op het blauwe pijltje links ervan klikt, zie je diverse soorten informatie over de kolommen waaruit het dataframe `erren` is opgemaakt (in dit geval: `Spreker`, `Variant_r`, `Geslacht`, `Leeftijd` en `L1_NL`).

# Indien je na het inladen overigens nog kleine correcties aan je gegevens wil maken, kan je hiervoor de functie `fix()` gebruiken. Test zelf eens wat deze functie doet, en hoe je er nog kleine aanpassingen in je data mee kan maken.
fix(erren)

# Merk op dat de kolommen in een dataframe eigenlijk gewoon vectoren zijn: `Spreker`, `Variant_r` en `Geslacht` zijn tekstvectoren (ook wel 'factoren' genoemd), `Leeftijd` is een numerieke vector, en `L1_NL` is een logische vector (d.w.z. een vector die alleen `TRUE` of `FALSE`-waarden bevat). Een dataframe is dus een aaneenschakeling van vectoren, die weliswaar allemaal dezelfde lengte hebben: elke vector (= kolommen) bevat een eigenschap van één van de 20 sprekers (= rijen) in deze dataset.
erren

## Subsets en functies -----

# Voor het selecteren van slechts een subset van een dataframe, volgen we dezelfde logica als bij vectoren, maar werken we over twee dimensies. Tussen vierkante haken vermelden we eerst de geselecteerde rij(en), daarna de geselecteerde kolom(men): `[rij, kolom]`. Bijvoorbeeld:
erren[1,] # rij 1 van dataframe 'erren'
erren[,1] # kolom 1 van dataframe 'erren'

# Het selecteren van kolommen kan echter ook op een eenvoudigere manier, door de naam van de kolom achter de naam van het dataframe plus een dollarteken `$` te plaatsen. Bekijk bijvoorbeeld:
erren$Spreker # roept alle elementen uit de kolom 'Spreker' uit het dataframe 'erren' op
erren$Leeftijd # idem met kolom 'Leeftijd'

# Kan je voor jezelf nagaan wat met onderstaande code wordt opgeroepen?
erren[1:3,]
erren[,2:4]
erren[3:6,1:2]

# Zoals je hebt gemerkt, werkt een kolom van een dataframe precies zoals een vector. Bijgevolg kan je ook alle functies die je kan toepassen op vectoren, toepassen op kolommen van dataframes, zowel wanneer die kolom tekst bevat...
toupper(erren$Spreker)
table(erren$Variant_r)

# ...als wanneer de kolom numerieke gegevens bevat:
sort(erren$Leeftijd)
mean(erren$Leeftijd, na.rm=TRUE)

# Merk bij die laatste functie, `mean()`, overigens op dat we de een optie `na.rm=T` of `na.rm=TRUE` ('NA removal') hebben toegevoegd. Deze optie laat ons toe om een gemiddelde te berekenen, ondanks het feit dat er waardes ontbreken in de kolom 'Leeftijd'. De optie zorgt ervoor dat de ontbrekende waardes eenvoudigweg niet worden meegeteld.


# Daarnaast kan je ook meerdere kolommen gebruiken binnen functies. Als je bijvoorbeeld een tabel met de functie `table()` opvraagt van zowel de factor `erren$Variant_r` (als afhankelijke variabele) als de factor `erren$Geslacht` (als onafhankelijke variabele), krijg je een eenvoudige maar zeer nuttige kruistabel:
table(erren$Variant_r, erren$Geslacht)

# Hoewel je enkel de absolute waardes ziet, leid je hier al snel uit af dat de vrouwen net iets meer de tongpunt-r-variant gebruiken dan mannen.

# Je kan zelf ook nieuwe kolommen aan je dataframe toevoegen, bijvoorbeeld door berekeningen uit te voeren op bestaande kolommen. Als je bijvoorbeeld een variabele `Geboortejaar` wil toevoegen, kan je die creëren door de kolom `Leeftijd` van het huidige jaar 2016 af te trekken:
erren$Geboortejaar <- 2016-erren$Leeftijd

# Als je nu het hele dataframe weer oproept, zie je dat er een nieuwe kolom met de zonet uitgetelde jaartallen is bijgekomen.
erren

# Uiteraard kan je op deze manier ook complexere berekeningen uitvoeren (cf. een voorbeeld in de oefeningen hieronder).


## Complexere subsets -----

# Net zoals bij vectoren kunnen we ook complexere selectiecriteria en logische operatoren gebruiken om slechts een deel van onze data weer te geven. Dat is soms handig, als je bijvoorbeeld enkel een deel van je data wil bekijken (bijv. enkel de Vlaamse data, of enkel de gegevens van de vrouwelijke respondenten, enz.). De procedure is net dezelfde als voorheen, alleen werken vullen we onze selectiecriteria in vóór de komma binnen de vierkante haakjes, omdat we op die manier aangeven dat we rijen (in plaats van kolommen) wensen te selecteren.

# Onderstaande code geeft ons bijvoorbeeld alle data van de respondenten die ouder dan 25 zijn:
erren[erren$Leeftijd > 25,] # vergeet komma niet!

# Je kan werken met dezelfde operatoren als voorheen (`<`, `<=`, `>`, `>=`, `==`, `!=`), en je kan bovendien ook meerdere selectiecriteria combineren met de `&`- en `|`-operatoren (respectievelijk de logische functies `EN` en `OF`). Ga voor jezelf even na of je kan voorspellen wat de uitkomst van onderstaande subsets is.
erren[erren$Geslacht != "vrouw",]
erren[erren$Leeftijd >= 18 & erren$Variant_r == "/r/",]
erren[erren$Geslacht == "man" & erren$Status_gecontroleerd == TRUE,]

# Als je bijvoorbeeld zou beslissen dat je alle minderjarigen uit je dataset wil verwijderen, omdat ze onbetrouwbare resultaten opleveren, kan je een 'subset'-syntaxis gebruiken en het resultaat onder een nieuw dataframe opslaan -- bijvoorbeeld:
erren_meerderjarig <- erren[erren$Leeftijd >= 18,] # sla subset op als nieuw dataframe
erren_meerderjarig # bekijk nieuw dataframe


### Oefening: dataframes (voornaamwoorden) -----

# (Oefening gebaseerd op Gries 2009)

# Laad om te beginnen het bestand `voornaamwoorden.xlsx` als dataframe `vnw` in.

# 1. Haal uit dit dataframe:
# - de waarden uit de tweede rij en vierde kolom
# - de waarden van de derde en de vierde kolom én de eerste tot vijfde rij
# - alle rijen met meervoudsvormen
# - alle rijen met objectvormen van het voornaamwoord in de derde persoon

# 2. Bekijk nu de frequenties waarmee deze voornaamwoorden in een fictief corpus voorkomen. Bereken de gemiddelde frequentie van alle voornaamwoorden als subjectvorm, en vergelijk dit met de gemiddelde frequentie van alle voornaamwoorden als objectvorm: hoe groot is het verschil tussen beide?


### Oefening: dataframes (PartPres) -----

# Het databestand `PartPres.xlsx` is afkomstig van een fictieve studie naar de frequentie van Participia Presens in het geschreven taalgebruik. 35 Nederlanders werd gevraagd een formeel essay te schrijven, en onderzoekers telden hoe vaak tegenwoordige deelwoorden voorkwamen in elk werkstuk.

# 1. Laad het bestand in en bekijk de gegevens.

# 2. Merk op dat de absolute frequenties in de kolom `Frequentie` je niet veel zeggen, aangezien ze niet zijn gecorrigeerd voor de lengte van de geschreven teksten. Maak daarom een extra kolom in het dataframe met de genormaliseerde frequenties van de Participia Presens per respondent (per 10.000 woorden). De genormaliseerde frequenties per 10.000 woorden kan je berekenen door de ruwe frequenties per respondent te delen door het aantal woorden per respondent, en dat getal te vermenigvuldigen met 10.000. Rond af op twee getallen na de komma.

# 3. Ga na of alle respondenten slechts eenmaal in de lijst voorkomen, en zorg ervoor dat R hun namen volledig in hoofdletters weergeeft.

# 4. Een voorwaarde om aan de studie deel te nemen was dat de respondenten op het moment van de studie (in 2015) meerderjarig waren. Ga na of er minderjarige respondenten in je dataset zitten, en maak zo nodig een nieuwe dataset op basis van je bestaande data, maar met enkel de respondenten die in of vóór 1997 geboren zijn. (Tip: met de functie str() (zie later) kan je beide dataframes inspecteren en vergelijken. Hetzelfde kan ook via het 'Environment'-venster.)

# 5. Gebruik de functie `plot()` om te zien of er een verband is tussen het geboortejaar van de respondent en het (genormaliseerde) gebruik van PartPres-constructies in het schriftelijke taalgebruik. De functie `plot()` neemt dan als eerste argument de kolom met de genormaliseerde frequenties, en als tweede argument de kolom met de geboortejaren. Wat vertellen deze resultaten je?


### Excursie: attach() -----

# Tot nu toe hebben we kolommen of factoren uit dataframe opgeroepen met de syntaxis `dataframe$kolom`. Er is echter nog een snellere manier om dit te doen, aan de hand van de functie `attach()`. Wanneer je de functie `attach()` eenmaal op je dataframe toepast, zijn alle kolommen uit dat dataframe als losstaand elementen onder eigen naam beschikbaar.
attach(erren)

# Nadat je dus eenmalig in je script `attach(erren)` hebt uitgevoerd, kan je de kolom Spreker gewoon oproepen met de code `Spreker`, zonder dat je steeds voluit `erren$Spreker` dient te typen. Probeer zelf maar eens.
Spreker     # idem als:
erren$Spreker

# Je kan de variabele `Spreker` en alle andere kolommen uit het dataframe `erren` nu dus ook in verkorte vorm gebruiken in allerhande functies, zoals:
table(L1_NL)
plot(Variant_r, Leeftijd)

# Nadat je klaar bent met een bepaalde dataset, is het echter altijd een goed idee om de gebruikte `attach()`-functie terug ongedaan te maken met de functie `detach()`. De functie `detach()` zorgt er dus voor dat de 'geattachte' elementen niet meer in verkorte vorm beschikbaar zijn. Als je met meerdere datasets werkt waarbij vaak dezelfde kolomnamen terugkomen, is het goed om steeds bij het wisselen van dataset `detach()` te gebruiken, om verwarring te voorkomen.
detach(erren)  # attach ongedaan maken

# Hoewel `attach()` het typwerk enigszins verlicht, zijn er ook nadelen aan verbonden. Het is soms gemakkelijk om een dataframe opnieuw te 'detachen', wat tot verwarring kan leiden als je een nieuwe dataframe inlaadt met dezelfde kolomnamen. Daarnaast moet je weten dat `attach()` _statisch_ werkt: als je na `attach()` nog een wijziging of kleine correctie aanbrengt in je originele dataframe, wordt deze wijziging niet automatisch meegenomen naar de elementen die je na `attach()` met verkorte naam kan oproepen.


### Andere soorten datastructuren -----

# De belangrijkste soorten datastructuren die we tot nu toe hebben gezien zijn (eendimensionale) vectoren en (tweedimensionale) dataframes. Er zijn echter nog andere mogelijkheden, zoals matrices, arrays en lijsten. We gaan kort in op lijsten.

# Een lijst is eigenlijk een soort dataframe waarbij niet alle kolommen of elementen dezelfde lengte moeten hebben. Een lijst kan dus diverse soorten vectoren van diverse lengtes verzamelen, en kan zelfs meerdere complete dataframes omvatten. Dat zorgt ervoor dat lijsten flexibeler zijn dan dataframes, en daardoor soms ook nuttige toepassingen hebben binnen de corpuslinguïstiek.

# Om de structuur van een lijst te illustreren, bouwen we er zelf een als voorbeeld, bestaande uit drie losse vectoren van wisselende omvang. We laden dus eerst drie aparte vectoren in:

werkwoorden <- read.csv("voorbeeldlijst-1.txt", sep="\t")
scores <- read.csv("voorbeeldlijst-2.txt", sep="\t")
namen <- read.csv("voorbeeldlijst-3.txt", sep="\t")
namen # toon als voorbeeld één van de ingeladen vectoren


# Deze drie vectoren voegen we nu samen tot een lijst:
voorbeeldlijst <- list(c(werkwoorden, scores, namen))
voorbeeldlijst # toon lijst


# We zien dat de lijst dus eigenlijk de drie samengevoegde vectoren op twee niveaus combineert. Op een eerste niveau vinden we de namen van de drie vectoren in kwestie: `$Werkwoorden`, `$Scores`, `$Familienamen`. Op een tweede niveau vinden we binnen elk van deze drie vectoren hun respectievelijke waardes: `lijken`, `wrijven`, `bezwijken`, enz. voor de vector `$Werkwoorden`; `0,128`, `0,842`, `0,857` enz. voor de vector `$Scores`; en `Peeters`, `Janssens`, `Maes`, enz. voor de vector `$Familienamen`.

# Je merkt ook op dat niet elke vector binnen de lijst evenveel elementen bevat: er zijn 24 werkwoorden, maar slechts 11 scores en 10 familienamen. In een dataframe is dit niet toegestaan: daar moet elke kolom in de structuur even lang zijn. Lijsten zijn dus iets versatieler dan dataframes, maar wel minder overzichtelijk.


### Een alternatieve aanpak: tidyverse/dplyr -----

# 'new kid on the block': tidyverse (tidyverse.org)
# populaire set van packages (dplyr, ggplot, tidyr, ... )
# sneller om mee van start te gaan, maar soms wat omslachtiger
# 'tidy' data:
#    1. elke kolom is een variabele
#    2. elke rij is een observatie

library(tidyverse)
library(babynames) # voor voorbeelden

# Enkele innovaties:

# 1. Tibbles i.p.v. dataframes
bb <- babynames
bb

# sneller en gebruiksvriendelijker; toont altijd 10 cases en enkele kolommen (niet volledig!)
# om meer te zien:
print(bb, n = 50)

# van dataframe naar tibble:
erren_tibble <- tibble(erren)
erren_tibble

# en terug
data.frame(erren)
erren

# 2. Pipe character %>%

# maak nieuwe data aan als voorbeeld
wordcounts <- rnorm(100, mean = 180, sd = 40)

# %>% zorgt voor sequentiële code, eerder dan ingebedde functies (CMD/CTRL + shift + M)

wordcounts %>%
    sort() %>%
    plot()
# idem als:
plot(sort(wordcounts))

round(mean(babynames$n))
# idem als:
babynames$n %>% # CTRL/CMD + SHIFT + M
    mean() %>%
    round()

# 3. 'Plying' data (dplyr)

# filter(): vergelijkbaar met subsets
# selecteren observaties (rijen) o.b.v. waardes

babynames %>%
    filter(name == "Dwight")

babynames %>%
    filter(name == "Dwight") %>%
    filter(sex == "M")

# vaak input voor een plot (ggplot: zie later)
babynames %>%
    filter(name == "Dwight") %>%
    filter(sex == "M") %>%
    ggplot(aes(x = year, y = prop)) +
    geom_line()

# flexibeler in gebruik (bijv. inbedding reguliere expressies, zie later)
babynames %>%
    filter(str_detect(name, "Adol")) %>%
    filter(sex == "F")

# mutate(): nieuwe variabelen (kolommen) aanmaken

babynames %>%
    mutate(prop_overall = n / sum(n))

babynames %>%
    mutate(name_gendered = paste0(name, "_", sex))

# opslaan nieuwe/aangepaste tibble:

babynames %>%
    mutate(prop_overall = n / sum(n)) -> babynames

# of:
babynames <- babynames %>%
    mutate(prop_overall = n / sum(n))

# select(): selecteer variabelen (kolommen)

babynames %>%
    select(year, sex, name)

# arrange(): sorteer / volgorde observaties (rijen)

babynames %>%
    filter(year == 1950) %>%
    arrange(name, sex)

babynames %>%
    filter(year == 1950) %>%
    arrange(desc(name), sex)

# combineer diverse dplyr-functies

# populairste jongensnaam in 1945
babynames %>%
    filter(year == 1945) %>%
    filter(sex == "M") %>%
    arrange(desc(prop))

# populariteit 'Adolf'
babynames %>%
    filter(name == "Adolf") %>%
    filter(sex == "M") %>%
    ggplot(aes(x = year, y = prop)) +
    geom_line() +
    geom_vline(xintercept = 1940, color = "red")

# tally(): telt hoeveel observaties na filter (vgl. length())

babynames %>%
    filter(str_detect(name, "Adol")) %>%
    filter(sex == "F") %>%
    select(name) %>%
    unique()

babynames %>%
    filter(str_detect(name, "Adol")) %>%
    filter(sex == "F") %>%
    select(name) %>%
    unique() %>%
    tally()


### Oefening: Oefening: shark attacks -----

# Laad de dataset over haaienaanvallen in van het internet met de read.csv-code hieronder. Bekijk de gegevens en probeer volgende vragen te beantwoorden, aan de hand van het basispakket R of met tidyverse/dplyr:
# - Hoeveel mensen zijn in 2017 gestorven na een aanval van een haai?
# - Controleer of er gedurende de tien jaar voor de film Jaws uitkwam in 1975 meer aanvallen door haaien voorkwamen in vergelijking met de tien jaar erna? 
# - Hoe oud was het oudste Australische dodelijke slachtoffer?
# - Extraheer de namen van alle Nieuw-Zeelandse slachtoffers van aanvallen door haaien in de 20ste eeuw, maar wel enkel slachtoffers jonger dan 16.
shark <- read.csv("SharkAttacks.csv", sep = "\t", quote = "")
shark <- read.csv("https://raw.githubusercontent.com/rikvosters/Basics-in-R/master/SharkAttacks.csv", sep = "\t", quote = "")
