## Atlas konfig for hjelpesidene til transportportal.no (aka "NAP")

____
Merk - transportportal.no (utv.transportportal.no) er et DNS alias for transportportal.atlas.vegvesen.no (transportportal.utv.atlas.vegvesen.no). All Atlas konfig forholder seg imidlertid kun til Atlas endepunktene.
____


### Viktige andre ting å legge merke til:

+ Det er kun satt opp to Atlas appmiljøer, "utvikling" og "produksjon" -  ikke behov for atm her, siden "testing" av hjelpesidene først foregår ved localhost preview av de genererte sidene som lages vha [Hugo](https://gohugo.io/). Dette kan ses på som motsvarende enhetstesting. "Integrasjonstesten" gjøres da ved å lage et bygg og kjøre opp et deploy mot "utvikling" (transportportal.utv.vegvesen.no)
+ Byggene blir desverre miljøavhengige siden Hugo legger [baseURL](../config/_default/config.toml) inn i den genererte HTML koden, og en gzip av den genererte koden er jo nettopp artifakten som brukes av bygget for å lage appimage
+ Atlas deployene er satt opp for enkelt å kunne gjøre [blue/green deploy](https://atlas-docs.atlas.vegvesen.no/atlas-dokumentasjon/latest/eksempler/bluegreen_deploy.html). Det betyr at endepunktet transportportal.atlas.vegvesen.no "eies" av en dispatcher som peker ut det underliggende deployet som til enhver tid skal være kjørende.
+ I begge app-miljøene heter deployene **transport-blue** og **transport-green**

### Sett opp dispatcher initielt
Bruk følgende kommando for å sette opp dispatcheren i Atlas prod-miljø. Forutsetter at deployet *transport-green* er den pod-en som skal motta all trafikk fra dispatcheren, og at dette deployet er aktivt.

```
$ ac create dispatcher napt-dispatcher \
   -i napt
   -a external \
   -e produksjon \
   -H transportportal.atlas.vegvesen.no \
   -E transport-green \
   -w 100 \
   -E transport-blue \
   -w 0
```

### Bytt til nytt deploy
Anta at ny versjon nå skal deployes til *transport-blue* og at dispatcheren skal svitsje over til dette. Da må det gamle "blue" deployet slettes og deployes på nytt med ny versjon av appimage. For å kunne slette det, må det først "tas ut" av dispatcheren:

```
$ ac modify dispatcher napt-dispatcher \
   -i napt
   -e produksjon \
   -E transport-green \
   -w 100
```
.. så kan det slettes og redeployes,  og *transport-blue* sin deploymentbeskrivelse må da være oppdatert med ny versjon av appimage (som antas å være bygget med `ac create build`):
```
$ ac delete deploy -e produksjon -i napt transport-blue
$ ac create deploy -e produksjon -i napt transport-blue
```
Når deployet er oppe (sjekk med `ac status`), kan dispatcheren svitsje til det nye:
```
$ ac modify dispatcher napt-dispatcher \
   -i napt
   -e produksjon \
   -E transport-green \
   -w 0 \
   -E transport-blue \
   -w 100
```
"blue" og "green" bytter dermed rolle mellom hvert deploy.

### Skripting av redeploy


Prosessen beskrevet over er skriptet via sh-skriptene som ligger på denne katalogen. De kan startes et og et, eller kjøres i kjede via *redeploy.sh*. Sekvensen er:

1. Kjør `hugo.sh <miljø>` der `miljø={utvikling|produksjon}` fra Atlas katalogen. Nye sider er nå på "docs" katalogen
2. Start `./artrepo.sh <versjonsnr> <miljø>` - med samme miljønavn som "hugo" ble kjørt med. Skriptet bygger først artefakt av de genererte siden med navn `napt-versjonsnr-miljø.tar.gz`og laster opp til Artefactory. Merk at skriptet benytter personlig token (apikey) for autentisering mot Artefactory. Denne antas å ligge på en fil i Atlas katalogen, og skal *ikke* med i GIT repoet (bruk .gitignore)
3. Start `./build.sh <versjonsnr> <appenv>`. Her lages et Atlas bygg av det artefaktet som ble lastet opp - gitt samme versjonsnr som argument.
