## Atlas konfig for hjelpesidene til transportportal.no (aka "NAP")

Merk - transportportal.no (utv.transportportal.no) er et DNS "alias" for transportportal.atlas.vegvesen.no (transportportal.utv.atlas.vegvesen.no). All Atlas konfig forholder seg kun til Atlas endepunktene.

Viktige ting å legge merke til:

+ Det er kun satt opp to Atlas appmiljøer, "utvikling" og "produksjon", ikke behov for atm her, siden "testing" av hjelpesidene først foregår ved localhost preview av de genererte sidene som lages vha Hugo. Dette kan ses på som motsvarende enhetstesting. "Integrasjonstesten" gjøres da ved å lage et bygg og kjøre opp et deploy mot "utvikling" (transportportal.utv.vegvesen.no)
+ Atlas deployene er satt opp for enkelt å kunne gjøre [blue/green deploy](https://atlas-docs.atlas.vegvesen.no/atlas-dokumentasjon/latest/eksempler/bluegreen_deploy.html). Det betyr at endepunktet transportportal.atlas.vegvesen.no "eies" av en dispatcher som peker ut det underliggende deployet som til enhver tid skal være kjørende.
+ I begge app-miljøene heter deployene "transport-blue" og "transport-green"
