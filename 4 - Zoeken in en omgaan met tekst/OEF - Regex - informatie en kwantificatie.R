## Oefening: Regex (informatie en kwantificatie)

# Gebruik voor onderstaande oefeningen de functie `grep()` en test je zoekexpressie op de voorbeeldvectoren die onder de opgave staan.

# 1. Schrijf een regex waarmee je kan zoeken op de laatste vier maanden van het jaar.

enkele_maanden <- c("mei", "juni", "juli", "augustus", "september", "october", "november", "december", "beroep"); enkele_maanden

grep("(septem|octo|novem|decem)ber", enkele_maanden, value=T)
grep("[a-z]{4,6}ber", enkele_maanden, value=T, ignore.case=T) # alternatief
grep("\\w{4,6}ber", enkele_maanden, value=T, ignore.case=T) # alternatief
grep("\\wber", enkele_maanden, value=T, ignore.case=T) # alternatief


# 2. Schrijf een regex waarmee je kan zoeken op alle mogelijke spellingvarianten van het persoonlijk voornaamwoord 'ik', waarbij de <i> ook als een <j> of een <ij> geschreven kan worden, en de <k> ook als <ck> (maar niet als <c>) kan voorkomen.

test_pronomina <- c("ik", "ick", "jk", "jck", "ijck", "Ik", "wij", "Ick", "Jk", "gij", "Jck", "Ijck", "ic"); test_pronomina

grep("[ij]j?c?k", test_pronomina, value=T, ignore.case=T)
grep("[ij]{1,2}c?k", test_pronomina, value=T, ignore.case=T)
grep("(i|ij|j)(ck|k)", test_pronomina, value=T, ignore.case=T)


# 3. Schrijf een regex om te zoeken naar alle woorden (enkelvoud en meervoud) die uitgaan op het suffix -isme.

enkele_ismen <- c("voetbalvandalismen", "emancipatiekatholicisme", "Cruyffianisme", "schisma", "waardenfetisjisme"); enkele_ismen

grep("[a-zA-Z]{3,}isme(n|s)?", enkele_ismen, value=T, ignore.case=T)


# 4. Schrijf een regex waarmee je kan zoeken naar elk woord dat (in de spelling) begint met een cluster van drie of meer consonanten, gevolgd twee vocalen.

test_woorden <- c("stroop", "schaap","chloor", "schreier", "spruit", "schlemiel", "draaideur"); test_woorden

grep("[bcdfghjklmnpqrstvwxz]{3,}[auoeiy]{2}", test_woorden, value=T, ignore.case=T)
grep("[^aeuoiy]{3,}[auoeiy]{2}", test_woorden, value=T, ignore.case=T)

# 5. Schrijf een regex om geldige VUB-e-mailadressen van personeelsleden of studenten (lange versie) mee op te sporen.

test_mail <- c("Rik.Vosters@vub.ac.be", "anoniem1995@gmail.com", "rvosters@vub.ac.be", "Pieter.Johan.Verzele@vub.ac.be", "Willy.Spottebeen@ulb.ac.be", "lwk@vub.ac.be", "http://vub.ac.be", "LIST@vub.ac.be", "info@vub.ac.be"); test_mail

grep("[A-Z][a-z]+\\.[A-Z][a-z]+@vub\\.ac\\.be", test_mail, value=T, ignore.case=T)
