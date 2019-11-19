## NAP

Dette er toppnivå for *kildefilene* som benyttes for å bygge hjelpesidene til transportportal.no - aka NAP (National Access Point). Nettstedet bygges vha. CMSet [Hugo](https://gohugo.io/). Katalogen "docs" inneholder det genererte innholdet, dvs. HTML filer, Javascript, CSS og andre statiske assets. Denne katalogen hadde ikke strengt tatt behøvd å være under versjonskontroll, men ved deploy til skytjenester som GitLab og GitHub Pages må en slik katalog finnes. GitHub Pages forventer å finne det ferdig genererte nettstedet på en slik katalog, mens GitLab selv kjører Hugo og genererer nettstedet ut på en slik katalog - i begge tilfellene vha GIT webhooks.

Pt. er det ingen webhooks påkoplet i repoet i Bitbucket for evt automatisk bygg via Hugo. Ved deploy til Atlas, må først en zip eller tarball av "docs" katalogen lastes opp til artrepo.vegvesen.no.
