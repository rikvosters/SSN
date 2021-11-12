## Oefening: Exact matches (Gorter)

# Voor deze oefening gaan we het gebruik van het lidwoord 'den' na in Herman Gorters meesterwerk 'Mei' (1889).

# A.
# 1. Stel je werkmap in, en zorg dat het bestand "Gorter (1889) - Mei.txt" in die werkmap staat.
# 2. Laad de functie exact.matches() in.
# 3. Laad vervolgens ook het Gorter-bestand als tekstvector in aan de hand van het onderstaande 'scan()'-commando.
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

# 1. werkmap instellen
setwd("~/Dropbox/@ Documenten/Colleges - courses/Synchronische studie/HOC/4 - Zoeken in en omgaan met tekst/") # CTRL + SHIFT + H

# 2. exact.matches() inladen
source("exact_matches.r")

# 3. Gorter-bestand inladen
gorter <- scan("Gorter (1889) - Mei.txt", what=character(0), sep="\n", fileEncoding ="UTF-8")

# 4. lower case
gorter <- tolower(gorter)

# 5. den
den <- exact.matches("\\bden \\w{2,}\\b", gorter)[[1]]
den

# 6. verwijder lidwoorden
types <- gsub("\\bden (\\w{2,})\\b", "\\1", den, perl=T)
types

# 7. frequentietabel types
sort(table(types))

# 8. anlaut
anlaut <- gsub("\\b(\\w)\\w{1,}\\b", "\\1", types, perl=T)
anlaut
sort(table(anlaut))

# 9. voltooide deelwoorden
vd <- exact.matches("\\bge\\w{2,}[dt]\\b", gorter)[[1]]
vd

# 10. d/t
vd_t <- grep("t$", vd)
vd_d <- grep("d$", vd)
length(vd_t)/length(vd_d) # proportie