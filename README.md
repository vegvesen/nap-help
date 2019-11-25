## NAP (transportportal.no)

Dette er toppnivå for *kildefilene* som benyttes for å bygge hjelpesidene til transportportal.no - aka NAP (National Access Point) - en nasjonal portal for åpne veg, trafikk og transportdata som Norge er pålagt å sette opp av EU, og som SVV har fått ansvaret for å få opp. Selve datakatlogen med datasett og APIer hostes av Brønnøysundregistrene, og er linket til fra disse hjelpesidene. Inngangssiden til portalen er identisk med dokumentrot for disse hjelpesidene, og vil være URLen transportportal.no i produksjon - muligens bare en redirect mot det faktiske deployet.

Nettstedet bygges vha. CMSet [Hugo](https://gohugo.io/). Katalogen ["docs"](docs/) inneholder det genererte innholdet, dvs. HTML filer, Javascript, CSS og andre statiske assets. Denne katalogen hadde ikke strengt tatt behøvd å være under versjonskontroll, men ved deploy til skytjenester som GitLab og GitHub Pages må en slik katalog finnes. GitHub Pages forventer å finne det ferdig genererte nettstedet på en slik katalog, mens GitLab selv kjører Hugo og genererer nettstedet ut på en slik katalog - i begge tilfellene vha GIT webhooks.

Pt. er det ingen webhooks påkoplet i repoet i SVV Bitbucket (git.vegvesen.no) for evt automatisk bygg via Hugo. Ved deploy til Atlas, må først en gzipet tar fil  av "docs" katalogen lastes opp til artrepo.vegvesen.no.

Drift og forvaltningsdokumentasjon for hjelpesidene finnes i et annet repo.
