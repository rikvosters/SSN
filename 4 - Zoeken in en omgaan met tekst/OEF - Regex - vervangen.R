## Oefening: Regex (vervangen)

# 1. Laad onderstaand stukje van een IRC-chatconversatie in als minicorpus. Schrijf een zoek- en vervangopdracht om in elke regel van je minicorpus de chatnamen tussen vishaakjes aan het begin van elke regel te verwijderen.

minicorpus <- c("<demo_cor> is er nog iemand die plots zo een goesting heeft om zijne pc door het raam te smijten", "<demo_cor> :o))", "<demo_cor> niemand dus", "<DaP> Gore sukkels!", "<lotje> hiii dappy!!1 *kiss**kiss*", "<Daily> Chipske zit ook op de just mannen!!!", "<DeepStar> hmm")
minicorpus

minicorpus_anon <- gsub("<.*> ", "", minicorpus, perl=T)
minicorpus_anon


# 2. Laad onderstaand fragment in van een corpus met gerechtelijke documenten. Om de anonimiteit van de betrokkenen te garanderen, moet je hun namen vervangen door de juiste initialen. Je mag ervan uitgaan dat (enkel) namen steeds bestaan uit de combinatie van een voornaam (= één woord met hoofdletter) en een achternaam (= eveneens één woord met hoofdletter).

politierapport <- c("De heer Philip Devaleriola, die den nacht van den zes en twintigsten den zeven en twintigsten april in de fabrijk niet doorgebragt had, op zijnen beurt ondervraagd zijnde, verklaarde dat hij bij zijne vrouw was gaan slapen, in het huis van juffrouw Johanna Roberti alhier te Brussel. Maar de juffrouw Johanna Roberti en Catharina Vanginderachter hare winkel dochter, gaven aan de Kommissaris van Policie ten antwoord, dat hij dezen nacht bij zijne vrouw geenszins doorgebragt had.")
politierapport

politierapport_anon <- gsub("([A-Z])[a-z]{2,} ([A-Z])[a-z]{2,}", "\\1.\\2.", politierapport, perl=T)
politierapport_anon
