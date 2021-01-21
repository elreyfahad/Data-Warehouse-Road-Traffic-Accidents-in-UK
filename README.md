# Data Warehouse Road Traffic Accidents in United Kingdom

Creation d'un data warehouse sur les accidents de la route survenue au Royaume Unie entre 2016 et 2018.

# Problematique :

Les statistiques sont stupéfiantes. Autour du globe,on compte jusqu'à un million de mort et **34 millions** de personnes blessées chaque année dans des accidents de la route.D'après l’organisation mondiale de la santé (OMS) les accidents de la route sont les principale cause de décès chez les moins de 40 ans. Et le problème empire,cette année l'OMS estime que les accidents de la route seront la troisième plus grande menace pour la santé publique,dépassant les autres problèmes de santé publique graves tels que la tuberculose, les maladies diarrhéiques, VIH / SIDA et les infections des voies respiratoires inférieures.

### “ Comment cette épidémie moderne pourrait-elle être atténuée ? ”

En général, les accidents routières représentent une conjonction de multiples facteurs impliquant
les infrastructures routières,les véhicules,les personnes et éventuellement le temps.Les
dommages humains et économiques causés sont largement évitables,pourtant la sécurité
routière est souvent négligée en termes de ressources et d'aide. Les défauts de conception et
d'ingénierie des routes, associés au comportement du conducteur, peuvent être surmontés grâce
à des efforts concertés.

Notre étude se base sur le cas de la Grande-Bretagne ou chaque année, quelque **3400 personnes**
sont tuées sur les routes, dont **218 enfants**.**137000** autres blessés graves et **272 500** légèrement
blessés.

---
# I- Description des données

Nos données initiales sont composée de 4 fichier **“accident.csv”, ”vehicle.csv”, ”driver.csv”**
et **”casualty.csv”**, qui fournissent respectivement des données détaillées sur les circonstances
des accidents de la route avec blessures corporelles en Grande-Bretagne de 2016 à 2018, les
types de véhicules et conducteurs impliqués et les victimes.En plus de fournir des détails sur la
date, l'heure et le lieu, le fichier **“accident.csv”** donne un résumé de tous les véhicules et
victimes signalés impliqués dans des accidents de la route et du nombre total de victimes, par
gravité.



## accident
![](images/Capture%20d’écran%202021-01-21%20à%2017.45.28.png)

## vehicle
![](images/Capture%20d%E2%80%99e%CC%81cran%202021-01-21%20a%CC%80%2017.44.04.png)

## driver
![](images/Capture%20d%E2%80%99e%CC%81cran%202021-01-21%20a%CC%80%2017.45.09.png)

## casuality
![](images/Capture%20d%E2%80%99e%CC%81cran%202021-01-21%20a%CC%80%2017.44.50.png)


---
# II- Modelisation

## Modèle Entité/Association 
![](images/model%20entite%20relationnel.png)


## Modèle Objet Relationnel 
![](images/modele%20objet%20relationnel.png)

## Modèle Dimensionnel 
![](images/modele%20dimensionnel.png)


---
# III - Reporting

## Série chronologique de l'évolution du nombre des accidents au cours des années 2016, 2017 et 2018 
![](images/accident%20par%20annee.png)

## Le types de conduicteur (par age et sexe ) qui provoque le plus d’accidents 
![](images/accident%20par%20age.png)

##  La classe des victimes la plus affectée par les accidents routiers avec des sévérités  mortels
![](images/accident%20par%20classe.png)

## La sévérité des blessures des victimes par rapport au type de véhicule
![](images/severite%20par%20vehicule.png)

## Les villes ou il y’a le plus d’accidents
![](images/accident%20par%20ville.png)









