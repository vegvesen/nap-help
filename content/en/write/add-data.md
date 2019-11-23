---
lastmod: [":fileModTime", ":git", "lastmod", "date", "publishDate"]
title: "Add data"
date: 2019-11-22T06:49:25+02:00
draft: false
---

The National Access Point does not contain the data itself or the services that are made available for re-use, but only the *metadata* describing them. As part of the metadata you will find links to the underlying services and the sets of data that can be accessed.

## Publish metadata

Metadata can be published in two ways:

 + By automatic harvest from a data portal in your own organization
   + This is a good alternative for organizations already having a data portal where they publsih their open data and services. Some integration work by Brønnøysundregistrene (BRREG) and possibly on your own side must be expected. The NPRA data service on [dataut.vegvesen.no](https://dataut.vegvesen.no/) is an example of an internal data portal with this type of integration.


 + By direct input via a web form
  + In this case you will use [the registration service from BRREG](https://fellesdatakatalog.brreg.no/about-registration). To be able to do this, you need to have a ["role" in Altinn](https://www.altinn.no/en/help/profile/roles-and-rights/) which gives you permissions to publish metadata on behalf of your organization. This must be set up by someone in your organization having the role  "Tilgangsstyring" in Altinn. When you log in to the registration service, you will be authenticated by [ID-porten](http://eid.difi.no/en/id-porten), where your roles at Altinn will be checked. If you have the right roles on behalf of at least one – possibly several organizations – you proceed by choosing organization, and will then be provided with the web form where you can register the metadata.


## Metadata Standard - DCAT-AP

The National Data Catalogue uses the metadata standard  DCAT-AP-NO, which is compatible with the European standard [DCAT-AP](https://joinup.ec.europa.eu/solution/dcat-application-profile-data-portals-europe). This means that the descriptions of data may be understood and can be collected also from international data catalogues. If you are uncertain on the meaning of some of the fields and do not find help in the registration service, you may  [confer the detailed decription of the standard]({{< napdict "dcat_URL" >}}).

## Licenses

In the metadata, you need to provide a *licence* that will inform the data users under which terms they may use the data. The most commonly used licences are:

+ [Norsk lisens for offentlige data]({{< napdict "nlod_URL" >}}) (NLOD)
+ [Creative Commons Navngivelse 4.0 International](https://creativecommons.org/licenses/by/4.0/deed.en)
+ [Creative Commons Universal Free status declaration](https://creativecommons.org/publicdomain/zero/1.0/deed.en)

The first two are quite similar, and NLOD is the current recommendation from [Difi](https://www.difi.no/om-difi/about-difi) - the Agency for Public Management and eGovernment - and most commonly used in Norway, while Creative Commons has the advantage that it is better known internationally.

The last licence can be used if you want to renounce all rights to the data.
If you prefer to use another open licence, please contact us. We may make it available in the registration service.
