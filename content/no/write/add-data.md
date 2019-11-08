---
lastmod: [":fileModTime", ":git", "lastmod", "date", "publishDate"]
title: "Legge inn data"
date: 2019-07-20T06:49:25+02:00
draft: false
---

Tilgangspunktet inneholder ikke selve datasettene og tjenestene som skal tilgjengeliggjøres, men kun *metadata* for disse. Som en del av metadataene vil man finne linker til de underliggende tjenestene og datasettene. Innlegging av metadata kan skje på to måter:

 + Via automatisk høsting av metadata fra egen organisasjonsportal
   + Dette passer for organisasjoner som allerede har en dataportal som lister deres åpne tjenester og datasett. Det må påregnes noe integrasjonsarbeide for at tilgangspunktet i Brønnøysundregistrene skal kunne høste slike data automatisk. Statens vegvesen sin tjeneste på [dataut.vegvesen.no](https://dataut.vegvesen.no/) er et eksempel på en intern portal med slik integrasjon.

 + Via direkte innlegging av metadata via webskjema
  + Her bruker man [Brønnøysundregistrenes registreringsløsning](https://fellesdatakatalog.brreg.no/about-registration), men du må ha en [rolle i Altinn](https://www.altinn.no/hjelp/profil/roller-og-rettigheter/) som angir at du kan registrere metadata på vegne av din organisasjon. Dette må settes opp  av noen i din organisasjon som har tilgang til å tilordne roller i Altinn. Når du siden logger inn i registreringsløsningen blir du først autentisert via IDporten, hvorpå dine eventuelle roller i Altinn blir sjekket.  Hvis du har roller på vegne av minst en – evt flere organisasjoner – får du anledning til å velge organisasjonen du vil registrere for og kan gå videre med registrering.

+ [Se også vår forklaring her](/assets/RegData.pdf).

  Felles datakatalog bruker metadatastandarden DCAT-AP-NO, som er kompatibel med den europeiske standarden [DCAT-AP](https://joinup.ec.europa.eu/solution/dcat-application-profile-data-portals-europe). Det betyr at datasettbeskrivelsene kan forstås og hentes inn også til internasjonale datakataloger. Hvis du er i tvil om enkelte av feltene og ikke får nok hjelp i registreringsløsningen kan du se på [beskrivelsen av standarden]({{< napdict "dcat_URL" >}}).

  Du må oppgi en lisens som forteller brukeren hvilke vilkår som gjelder for bruk av dataene. De mest aktuelle lisensene er:

+ [Norsk lisens for offentlige data]({{< napdict "nlod_URL" >}}) (NLOD)
+ [Creative Commons Navngivelse 4.0 Internasjonal](https://creativecommons.org/licenses/by/4.0/deed.en)
+ [Creative Commons Universal Fristatus-erklæring](https://creativecommons.org/publicdomain/zero/1.0/deed.en)

De to første er svært like (NLOD er gjeldende anbefaling fra Difi og mest brukt i Norge, mens Creative Commons har den fordelen at den er mer kjent internasjonalt).

Den siste lisensen bruker du hvis du vil gi avkall på alle rettigheter til dataene.

Hvis du ønsker å bruke en annen åpen lisens, kontakt oss slik at vi kan gjøre den tilgjengelig i registreringsløsningen.


{{< lastupdate >}}
