## Atlas konfig for hjelpesidene til transportportal.no (aka "NAP")

____
Merk - `transportportal.no` (`utv.transportportal.no`) er et DNS alias for `transportportal.atlas.vegvesen.no` (`transportportal.utv.atlas.vegvesen.no`). All Atlas konfig forholder seg imidlertid kun til Atlas endepunktene.
____


### Viktige andre ting å legge merke til:

+ Det er kun satt opp to Atlas appmiljøer, "utvikling" og "produksjon" -  ikke behov for atm her, siden "testing" av hjelpesidene først foregår ved localhost preview av de genererte sidene som lages vha [Hugo](https://gohugo.io/). Dette kan ses på som motsvarende enhetstesting. "Integrasjonstesten" gjøres da ved å lage et bygg og kjøre opp et deploy mot "utvikling" (transportportal.utv.vegvesen.no)
+ Byggene blir desverre miljøavhengige siden Hugo legger [baseURL](../config.toml) inn i den genererte HTML koden, og en gzip av den genererte koden er jo nettop artifakten som brukes av bygget for å lage appimage
+ Atlas deployene er satt opp for enkelt å kunne gjøre [blue/green deploy](https://atlas-docs.atlas.vegvesen.no/atlas-dokumentasjon/latest/eksempler/bluegreen_deploy.html). Det betyr at endepunktet transportportal.atlas.vegvesen.no "eies" av en dispatcher som peker ut det underliggende deployet som til enhver tid skal være kjørende.
+ I begge app-miljøene heter deployene **transport-blue** og **transport-green**

```
$ ac create dispatcher napt-dispatcher \
   -i napt
   -a external \
   -e produksjon \
   -H transportportal.atlas.vegvesen.no \
   -E transport-green \
   -w 100 \
```
```
$ ac get dispatcher -e utvikling
NAME             HOST                                   PATH  EXPOSE    ENDPOINTS
napt-dispatcher  transportportal.utv.atlas.vegvesen.no  /     external  transport-blue(100)
$ ac get dispatcher -e produksjon
NAME             HOST                               PATH  EXPOSE    ENDPOINTS
napt-dispatcher  transportportal.atlas.vegvesen.no  /     external  transport-green(100),transport-blue(0)

```
