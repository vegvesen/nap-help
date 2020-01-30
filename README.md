## NAP (transportportal.no)

Dette er toppnivå for *kildefilene* som benyttes for å bygge hjelpesidene til [transportportal.no](https://transportportal.no) - aka NAP (National Access Point) - en nasjonal portal for åpne veg, trafikk og transportdata som Norge er pålagt å sette opp av EU (gjennom EØS-avtalen), og som SVV har fått ansvaret for å få opp. [Selve datakatalogen](https://nap.fellesdatakatalog.brreg.no/) med datasett og APIer hostes av Brønnøysundregistrene, og er linket til fra disse hjelpesidene. Inngangssiden til portalen er identisk med dokumentrot for disse hjelpesidene, og vil være URLen [transportportal.no i produksjon](https://transportportal.no/) - muligens bare en redirect (eller rewrite)  mot det faktiske deployet.

Nettstedet bygges vha. CMSet [Hugo](https://gohugo.io/). Ved kjøring av Hugo, vil nettstedet bli generert på katalog "docs" - som ikke er en del av repoet.

Pt. er det ingen webhooks påkoplet i repoet i SVV Bitbucket (git.vegvesen.no) for evt automatisk bygg via Hugo. Ved deploy til Atlas, må først en gzipet tar fil  av "docs" katalogen lastes opp til artrepo.vegvesen.no. Ferdige skript finnes, se under.

Det settes dog en GIT tag identisk med artefakt versjonen i artrepo.

Drift og forvaltningsdokumentasjon for hjelpesidene [finnes i et annet repo](https://git.vegvesen.no/projects/NAP/repos/nap-doc), men noen av prosessene er også grovt beskrevet på [katalogen hvor Atlas konfigurasjonen ligger](atlas/).
