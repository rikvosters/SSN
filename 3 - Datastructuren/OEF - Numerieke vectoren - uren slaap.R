## Oefening: numerieke vectoren (uren slaap)

# 1. Maak de werkruimte leeg.
# 2. Maak een vector aan met het (geschatte) aantal uren slaap dat je per nacht vorige week hebt gehad. Maak een schatting tot 1 cijfer na de komma (bijv. 8.5) per nacht, te beginnen bij vorige week maandag en eindigend bij afgelopen zondag (= 7 cijfers in totaal).
# 3. Bereken je gemiddelde aantal uren slaap op basis van die vector. Rond af op twee cijfers na de komma.
# 4. Bereken met een functie hoeveel nachten je minder dan 7 uur slaap hebt gehad.
# 5. Ga eveneens na in hoeveel percent van alle nachten vorige week je 8 of meer uur slaap hebt gehad.
# 6. Bereken het verschil tussen je gemiddelde aantal uren slaap in de week (= maandagnacht t.e.m. vrijdagnacht) tegenover het weekend (= zaterdagnacht en zondagnacht). Gebruik hiervoor een subset van de eerste vijf en de laatste twee elementen in je vector.

## Oplossing

# werkruimte leegmaken
rm(list=ls(all=TRUE))

# gemiddelde aantal uren slaap definiëren
slaap <- c(7.0, 6.5, 6.0, 8.5, 6.5, 4.0, 9)

# gemiddelde (met afronding)
round(mean(slaap),2)

# nachten met minder dan 7 uur slaap
length(slaap[slaap < 7])

# % nachten met 8 of meer uur slaap
(length(slaap[slaap >= 8])/7)*100

# verschil week/weekend
week <- round(mean(slaap[1:5]),2); week
weekend <- round(mean(slaap[6:7]),2); weekend
verschil <- week - weekend; verschil

# alternatieve oplossing: 
round(mean(slaap[1:5]),2) - round(mean(slaap[6:7]),2)
