## Oefening: shark attacks

# Laad de dataset over haaienaanvallen in van het internet met de read.csv-code hieronder. Bekijk de gegevens en probeer volgende vragen te beantwoorden, aan de hand van het basispakket R of met tidyverse/dplyr:
shark <- read.csv("https://raw.githubusercontent.com/rikvosters/Basics-in-R/master/SharkAttacks.csv", sep="\t", quote="") 
shark

# - Hoeveel mensen zijn in 2017 gestorven na een aanval van een haai?
shark %>% 
  filter(Year == 2017) %>% 
  filter(Fatal == "Y") %>% 
  tally()

# alternatief base package:
length(shark$Name[shark$Year == 2017 & shark$Fatal == "Y"])

# - Controleer of er gedurende de tien jaar voor de film Jaws uitkwam in 1975 meer aanvallen door haaien voorkwamen in vergelijking met de tien jaar erna? 
shark %>% 
  filter(Year < 1975 & Year > 1965) %>% 
  tally()

shark %>% 
  filter(Year > 1975 & Year < 1985) %>% 
  tally()

# alternatief base package:
length(shark$Name[shark$Year < 1975 & shark$Year > 1965])
length(shark$Name[shark$Year > 1975 & shark$Year < 1985])

# - Hoe oud was het oudste Australische dodelijke slachtoffer?
shark %>% 
  filter(Fatal == "Y") %>% 
  filter(Country == "AUSTRALIA") %>% 
  arrange(desc(Age)) %>% 
  select(Age) %>% 
  head(1)

# alternatief base package:
max(shark$Age[shark$Fatal == "Y" & shark$Country == "AUSTRALIA"], na.rm = T)

# - Extraheer de namen van alle Nieuw-Zeelandse slachtoffers van aanvallen door haaien in de 20ste eeuw, maar wel enkel slachtoffers jonger dan 16.
shark %>% 
  filter(Age < 16 ) %>% 
  filter(Year > 1900 ) %>% 
  filter(Country == "NEW ZEALAND") %>% 
  select(Name)

# alternatief base package:
shark$Name[shark$Age < 16 & shark$Year > 1900 & shark$Country == "NEW ZEALAND"]
unique(shark$Name[shark$Age < 16 & shark$Year > 1900 & shark$Country == "NEW ZEALAND"])
