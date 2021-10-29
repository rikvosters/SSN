## Oefening: tekstvectoren (belgicismen)

# Hieronder vind je een selectie van woorden en uitdrukkingen die volgens het _Gele boekje_ van De Standaard niet-standaardtalige belgicismen zijn. De eigenlijke lijst is langer, maar we beperken ons voor deze oefening tot de woorden die beginnen met de letters 'A' en 'B'.
#
# "Afgevaardigd Beheerder", "Ajuin", "Alcoholieker", "Alleszins", "Ardeens", "Autostrade", "Autotaks", "Allergisch Aan", "Aftrekker", "Afkuisen", "Baxter", "Bedanking", "Bedelen", "Beenhouwer", "Begankenis", "Bekwaam Om", "Benadeligen", "Bereide Schotel", "Beschaamd", "Beteugelen", "Betoelagen", "Betonneren", "Betrachten", "Betrachting", "Betrouwen", "Bic", "Bijhuis", "Binnendoen", "Binnenkoer", "Baxter", "Botermelk", "Boerenbuiten", "Brol", "Brossen", "Buitensmijten", "Bureel"

# De opgave luidt:
# 1. Laad de woordenlijst in.
# 2. Converteer de tekst naar kleine letters.
# 3. Maak een kruistabel van de woordenlijst om te controleren of er geen woorden per abuis dubbel worden opgelijst.
# 4. Verwijder zo nodig dubbele woorden uit de lijst.
# 5. Ga vervolgens met behulp van subsetting na of de woorden 'beschaamd', 'bisser', 'achterpoortje', 'benadeligen' en 'boterkoek' in de lijst met afgekeurde belgicismen voorkomen.

## Oplossing

# 1. inladen
belgicismen <- c("Afgevaardigd Beheerder", "Ajuin", "Alcoholieker", "Alleszins", "Ardeens", "Autostrade", "Autotaks", "Allergisch Aan", "Aftrekker", "Afkuisen", "Baxter", "Bedanking", "Bedelen", "Beenhouwer", "Begankenis", "Bekwaam Om", "Benadeligen", "Bereide Schotel", "Beschaamd", "Beteugelen", "Betoelagen", "Betonneren", "Betrachten", "Betrachting", "Betrouwen", "Bic", "Bijhuis", "Binnendoen", "Binnenkoer", "Baxter", "Botermelk", "Boerenbuiten", "Brol", "Brossen", "Buitensmijten", "Bureel")

# 2. converteren kleine letters
belgicismen <- tolower(belgicismen)

# 3. kruistabel dubbele ingaves
sort(table(belgicismen)) # baxter = 2x

# 4. dubbele ingave verwijderen
belgicismen <- unique(belgicismen)

# 5. check welke van vijf woorden in lijst voorkomen
te_checken_woorden <- c("beschaamd", "bisser", "achterpoortje", "benadeligen", "boterkoek")
te_checken_woorden[te_checken_woorden %in% belgicismen] # vergelijk ook: te_checken_woorden %in% belgicismen