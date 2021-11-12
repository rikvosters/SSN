## Oefening: Regex (Conscience)

# Voor deze oefening werken we met de eerste drie hoofdstukken uit Hendrik Consciences _In 't wonderjaer_ (1837).
# 1. Stel je werkmap in, en zorg dat het bestand "Conscience 1837 - In t wonderjaer.txt" in die werkmap staat.
# 2. Laad vervolgens ook het Conscience-bestand als tekstvector in aan de hand van het onderstaande 'scan()'-commando, zodat je elk apart woord als 1 element in een tekstvector krijgt.
# scan("Conscience 1837 - In t wonderjaer.txt", what=character(0), encoding ="UTF-8")
# 3. Converteer alle woorden naar kleine letters.
# 4. Verwijder alle leestekens (niet-woordtekens) uit de woordenlijst.
# 5. Ga met de functie 'grep()' na hoe vaak de woorden 'geus'/'geuzen' en hoe vaak de woorden 'spaenjaerd'/'spaenjaerden' voorkomen in dit corpus.
# 6. Zoek eveneens op welke woorden op het suffix '-heid' eindigen, en ga na welke woorden met dat suffix meer dan 3 keer in het corpus voorkomen. Hou rekening met mogelijke spellingvarianten als '-heid', '-heyd' en '-heyt'.
# 7. Zoek tot slot op welke woorden op een 'l' of een 'n' plus het suffix '-aer' eindigen, maar neem ook mogelijke meervoudsvormen (-s/-en) in beschouwing. Extraheer vervolgens uit die meervoudsvormen de vorm van het (enkelvoudige) grondwoord (i.e. zonder suffix '-aer'), en ga na welke van deze grondwoorden twee of meer keer in het corpus voorkomen.

# 1. werkmap
setwd("~/Dropbox/@ Documenten/Colleges - courses/Synchronische studie/HOC/4 - Zoeken in en omgaan met tekst/") # CTRL + SHIFT + H

# 2. Conscience-bestand inladen
wonder <- scan("Conscience 1837 - In t wonderjaer.txt", what=character(0), encoding ="UTF-8")

# 3. lower case
wonder <- tolower(wonder)

# 4. interpunctie weghalen
wonder <- gsub("\\W+", "", wonder, perl=T)

# 5. geuzen/spaenjaerden
geus <- grep("^geu(s|zen)$", wonder, value=T); geus
length(geus)
spaenjaerd <- grep("^spaenjaerd(en)?$", wonder, value=T); spaenjaerd
length(spaenjaerd)

# alternatief:
length(wonder[wonder=="geuzen"|wonder=="geus"])
length(wonder[wonder=="spaenjaerden"|wonder=="spaenjaerd"])

# 6. -heid/-heyd/-heyt
heid <- grep("\\b\\w*?he[iy][dt]\\b", wonder, value=T); heid
sort(table(heid))

# 7. -naer/-laer
aar <- grep("\\b\\w{3,}[nl]ae?r(en|s)?\\b", wonder, value=T); aar
grondwoord <- gsub("\\b(\\w{3,}[nl])ae?r(en|s)?\\b", "\\1", aar, perl=T); grondwoord
sort(table(grondwoord)) # bedel-, luisbekel-, minn-, reden-, kunsten-

