##################################################
##                                              ##
##   SYNCHRONISCHE STUDIE VAN HET NEDERLANDS    ##
##                                              ##
##################################################

#### Tekst inladen en uitvoeren ####

### Inladen met scan() -----------------

## werkgeheugen leegmaken
rm(list=ls(all=TRUE))

## werkmap instellen
setwd("~/Dropbox/@ Documenten/Colleges - courses/Synchronische studie/HOC/4 - Zoeken in en omgaan met tekst/")
# of: CTRL + SHIFT + h

## een corpusbestand inladen

# scan(): definieer:
# 1. wat je wil scannen (= het bestand),
# 2. hoe je het wil inladen (= als een tekstvector),
# 3. hoe/waar je wil dat R een splitsing aanbrengt in het in te laden materiaal
#    (= hier bijv.: elke nieuwe regel \n wordt als 1 apart element ingeladen)
# 4. de optie quote="" (standaard gebruiken)

# hier: inladen bestand "fv400072.txt" als tekstvector, per regel (= uiting) - CGN
corpus.bestand <- scan(file="fv400072.txt", what=character(0), sep="\n", quote="")
corpus.bestand

# alternatief:
# corpus.bestand <- scan(file=choose.files(), what=character(0), sep="\n", quote="")
# Windows
# corpus.bestand <- scan(file=file.choose(), what=character(0), sep="\n", quote="")
# Mac

# zonder hoofdletters:
corpus.bestandlower <- tolower(scan(file="fv400072.txt", what=character(0), sep="\n", quote="")) # omgekeerd: toupper()
corpus.bestandlower

# encoding-problemen:
corpus.bestand <- scan(file="fv400072.txt", what=character(0), sep="\n", quote="", fileEncoding="UNICODE-1-1") # argument: fileEncoding=""
corpus.bestand
iconvlist() # all encoding-opties - probeer voor UTF-8 te gaan
# als je zelf corpus samenstelt:
# werk in goede teksteditor (Mac: Textwrangler)
#                           (Win: Notepad++)
# waarin je de codering en line breaks kan kiezen
# ==> steeds overeenstemmen

# inladen per woord:
corpus.bestand <- scan(file="fv400072.txt", what=character(0), quote="")
# argument sep="\n" weggelaten -- defaultoptie: 'white-space'
corpus.bestand


### Tekst wegschrijven -----------------

## write.table(): exporteer als .txt-bestand
#  (dat je ook kan openen met spreadsheetsoftware zoals Calc of MS Excel)
write.table(corpus.bestand, file="output_voorbeeld.txt", sep="\n")
write.table(corpus.bestand, file="output_voorbeeld.txt", sep="\n", quote=FALSE, col.names=FALSE, row.names=FALSE)
# bij frequentielijst: row.names=T (want woorden zelf = row names)

# alternatief: cat()
cat(corpus.bestand, file="output_voorbeeld2.txt", sep="\n")

#### Zoeken in en omgaan met tekst ####

### Plakken en splitten -----

## Plakken -----

# Een tekstvector die bestaat uit meerdere losse elementen kan samengevoegd worden tot één geheel met het commando `paste()`. Paste voegt alle vectoren én alle elementen binnen elke vector samen tot een geheel, gescheiden door de gekozen `collapse`-separator. De functie neemt dus als eerste argument de tekstvector waarvan de elementen moeten worden samengevoegd, en heeft als optie `collapse`. Met deze optie geef je aan hoe de samengevoegde elementen van elkaar gescheiden moeten worden. Meestal wordt hier een spatie voor gebruikt (`collapse=" "`).

# Laten we als voorbeeld een tekstvector met 15 losse elementen aanmaken:

blauwbilgorgel <- c("Mijn", "vader", "was", "een", "porgel.", "Mijn", "moeder", "was", "een", "porulan.", "Daar", "komen", "vreemde", "kinderen", "van.")

# We kunnen die 15 losse elementen dan als volgt samenvoegen tot één element:

voorbeeld <- paste(blauwbilgorgel, collapse=" ")
voorbeeld

## Split -----

# Split werkt net omgekeerd: als je vertrekt van één tekstvector met één lang element, kan je dat lange stuk tekst met de functie `strsplit()` opsplitsen in meerdere elementen. Je moet daarvoor aangeven wat als `split`-element geldt: als dat bijvoorbeeld een spatie is, zal de tekst op elk punt dat een spatie voorkomt opgesplitst worden.

# Als illustratie splitsen we de `voorbeeld`-vector uit de vorige paragraaf weer op in losse stukjes, met een spatie als als `split`-element.

voorbeeld
gesplitst_voorbeeld <- strsplit(voorbeeld, split=" ")
gesplitst_voorbeeld

# Merk wel op het resultaat van deze `strsplit`-functie een lijst is. Dat duidt erop dat je ook vectoren met meerdere elementen kan opsplitsen. Om van de lijst gewoon weer een 'platte' tekstvector te maken, gebruik je de functie `unlist`:

gesplitst_voorbeeld
unlist(gesplitst_voorbeeld)

# Op basis van zo'n tekstvector kunnen we later tabellen met woordfrequenties in een tekst of een collectie teksten aanmaken -- als voorproefje:

# als basis voor bijv. frequentielijst:
table(unlist(gesplitst_voorbeeld))

# Vergelijk het voorgaande voorbeeld nu eens met het onderstaande commando -- wat is het verschil?

strsplit(voorbeeld, "")

# Het `split`-argument is hier leeg of onbestaande: merk op dat er geen spatie tussen de aanhalingstekens staat. Dit betekent dus dat er tussen elk teken gesplitst zal worden, wat een lijst met alle karakters (letters, getallen, spaties, enz.) oplevert. Door hier met `table()` een eenvoudige frequentielijst van te maken kan je snel een handig overzicht krijgen van alle tekens die in je tekst of corpus voorkomen.

table(unlist(strsplit(voorbeeld, "")))

# Verder werkt `strsplit` ook voor vectoren die meerdere elementen omvatten. Vergelijk het voorgaande met onderstaand voorbeeld, waarbij de vector `voorbeeld2` uit drie elementen bestaat.

voorbeeld2 <- c("Mijn vader was een porgel.", "Mijn moeder was een porulan.", "Daar komen vreemde kinderen van.")
voorbeeld2 # 3 elementen

# Als we deze vector opsplitsen met een spatie als `split`-argument, krijgen we een lijst met drie ingebedde vectoren:

gesplitst_voorbeeld2 <- strsplit(voorbeeld2, " ")
gesplitst_voorbeeld2 # output: lijst met 3 vectoren

# Als we hier `unlist` op toepassen, worden alle niveau's van de lijst weer samengegooid tot één grote tekstvector:

unlist(gesplitst_voorbeeld2)

### Zoeken naar tekst: grep() -----

## De functie grep() -----

# Simpele zoekopdrachten naar tekst voeren we uit met de functie `grep()`. Deze functie neemt als eerste argument tussen aanhalingstekens de tekst waarnaar je zoekt, en als tweede argument de vector waarin je wil zoeken. Met de code `grep("zoekpatroon", tekstvector)` zoek je dus naar het woord `zoekpatroon` in de vector `tekstvector`. Als de gezochte tekst gevonden wordt, spreken we van een 'match'.

# Standaard geeft de functie `grep()` echter enkel de positie van de match in de tekstvector weer. We maken even een korte tekstvector bestaande uit 4 elementen met korte zinnen aan, om dit te illustreren.


vermaelen <- c("Goedenavond", "Wij zijn Willy en Jos Vermaelen van Vermaelens Projects", "Wij willen graag uw aandacht vestigen op een nieuw initiatief van onzentwege","Een kleine moeite voor Vermaelens Projects, betekent misschien een wereld van verschil")
vermaelen

# Als we in deze vector zoeken naar het woord 'Projects' zonder verdere specifiëring, krijgen we dus de posities van de matches:

grep("Projects", vermaelen) # positie

# Je leest dus af dat de gezochte tekst in het tweede en in het vierde element van deze tekstvector voorkomt.

# Als we niet de positie maar het element met de match zelf willen terugkrijgen, gebruiken we de optie `value=TRUE`:

grep("Projects", vermaelen, value=TRUE) # match zelf (hele element)

# Nu zie je dus dat de twee elementen waarin de zoekexpressie `Projects` (met hoofdletter) voorkomt, deze twee zinnen zijn.

# Deze functie is zonder verdere specifiëring hoofdlettergevoelig wat de gezochte tekst betreft. Dat verklaart waarom onderstaande zoekexpressie geen resultaat oplevert, terwijl we weten dat de naam `Willy` wel in de vector voorkomt:

grep("willy", vermaelen, value=TRUE) # geen resultaat (lege tekstvector)

# We kunnen als oplossing hiervoor uiteraard onze zoekexpressie aanpassen, of de gehele vector converteren naar kleine letters -- bijvoorbeeld:

grep("willy", tolower(vermaelen), value=TRUE)

# Handiger echter is om de optie `ignore.case=TRUE` van de functie `grep()` in te schakelen. Die optie zorgt ervoor dat je zoekopdracht niet meer hoofdlettergevoelig is.

grep("willy", vermaelen, value=TRUE, ignore.case=TRUE)

## Enkele beperkingen van de `grep()`-aanpak -----

# Toch is het werken met deze zoekfunctie `grep()` niet altijd ideaal voor taalkundig onderzoek.

# Eén van de beperkingen is immers dat het hele element waarin de match voorkomt, wordt weergegeven, in plaats van bijvoorbeeld enkel het gezochte element. Als je zoekt op woorden, zoals in de bovenstaande voorbeelden, is dat niet zo'n probleem. Maar als je bijvoorbeeld in dezelfde vector met de drie Vermaelen-zinnetjes zou willen zoeken op de diftong `ij`, vormt dit wel een probleem. Als je immers zoekt met:

grep("ij", vermaelen, value=TRUE)

# Krijg je de twee elementen waarin 1 of meer `ij`'s voorkomen als resultaat, in plaats van de precieze woorden en plaatsen waar die `ij` overal opduikt.

# Een tweede beperking is dat `grep()` je bij een match steeds het element van die match slechts één keer weergeeft, ook al kunnen er binnen dat element meerdere matches zijn. Dat is bijvoorbeeld het geval met onze zoekfunctie naar `ij` van zonet:

grep("ij", vermaelen, value=TRUE)

# Zoals je in de output van de console kan zien, komen in de twee zinnen uit de vector `vermaelen` meerdere `ij`'s voor. Toch komt elk element (in dit geval: elke zin) maar één keer in de output van `grep()` terug. Als we dus willen weten _hoe vaak_ de letters `ij` in onze vector voorkomen, kan `grep()` helaas geen uitsluitsel geven.

# Om aan deze beperkingen tegemoet te komen, zullen we verderop in de syllabus zien dat er specifieke zoekfuncties bestaan voor taalkundig gebruik, die eigenlijk als een uitbreiding op `grep()` kunnen worden gezien: met name de speciaal ontwikkelde functie `exact.matches()`.

## Terzijde: grepl() -----

# Een soms wel handige variant op `grep()` is `grepl()`. In plaats van de positie van de matches of elementen met de matches zelf te geven, geeft `grepl()` je een logische vector als resultaat. Eigenlijk gaat `grepl()` voor elk element in de vector in kwestie het antwoord na op de vraag: komt de ingegeven zoekexpressie in dit element van de doorzochte vector voor? Het resultaat is een logische vector, met logische `TRUE`- en `FALSE`-antwoorden op de gestelde vraag. Kijk zelf maar naar de output van deze functie:

grepl("ij", vermaelen)

# Deze functie wordt soms gebruikt om subsets te maken. Stel dat je een denkbeeldig corpus hebt ingeladen als vector `corpus`, waarbij elk element in de vector één bestand uit dat corpus is. Zoals in veel corpora, kan dit corpus in een speciale hoofding ('header') informatie over de documenten in kwestie bevatten (zogenaamde `metadata`). Zo wordt bijvoorbeeld vaak in een header het documentnummer, de plaats of de datum waarop het document werd geschreven, weergegeven -- bijvoorbeeld als:

# DOCUMENT==VL.WVL.1991.0113
# PROVINCIE==WEST-VLAANDEREN
# PLAATS==BRUGGE
# JAAR==1991

# Als zo'n hoofding in elk document van het corpus voorkomt, kan je `grepl()` gebruiken om enkel een subset van het corpus te gebruiken, die aan bepaalde voorwaarden voldoet. Die voorwaarden kan je dan in een zoekexpressie uitschrijven. Zo kan je bijvoorbeeld stellen dat je enkel wil werken met documenten uit Brugge. Je zoekexpressie zou dan `PLAATS==BRUGGE` zijn:

grepl("PLAATS=BRUGGE", corpus)

# (Het uitvoeren van deze functie zal een foutmelding geven, omdat we uiteraard geen corpus onder de naam `corpus` hebben ingeladen -- het voorbeeld is puur hypothetisch).

# Deze `grepl()`-functie is handig, omdat je ze -- zoals gezegd -- kan gebruiken om te subsetten. Daarvoor bed je ze binnen de vierkante haakjes in bij de vector, zoals we steeds subsets hebben gedefinieerd. Je zou dan iets krijgen als:

corpus[grepl("PLAATS=BRUGGE", corpus)]

# Met een dergelijke syntaxis ga je dus een subset van je corpus maken, met enkel de documenten die in Brugge werden geschreven. (Of juister: met enkel de documenten die ergens in het document of in de hoofding de tekst `PLAATS=BRUGGE` bevatten). Je kan dit uiteraard gebruiken om allerlei verschillende subsets van je corpus te maken.

### Zoeken met reguliere expressies -----

# We hebben zonet al gezien, dat we met de gewone zoekexpressies in `grep()` op enkele beperkingen stoten. We hebben ons tot nu toe echter wel beperkt tot zoekexpressies waarbij we gewoon het woord dat we zoeken in zijn geheel ingeven. Dat is niet fout, maar maakt het moeilijk om breed te gaan zoeken.

# Laten we om dit te illustreren even een vector met enkele woorden in te laden:

# > aantal, aard, aardappel, aardappelen, aardappels, aardig

vekkie <- c("aantal", "aard", "aardappel", "aardappelen", "aardappels", "aardig")

# Als we willen zoeken naar alle vormen van het lemma "aardappel", kunnen we natuurlijk manueel meerdere zoekfuncties schrijven met alle mogelijke voorkomens van "aardappel" erin:

vekkie <- c("aantal", "aard", "aardappel", "aardappelen", "aardappels", "aardig")

grep("aardappel", vekkie, value=TRUE, ignore.case=TRUE)
grep("aardappels", vekkie, value=TRUE, ignore.case=TRUE)
grep("aardappelen", vekkie, value=TRUE, ignore.case=TRUE)

# Dit is echter weinig efficiënt. Om in één zoekexpressie naar meerdere varianten van eenzelfde item te zoeken, maken we gebruik van __reguliere expressies__.

# Reguliere expressies (afgekort 'regex' of 'grep') is een soort simpele syntaxis waarmee je zoekpatronen voor tekstherkenning en tekstmanipulatie kan omschreven. Je kunt ze vergelijken met de [jokertekens](https://support.office.com/nl-nl/article/Tekst-of-andere-items-zoeken-en-vervangen-50b45f26-c4b8-4003-b9e4-315a3547f69c#bm8) waarmee je kan zoeken in o.a. Microsoft Word: als je daar zoekt op `bedr?g`, kan je zowel `bedrag` als `bedrog` als zoekresultaat terugkrijgen. Op een vergelijkbare manier laten reguliere expressies je ook toe om efficiëntere en complexere zoek- (en vervang-)opdrachten uit te voeren.

# Om in onze voorbeeldvector te zoeken naar alle vormen van het lemma "aardappel", kunnen we onderstaande reguliere expressie gebruiken:

grep("aardappel(en|s)?", vekkie, value=TRUE, ignore.case=TRUE)

# We gaan hieronder in op de manier waarop reguliere expressies worden opgebouwd, zodat je kan begrijpen waarom deze zoekexpressies alle drie de gewenste resultaten geeft. We behandelen uiteraard enkel de basis, maar met reguliere expressies kan je erg complexe zoekopdrachten uitwerken. Om je er wat verder in te verdiepen, kan je altijd terecht bij één van de vele handleidingen en tutorials die het internet rijk is.

# Aanraders zijn bijvoorbeeld:

# Roger Peng - Regular Expressions: video tutorial - https://www.youtube.com/watch?v=NvHjYOilOf8
# Roger Peng - Regular Expressions in R: video tutorial - https://www.youtube.com/watch?v=q8SzNKib5-4
# Programmeren in ASP.NET/Reguliere expressies: handleiding (NL) - https://nl.wikibooks.org/wiki/Programmeren_in_ASP.NET/Reguliere_expressies (De zoekfuncties zelf zijn in deze tutorial in de programmeeertaal ASP.NET geschreven, in plaats van in R, maar de reguliere expressies zelf zijn nagenoeg identiek)
# Gloria Li and Jenny Bryan - Regular Expression in R: handleidijng (ENG) - https://stat545-ubc.github.io/block022_regular-expression.html (vanaf het deel over 'Regular expression syntax')

# Handige overzichten met de meest gebruikte regex-uitdrukkingen vind je bijvoorbeeld op:
  # http://www.ch.embnet.org/CoursEMBnet/Pages05/slides/regexp.pdf
  # http://www.cheatography.com/davechild/cheat-sheets/regular-expressions/
  # http://www.rexegg.com/regex-quickstart.html
  # http://regexrenamer.sourceforge.net/help/regex_quickref.html

# Een uitstekend naslagwerk is:
# * Goyvaerts, J., & Levithan, S. (2012). _Regular expressions cookbook_. 2nd ed. Beijing: O’Reilly.

# Ook met de ingebouwde help-functie van _R_ kan je heel wat nuttige informatie opzoeken:

?regex

## Informatie -----

# In principe staat elk teken in de regex-taal voor zichzelf. Als je dus zoekt naar `abc`, zal je enkel een element dat de letterlijke opeenvolging van de letters `abc` bevat als match krijgen.

# Toch zijn er uitzonderingen: bepaalde tekens hebben een speciale betekenis indien ze binnen een reguliere expressie worden gebruikt. Met name de volgende tekens hebben een speciale functie:      ^  [  .  $  {  *  (  \  +  )  |  ?  <  >

# Een eerste soort speciale tekens in reguliere expressies helpen bij het zoeken naar concrete informatie: ze vervangen concrete tekens of reeksen tekens waarnaar je zoekt.

# Regex             | Betekenis
# --------------------------------------------------------------------------------
# .                 | 1 willekeurig teken (behalve een nieuwe regel)
# (  |  )           | letterlijke match van één van de door `|`  gescheiden opties
# [ ]               | 1 van de tekens tussen haakjes (ev. een range, bijv. `a-z` of `0-9`)
# [^ ]              | elk teken _behalve_ 1 van de tekens tussen haakjes
# \\w               | om het even welk woordteken ('word character', i.e. letters of cijfers, idem als `[A-Za-Z0-9]`)
# \\W               | om het even welk niet-woordteken ('non-word character', i.e. alles behalve letters en cijfers)
# \\d               | om het even welk cijfer ('digit', idem als `[0-9]`)
# \\D               | om het even welk teken dat geen cijfer is ('non-digit')

# Enkele voorbeelden:

# Voorbeeld-regex   | Mogelijke matches
# ----------------------------------------------------------------------------------
# gr.t              | `grot`, `grut`, `gr t`, `gr!t`, … (maar niet: `groot`, `grt`, …)
# al(zo|dus|weer)   | `alzo`, `aldus`, `alweer` (maar niet: `al`, `alvorens`, `weeral`, …)
# [a-z]             | `a`, `b`, `c`, …, `z` (maar niet: `A`, `?`, `_`, …)
# [a-zA-z]          | `a`, `b`, `c`, …, `z`, `A`, `B`, `C`, …, `Z` 
# H[0-9]O           | `H0O`, `H1O`, `H2O`, …, `H9O` (maar niet: `HO`, `HHO`, …)
# b[^oa]s           | `bes`, `bis`, `bbs`, `b1s`, `bês`, … (maar niet: `bos`, `bas`, `bijs`, `bies`, `bs`, …)
# b[ao][ao]s        | `baas`, `boos`, `baos` en `boas` (maar niet: `bas` of `bos`)
# b\\ws             | `bes`, `bos`, `bbs`, `b1s`, `bas`, … (maar niet: `bs`, `b.s`, `b-s`, `b&s`, …)
# is\\W             | `is.`, `is!`, `is?`, `is,`, … (maar niet: `is`, `ist`, `isa`, …)
# A\\d              | `A0`, `A1`, `A2`, …, `A9` (maar niet: `AA`, `00`, `1A`, …)

## Kwantificatie -----

# Naast de vorige operatoren om naar concrete informatie te zoeken, kunnen deze tekens ook gekwantificeerd worden.

# Zonder kwantificator mag elk teken precies 1 keer voorkomen.

# Als je wil dat een bepaald teken meerdere keren voorkomt, geef je de gewenste frequentie aan met accolades `{}`. Er zijn twee mogelijkheden:

# * ofwel geef je tussen accolades het precieze aantal keren weer dat het voorgaande teken mag voorkomen: `{aantal}`;
# * ofwel geef je het minimale en het maximale aantal keren weer dat het voorgaande teken mag voorkomen: `{min, max}`.

# Als je geen minimum voor de komma opgeeft, gaat _R_ uit van `0`. Als je geen maximum na de komma opgeeft, gaat _R_ uit van oneindig.

# Je kan deze kwantificators combineren met elk letterlijk teken, maar ook met de informatietekens uit de vorige paragraaf.

# Regex-kwantificator | Betekenis
# -------------------------------------------------------------------------------
# {x}                | `x` maal het voorgaande teken
# {x,y}              | minimaal `x` en maximaal `y` maal het voorgaande teken
# {,y}               | maximaal `y` maal het voorgaande teken
# {x,}               | minimaal `x` maal het voorgaande teken

# Enkele voorbeelden:

# Voorbeeld-regex     | Mogelijke matches
# ------------------------------------------------------------------------------------
# b.s                 | `bos`, `bis`, `bus`, `bss`, … (maar niet: `boos` of `buis`)
# ba{2}s              | `baas` (maar niet: `bas`, `boos`, `bos`, …)
# b.{2}s              | `boos`, `baos`, `boas`, `buus`, `buis`, `bies` (maar niet: `bos`, `bs`, `boeis`, `bis`, …)
# a{2,4}rgh           | `aargh`, `aaargh` en `aaaargh` (maar niet: `argh` of `aaaaargh`)
# ba{,2}s             | `baas`, `bas`, `bs` (maar niet: `baaas`, `bos`, `boas`, …)
# a{2,}rgh            | `aargh`, `aaargh`, `aaaargh`, maar bijv. ook `aaaaaaaaaaaaaaaaaaaaargh`
# a{2,}rgh            | `aargh`, `aaargh`, `aaaargh`, maar bijv. ook `aaaaaaaaaaaaaaaaaaaaargh`
# \\W{2,}             | `..`, `?!`, `,.`, `, … (o.a. dubbele leestekens)
# \\d{4}              | `0000`, `0001`, `0002`, …, `9998`, `9999` (maar niet: `1`, `A000`, `001`, …)

# Er zijn drie kwantificators met een speciale betekenis:

# Regex-kwantificator | Equivalent | Betekenis
# -------------------------------------------------------------------------------
# ?                   | {0,1}      | 0 of 1 maal het voorgaande teken (= optioneel)
# +                   | {1,}       | 1 of meer maal het voorgaand teken
# *                   | {0,}       | 0 of meer maal het voorgaande teken

# Enkele voorbeelden:

# Voorbeeld-regex     | Mogelijke matches
# ---------------------------------------------------------------------------------
# zoons?              | `zoon`, `zoons` (maar niet: `zoontje`, `zoonlief`, …)
# zoo?n(en|s)?        | `zoon`, `zon`, `zoons`, `zoonen`, `zons`, `zonen` (maar niet: `zonnen`, `zone`, …)
# wo+rd               | `word`, `woord`, `wooord`, `woooord`, … (maar niet: `wrd`, `werd`, …)
# dr[uo]+m            | `drom`, `drum`, `droom`, `druum`, `droum`, `droum`, `drooum`, `drooom`, … (maar niet: `driem`, `drm`, …)
# .*                  | 'stuff':  matcht elk mogelijk teken, een onbeperkt aantal keer (= dus in principe alles)
# b.*r                | `br`, `bar`, `bier`, `boer`, `b r` en `bewonderaar`, maar bijvoorbeeld ook `brengt haar`, `boven de stad Dender`, of `b maar`.

## Oefening: regex (informatie en kwantificatie) -----

# Gebruik voor onderstaande oefeningen de functie `grep()` en test je zoekexpressie op de voorbeeldvectoren die onder de opgave staan.

# 1. Schrijf een regex waarmee je kan zoeken op de laatste vier maanden van het jaar.

enkele_maanden <- c("mei", "juni", "juli", "augustus", "september", "october", "november", "december", "beroep"); enkele_maanden

grep("--regex--", enkele_maanden, value = T)

# 2. Schrijf een regex waarmee je kan zoeken op alle mogelijke spellingvarianten van het persoonlijk voornaamwoord 'ik', waarbij de `<i>` ook als een `<j>` of een `<ij>` geschreven kan worden, en de `<k>` ook als `<ck>` (maar niet als `<c>`) kan voorkomen.

test_pronomina <- c("ik", "ick", "jk", "jck", "ijck", "Ik", "wij", "Ick", "Jk", "gij", "Jck", "Ijck", "ic"); test_pronomina

# 3. Schrijf een regex om te zoeken naar alle woorden (enkelvoud en meervoud) die uitgaan op het suffix -isme.

enkele_ismen <- c("voetbalvandalismen", "emancipatiekatholicisme", "Cruyffianisme", "schisma", "waardenfetisjisme"); enkele_ismen

# 4. Schrijf een regex waarmee je kan zoeken naar elk woord dat (in de spelling) begint met een cluster van drie of meer consonanten, gevolgd twee vocalen.

test_woorden <- c("stroop", "schaap","chloor", "schreier", "spruit", "schlemiel", "draaideur"); test_woorden

# 5. Schrijf een regex om geldige VUB-e-mailadressen van personeelsleden of studenten (lange versie) mee op te sporen.

test_mail <- c("Rik.Vosters@vub.ac.be", "anoniem1995@gmail.com", "rvosters@vub.ac.be", "Pieter.Johan.Verzele@vub.ac.be", "Willy.Spottebeen@ulb.ac.be", "lwk@vub.ac.be", "http://vub.ac.be", "LIST@vub.ac.be", "info@vub.ac.be"); test_mail

### Vervangen -----

## De functie gsub() -----

# De reguliere expressies die we tot nu toe hebben gezien, kunnen niet enkel gebruikt worden om tekst te zoeken. Ze kunnen ook gebruikt worden om tekst te vervangen. Daarvoor gebruik je niet de functie `grep()`, maar de tegenhanger `gsub()` ('global substitution'). `gsub()` neemt:

# * als eerste argument het zoekpatroon (tussen dubbele aanhalingstekens);
# * als tweede argument het vervangpatroon (eveneens tussen dubbele aanhalingstekens);
# * als derde argument de vector waarop de vervangfunctie moet worden uitgevoerd;
# * als vierde argument de verplichte optie `perl=T` ('perl-compatible regex');
# * als optioneel argument de optie `ignore.case=TRUE`.

gsub("zoekpatroon", "vervangpatroon", tekst, perl=T)
  # argument 1: waar wil je naar zoeken (= match)
  # argument 2: door wat wil je de match vervangen
  # argument 3: waarin wil je zoeken
  # argument 4: perl=T ('perl-compatible regex')
  # optioneel argument: ignore.case=TRUE

# Als we de vector `vermaelen` van eerder even terughalen, kunnen we er een eenvoudige zoek- en vervangactie op doorvoeren, nog zonder gebruik van reguliere expressies:

vermaelen
gsub("Wij", "Zij", vermaelen, perl=T)

# Vergeet niet om de nieuwe vector met de vervangingen aan een nieuw element toe te wijzen als je hem wil bewaren:

vermaelen_2 <- gsub("Wij", "Zij", vermaelen, perl=T)
vermaelen_2

# Een mogelijke toepassing hiervan is om de gezochte matches in een vector te markeren, bijvoorbeeld door een tab-teken (in _R_-taal: `\t`) errond toe te voegen. Dat laat je later bijvoorbeeld toe om je resultaten in Excel of een andere spreadsheetapplicatie te openen, waarbij de resultaten van je zoekfunctie in een aparte kolom worden weergegeven. (Voor Excel en andere spreadsheetapplicaties geldt een tab `\t` als kolomseparatorteken).

gsub("een", "\teen\t", vermaelen, perl=T) # tabs \t rond zoekresultaat toevoegen

# Je kan uiteraard ook reguliere expressies gebruiken in gsub() -- net zoals in de meeste tekstgerelateerde functies in _R_. Een voorbeeld, waarbij elke letter `e` door een `3` wordt vervangen, en elke `i` door een `1`:

vermaelen_num <- gsub("e", "3", vermaelen, perl=T)
vermaelen_num <- gsub("i", "1", vermaelen_num, perl=T)
vermaelen_num

# Daarnaast zijn er nog extra mogelijkheden: je kan elementen uit de zoekexpressie tussen ronde haakjes plaatsen om ze te hernemen in de vervangexpressie. Je roept ze dan weer op met de code `\\1` voor de eerste opgeslagen groep (`\\2` voor de tweede opgeslagen groep, enz.).

# Regex-expressie     | Betekenis
# ------------------------------------------------------------------------------
# ( … )               | groep 1 (in zoekopdracht)
# \\1                 | groep 1 (in vervangopdracht)

# Voorbeelden:

voorbeeld <- c("wie woont daar", "wat ruist daar"); voorbeeld
gsub("w(ie|at)", "d\\1", voorbeeld, perl=T)

voorbeeld2 <- c("waarover of waaraan moest je denken?", "daarover en daaraan dacht ik"); voorbeeld2
gsub("([wd])aar(over|aan)", "\\2 \\1at", voorbeeld2, perl=T)

## Oefening: Regex (vervangen) -----

# 1. Laad onderstaand stukje van een IRC-chatconversatie in als minicorpus. Schrijf een zoek- en vervangopdracht om in elke regel van je minicorpus de chatnamen tussen vishaakjes aan het begin van elke regel te verwijderen.

minicorpus <- c("<demo_cor> is er nog iemand die plots zo een goesting heeft om zijne pc door het raam te smijten", "<demo_cor> :o))", "<demo_cor> niemand dus", "<DaP> Gore sukkels!", "<lotje> hiii dappy!!1 *kiss**kiss*", "<Daily> Chipske zit ook op de just mannen!!!", "<DeepStar> hmm")
minicorpus

# 2. Laad onderstaand fragment in van een corpus met gerechtelijke documenten. Om de anonimiteit van de betrokkenen te garanderen, moet je hun namen vervangen door de juiste initialen. Je mag ervan uitgaan dat (enkel) namen steeds bestaan uit de combinatie van een voornaam (= één woord met hoofdletter) en een achternaam (= eveneens één woord met hoofdletter).

politierapport <- c("De heer Philip Devaleriola, die den nacht van den zes en twintigsten den zeven en twintigsten april in de fabrijk niet doorgebragt had, op zijnen beurt ondervraagd zijnde, verklaarde dat hij bij zijne vrouw was gaan slapen, in het huis van juffrouw Johanna Roberti alhier te Brussel. Maar de juffrouw Johanna Roberti en Catharina Vanginderachter hare winkel dochter, gaven aan de Kommissaris van Policie ten antwoord, dat hij dezen nacht bij zijne vrouw geenszins doorgebragt had.")
politierapport

### Zoeken met reguliere expressies: geavanceerd -----

## Escape characters -----

# Zoals hierboven reeds werd aangegeven, hebben de onderstaande tekens een speciale betekenis binnen een reguliere expressie:

# > ^  [  .  $  {  *  (  \  +  )  |  ?  <  >

# Dat betekent dat, als je bijvoorbeeld naar een letterlijk voorkomen van een punt (`.`) wil zoeken, dat je deze moet laten voorafgaan voor twee schuine strepen `\\` als 'escape characters'. Zoeken naar `\\.` levert dus een eigenlijke punt als leesteken op, terwijl een zoekexpressie naar `.` om het even welk teken als match kan geven. Hetzelfde geldt voor alle andere speciale tekens: plaats er steeds `\\` voor als je naar het teken zelf wil zoeken, en niet naar de speciale betekenis die het teken binnen regex heeft.

# Het verschil wordt hieronder met een kort voorbeeld geïllustreerd:

johnson <- c("A horse that can count to ten is a remarkable horse, not a remarkable mathematician."); johnson
# vergelijk
gsub("\\.", "!", johnson, perl=T) # punt letterlijk
gsub(".", "!", johnson, perl=T) # punt als speciaal teken

# Verder zijn er nog enkele afkortingen met een speciale betekenis:

# Regex-expressie     | Betekenis
# ------------------------------------------------------------------------------
# \n                  | nieuwe regel (hard line break)
# \t                  | tab

# Standaard betekent een punt `.` als speciale operator overigens 1 willekeurig teken, behalve een nieuwe regel. Als er dus tekst wordt ingeladen met regeleindes (`\n`) erin verwerkt, kan een zoekexpressie met `.` nooit voorbij dat regeleinde zoeken. Om dat wel te kunnen, en dus over meerdere regels gespreid te kunnen zoeken, plaats je de optie `(?s)` aan het begin van je regex.

# Let wel op: elke reguliere expressie in _R_ gaat steeds zoeken binnen elk element van de opgegeven vector. Als in een element van die vector slechts een woord zit, zoekt de regex binnen dat woord. Als in een element van die vector een hele zin of een hele alinea zit, zoekt de regex binnen die zin of die alinea. Een reguliere expressie kan niet zoeken over de grenzen van elementen in een vector heen, ook niet met deze `(?s)`-optie.

## 'Greedy' en 'lazy' zoeken -----

# Normaal zijn kwantificatoren bij zoekfuncties gulzig ('greedy'). Dat betekent dat ze steeds een zo groot mogelijke match proberen te vinden. Als er dus kwantificatoren met een variabele lengte in een reguliere expressie zitten, zoals de zeer open kwantificator `*` (equivalent van `{0,}`), probeert de zoekfunctie die steeds maximaal in te vullen.

# Door achter een kwantificator een vraagteken `?` toe te voegen, wordt die kwantificator lui ('lazy'). Dat betekent dat de zoekfunctie steeds een zo kort mogelijke match probeert te vinden.

# Regex-expressie     | Betekenis
# ------------------------------------------------------------------------------
# *                   | kwantificator `*`: 'greedy'
# *?                  | kwantificator `*`: 'lazy'
# .*                  | 'greedy stuff' (elk mogelijk teken, onbeperkt aantal keer, maximale match)
# .*?                 | 'lazy stuff' (elk mogelijk teken, onbeperkt aantal keer, minimale match)

# Vergelijk de werking van de 'greedy' `.*` en 'lazy' `.*?` aan de hand van onderstaand voorbeeld:

lazygreedy <- c("A structure is a reality which is immaterial, but manifests itself materially."); lazygreedy
gsub("str.*re", "[...]", lazygreedy, perl=T) # greedy
gsub("str.*?re", "[...]", lazygreedy, perl=T) # lazy

# Je ziet hier dat in het eerste geval naar een maximale match gezocht wordt: de zoekexpressie zou op het eerste gezicht zowel `structure` als `structure is a re` kunnen opleveren, maar omdat in het eerste geval voor een 'greedy' expressie gekozen werd, wordt `structure is a re` vervangen, terwijl in het tweede geval met de 'lazy' expressie enkel `structure` wordt vervangen.

# Hetzelfde principe van een toegevoegd `?` om een kwantificator 'lazy' in plaats van 'greedy' te maken kan uiteraard ook op andere kwantificatoren worden toegepast. Vergelijk:

lazygreedy2 <- c("groeiaandeel", "groeistelsel"); lazygreedy2
gsub("[aouei]+", "X", lazygreedy2, perl=T) # greedy
gsub("[aouei]+?", "X", lazygreedy2, perl=T) # lazy

## Ankers en non-consuming matches -----

# Alle reguliere expressies die we tot nu toe hebben gezien, worden 'consuming regex' genoemd: dat betekent dat ze een teken matchen, en dat dat teken bij een vervangfunctie wordt 'opgegeten' door hetgene als vervangende tekst werd opgegeven. Er zijn echter ook regex-codes die posities in plaats van tekens als match geven. Deze codes noemen we 'ankers', of ook wel 'non-consuming regex'.

# Regex-expressie     | Betekenis
# ------------------------------------------------------------------------------
# ^                   | begin van het element
# $                   | einde van het element
# \\b                 | woordgrens

# Laten we ter illustratie een korte vector met drie zinnetjes inladen:

ankers <- c("Daar loopt Jan Janssens.", "Waar loopt Jan Janssens?", "Ik vroeg waar hij liep!")
ankers

# Om bijvoorbeeld alle voorkomens van `waar` en `daar` aan het begin van de ingeladen zinnen te vinden, kunnen we het regex-anker `^` gebruiken:

gsub("^[dw]aar", "HIER", ankers, perl=T, ignore.case=T)

# Zoals je ziet, zijn door het toedoen van het anker `^` enkel de woorden `waar` en `daar` aan het begin van de ingeladen zinnen vervangen door `HIER`, en niet het voorkomen van `waar` middenin de derde zin. Men noemt dit anker non-consuming, omdat het zelf ook niet werd vervangen: het begin van het element in de vector is uiteraard nog steeds aanwezig.

# (Let overigens op: binnen vierkante haakjes heeft `^` een andere betekenis -- zie hierboven. Buiten zo'n haakjes betekent het, zoals hier, het begin van een element).

# Voor een tweede voorbeeld proberen we in dezelfde vector de naam `Jan` te vervangen door de naam `Johan`. We willen echter dat enkel de voornaam `Jan` wordt vervangen, en niet de eerste drie letters van de familienaam `Janssens`. Dit doen we aan de hand van het woordgrensanker `\\b`:

ankers
gsub("\\bJan\\b", "Johan", ankers, perl=T)

# Ook als vectoren enkel bestaan uit losse woorden in plaats van zinnen kunnen deze expressies nuttig zijn. Bekijk zo even het onderstaande voorbeeld, waar in een vector met enkele losse testwoorden wordt gezocht om te zien of het woord `over` (als geheel woord) erin voorkomt -- zonder dat samenstellingen of afleidingen met `over-` ook een match opleveren:

enkele_losse_testwoorden <- c("over", "overdosis", "overspannen", "Over", "daarover")
grep("^over$", enkele_losse_testwoorden, value=T, ignore.case=T)
# idem:
grep("\\bover\\b", enkele_losse_testwoorden, value=T, ignore.case=T)

# Een verdere dimensie binnen reguliere expressies die we niet in het college behandelen, is '__look around__'. Met look around kan je nog geavanceerdere expressies bouwen, om zo goed als elke denkbare zoekopdracht uit te voeren. Je kan hier meer over lezen in §3.7.5 van Gries (2009).

## Oefening: regex (Conscience) -----

# Voor deze oefening werken we met de eerste drie hoofdstukken uit Hendrik Consciences _In 't wonderjaer_ (1837).

# 1. Stel je werkmap in, en zorg dat het bestand "Conscience 1837 - In t wonderjaer.txt" in die werkmap staat.
# 2. Laad vervolgens ook het Conscience-bestand als tekstvector in aan de hand van het onderstaande `scan()`-commando, zodat je elk apart woord als 1 element in een tekstvector krijgt.
# scan("Conscience 1837 - In t wonderjaer.txt", what=character(0), encoding ="UTF-8")
# 3. Converteer alle woorden naar kleine letters.
# 4. Verwijder alle leestekens (niet-woordtekens) uit de woordenlijst.
# 5. Ga met de functie `grep()` na hoe vaak de woorden `geus`/`geuzen` en hoe vaak de woorden `spaenjaerd`/`spaenjaerden` voorkomen in dit corpus.
# 6. Zoek eveneens op welke woorden op het suffix `-heid` eindigen, en ga na welke woorden met dat suffix meer dan 3 keer in het corpus voorkomen. Hou rekening met mogelijke spellingvarianten als `-heid`, `-heyd` en `-heyt`.
# 7. Zoek tot slot op welke woorden op een `l` of een `n` plus het suffix `-aer` eindigen, maar neem ook mogelijke meervoudsvormen (-s/-en) in beschouwing. Extraheer vervolgens uit die meervoudsvormen de vorm van het (enkelvoudige) grondwoord (i.e. zonder suffix `-aer`), en ga na welke van deze grondwoorden twee of meer keer in het corpus voorkomen.

### Zoeken met 'exact matches' -----

## De functie exact.matches() -----

# Zoals hierboven al werd geïllustreerd, kunnen we op concordanties zoeken met de functie `grep()`, maar dat is niet ideaal: als er bijvoorbeeld meerdere zoekresultaten binnen één element mogelijk zijn, geeft `grep()` het element in kwestie maar één keer weer.

# Daarom is er een aparte functie beschikbaar die dezelfde functionaliteit op een nog iets handigere manier uitvoert, speciaal gericht op gebruik voor (taalkundige) concordanties. Dat is de door Stefan Gries ontwikkelde functie __exact matches__: `exact.matches()`.

# Omdat het een extern beschikbare functie is, die helaas nog niet in een pakket is opgenomen, moeten we ze vóór gebruik steeds eenmalig inladen. Dit doen we met het commando `source()`: daarmee laad je een externe functie in, die niet standaard in _R_ beschikbaar is en ook niet via een pakket kan worden ingeladen.

# Je kan de functie best rechtstreeks vanuit je werkmap inladen – in dat geval hoef je enkel de naam van het in te laden exact_matches.r-bestand te vermelden:

source("exact_matches.r")

# Als het exact_matches.r-bestand niet in je werkmap staat, kan je het ook inladen door het op te slaan op een handige locatie op je computer (bijv. op het bureaublad) en het vandaar steeds inladen:
#
# source("~/Desktop/exact_matches.r") # voorbeeld Mac
# source("C:/Users/rikvosters/Desktop/exact_matches.r") # voorbeeld Windows


# Als dit is gelukt, zie je de functie opgelijst staan in het onderdeel 'Functions' van het 'Environment'-venster in _RStudio_.

# De functie zelf roepen we op met `exact.matches()`. Deze functie neemt, vergelijkbaar met `grep()`, minimaal twee argumenten:

# * een zoekexpressie, zo gewenst als reguliere expressie (tussen dubbele aanhalingstekens);
# * de vector waarin gezocht dient te worden.

corpus <- c("I don't know half of you half as well as I should like.", "And I like less than half of you half as well as you deserve.")

exact.matches("half", corpus)
# Output: lijst
# [[1]]  De matches/zoekresultaten zelf
# [[2]]  Locatie van de matches (posities)
# [[3]]  'Proportion of non-empty corpus parts with matches' (niet relevant)
# [[4]]  Matches/resultaten in context ('delimited matches')
# [[5]]  Samenvatting zoekparameters (minder relevant)
# [[6]]  Versie van de functie (minder relevant)

# De output van de functie `exact.matches()` is een lijst met zes aparte vectoren:

# * De eerste vector binnen de lijst, op te roepen als subset `[[1]]`, bevat de matches/zoekresultaten zelf;
# * De tweede vector binnen de lijst, op te roepen als subset `[[2]]`, bevat de locatie/posities van de matches in de doorzochte vector;
# * De derde vector binnen de lijst, op te roepen als subset `[[3]]`, is voor onze doeleinden niet relevant, en geeft een proportionele frequentiemaat van het gezochte item;
# * De vierde vector binnen de lijst, op te roepen als subset `[[4]]`, bevat de matches/resultaten in hun context (de zogenaamde '(tab) delimited matches' of KWIC, die een concordantieanalyse toelaten);
# * De vijfde vector binnen de lijst, op te roepen als subset `[[5]]`, bevat een samenvatting van de gebruikte zoekparameters (enkel relevant ter controle);
# * De zesde vector binnen de lijst, op te roepen als subset `[[6]]`, bevat informatie over de gebruikte versie van de functie (enkel relevant ter controle).

# In de praktijk zullen we vooral subsets [[1]] en [[4]] gebruiken. Deze vectoren binnen de lijst kunnen op twee manieren worden opgeroepen.

# 1. Ofwel sla je eerst het resultaat van `exact.matches()` op onder een aparte naam, en vraag je daarna een subset op van die opgeslagen lijst:

resultaten_half <- exact.matches("half", corpus)
resultaten_half[[1]] # matches zelf
resultaten_half[[4]] # matches in context/concordanties
# eventueel ook nog eens opslaan:
concordanties_half <- resultaten_half[[4]]
concordanties_half

# 2. Ofwel bepaal je direct bij de `exact.matches()`-functie al een subset:

exact.matches("half", corpus)[[4]]
# ev. opslaan:
concordanties_half_2 <- exact.matches("half", corpus)[[4]]
concordanties_half_2

# Optionele argumenten binnen de functie `exact.matches()` zijn:

# * `case.sens=TRUE` (hoofdlettergevoelig) of `case.sens=FALSE` (niet hoofdlettergevoelig)
# * `characters.around=50`: het aantal tekens (hier bijv. 50) vóór en na het resultaat als context (standaardinstelling: het hele element wordt als context gegeven)
# * `lines.around=0`: het aantal regels vóór en na het resultaat als context (standaardinstelling: `lines.around=0`)

# Probeer zelf deze opties eens toe te voegen en aan te passen in de `exact.matches()`-opdracht hierboven, en kijk wat het resultaat is.

# Je kan de gevonden concordanties ook exporteren naar een `.txt`-bestand dat later door een spreadsheetapplicatie zoals Excel kan worden geopend. Je gebruikt hiervoor de functie `write.table()`, met de optie om `\t` als 'separator character' te gebruiken (`sep="\t"`), evenals de optie `quote=F`.

concordanties <- exact.matches("half", corpus)[[4]]
concordanties
write.table(concordanties, file="concordanties_voorbeeld.txt", sep="\t", quote=F)

# De concordanties werden nu standaard in je werkmap ('working directory') opgeslagen, en kunnen nu ter controle in een spreadsheetapplicatie als Excel worden geopend.

## Oefening: genus -----

# 1. Laad bestand "fv800058.txt" uit het CGN regel per regel in. Stel zo nodig de werkmap in op de map waarin dit document zich bevindt.
# 2. We willen in dit (ingekorte) corpusbestand alle vrouwelijke voornaamwoorden mannelijk te maken. Hoe doe je dat met een of twee reguliere expressies?
# 3. Sla het bestand met de mannelijke pronomina op onder de naam "fv800058_masc.txt".

## Oefening: exact matches (Gorter) -----

# Voor deze oefening gaan we het gebruik van het lidwoord 'den' na in Herman Gorters meesterwerk _Mei_ (1889).

# A.
# 1. Stel je werkmap in, en zorg dat het bestand `Gorter (1889) - Mei.txt` in die werkmap staat.
# 2. Laad de functie `exact.matches()` in.
# 3. Laad vervolgens ook het Gorter-bestand als tekstvector in aan de hand van het onderstaande `scan()`-commando.
# scan("Gorter (1889) - Mei.txt", what=character(0), sep="\n", fileEncoding ="UTF-8")
# 4. Converteer de hele tekst naar kleine letters.

# B.
# 5. Extraheer uit dit corpus alle vormen van het lidwoord 'den' plus het daarop volgende woord.
# 6. Verwijder het lidwoord (en de bijhorende spatie) uit deze woordcombinaties, zodat je enkel nog de volgende woorden overhoudt.
# 7. Maak een frequentietabel van deze woorden om na te gaan welke types het meest frequent zijn.
# 8. Isoleer met een vervangfunctie steeds de eerste letter van al deze woorden, en maak daar ook een frequentietabel van, om na te gaan of het lidwoord 'den' vaker verschijnt bij woorden die met een bepaalde letter beginnen.

# C.
# 9. Probeer nu uit dit corpus alle voltooide deelwoorden te halen. Werk zelf een reguliere expressie uit die zo weinig mogelijk vals-positieve matches oplevert, ook al vang je er niet alle mogelijke voltooide deelwoorden mee.
# 10. Ga na hoeveel van die voltooide deelwoorden uitgaan op <t>, en hoeveel er uitgaan op <d>. Bereken de proportie van <t>-uitgangen ten opzichte van de <d>-uitgangen.


