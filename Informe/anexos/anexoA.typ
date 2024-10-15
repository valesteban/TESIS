// Conf anexo
#counter(heading).update(0) // Reestablecer el contador de heading
#set heading(outlined: true, numbering: (..n) => {[Anexo #numbering("A.", ..n)]})

#show heading.where(level: 1): it => [
  #set text(24pt)
  #block("Anexo " + context counter(heading).display("A"))
  #block(it.body)
  #v(1em)
]
#show heading.where(level: 2): it => [
  #set text(18pt)
  #block(context counter(heading).display("A.1") + " " + it.body)
  #v(0.5em)
]



= titulo anexo 1

Collectors RIPE NCC:

#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [Nombre], [Ubicación], [Typo], [Sponsors]
  ),

  [RRC00],[Amsterdam, NL], [multihop],[RIPE NCC],
  [RRC01],[London, GB],[IXP],[LINX, LONAP],
  [RRC03],[Amsterdam, NL],[IXP], 	[AMS-IX, NL-IX],
  [RRC04],[Geneva, CH],[IXP],[CIXP],
  [RRC05],[Vienna, AT],[IXP],[VIX],
  [RRC06],[Otemachi, JP],[IXP],[DIX-IE, JPIX],
  [RRC07],[Stockholm, SE],[IXP],[Netnod],
  [RRC10],[Milan, IT],[IXP],[MIX],
  [RRC11],[New York, NY, US],[IXP],[NYIIX],
  [RRC12],[Frankfurt, DE],[IXP],[DE-CIX],
  [RRC13],[Moscow, RU],[IXP],[MSK-IX],
  [RRC14],[Palo Alto, CA, US],[IXP],[PAIX],
  [RRC15],[Sao Paolo, BR],[IXP],[PTTMetro-SP],
  [RRC16],[Miami, FL, US],[IXP],[Equinix Miami],
  [RRC18],[Barcelona, ES],[IXP],[CATNIX],
  [RRC19],[Johannesburg, ZA],[IXP],[NAP Africa JB],
  [RRC20],[Zurich, CH],[IXP],[SwissIX],
  [RRC21],[Paris, FR],[IXP],[France-IX Paris and France-IX Marseille],
  [RRC22],[Bucharest, RO],[IXP],[InterLAN],
  [RRC23],[Singapore, SG],[IXP],[Equinix Singapore],
  [RRC24],[Montevideo, UY],[multihop],[LACNIC region],
  [RRC25],[Amsterdam, NL],[multihop],[RIPE NCC],
  [RRC26],[Dubai, AE],[IXP],[UAE-IX, Datamena]
)




Collectors de ROuteVIews:


- Collectors:
// FIXME: Agregar info sobre cuales ya no estan activos
#table(
  columns: (auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [Host], [Ubicación]
  ),

  [amsix.ams.routeviews.org],[AMS-IX Amsterdam, Netherlands],

  [cix.atl.routeviews.org],[CIX-ATL Atlanta, Georgia],
  [decix.jhb.routeviews.org],[DE-CIX KUL, Johor Bahru, Malaysia],
[iraq-ixp.bgw.routeviews.org],[IRAQ-IXP Baghdad, Iraq],

[pacwave.lax.routeviews.org], 	[Pacific Wave, Los Angeles, California],
[pit.scl.routeviews.org], 	[PIT Chile Santiago, Santiago, Chile],
[pitmx.qro.routeviews.org]  ,	[PIT Chile MX, Querétaro, Mexico],
[route-views.routeviews.org] ,	[Cisco 	IPv4 	U of Oregon, Eugene Oregon],
[route-views.amsix.routeviews.org] ,		[AMS-IX AM6,  Amsterdam, Netherlands],
[route-views.bdix.routeviews.org], [BDIX, Dhaka, Bangledesh],
[route-views.bknix.routeviews.org],[BKNIX, Bangkok, Thailand],
[route-views.chicago.routeviews.org] 	,[Equinix CH1,  Chicago, Illinois],
[route-views.chile.routeviews.org],[NIC.cl Santiago, Chile],
[route-views.eqix.routeviews.org]  	,[Equinix DC, Ashburn, Virgina],
[route-views.flix.routeviews.org],	[FL-IX, Miami, Florida],
[route-views.fortaleza.routeviews.org] 		,[IX.br (PTT.br), Fortaleza, Brazil],
[route-views.gixa.routeviews.org] ,[	GIXA, Ghana, Africa],
[route-views.gorex.routeviews.org] 	 	,[IGOREX, Guam, US Territories],
[route-views.jinx.routeviews.org] 	,[JINX, Johannesburg, South Africa],
[route-views.kixp.routeviews.org] 	,	[KIXP, Nairobi, Kenya],
[route-views.linx.routeviews.org] ,	[LINX, London, United Kingdom],
[route-views.mwix.routeviews.org],[FD-IX, Indianapolis, Indiana],
[route-views.napafrica.routeviews.org ]	,[NAPAfrica, Johannesburg, South Africa],
[route-views.nwax.routeviews.org] ,[NWAX, Portland, Oregon],
[route-views.ny.routeviews.org] ,	[DE-CIX NYC, New York, USA],
[route-views.paix.routeviews.org],[PAIX, Palo Alto, California],
[route-views.perth.routeviews.org], [	West Australian Internet Exchange, Perth, Australia],
[route-views.peru.routeviews.org]	,[Peru IX, Lima, Peru],
[route-views.phoix.routeviews.org] ,[University of the Philippines, Diliman, Quezon City, Philippines],
[route-views.rio.routeviews.org],[IX.br (PTT.br), Rio de Janeiro, Brazil],
[route-views.saopaulo.routeviews.org] ,[SAOPAULO (PTT Metro, NIC.br), Sao Paulo, Brazil],
[route-views2.saopaulo.routeviews.org ]	,	[SAOPAULO (PTT Metro, NIC.br), Sao Paulo, Brazil],
[route-views.sfmix.routeviews.org] ,	[San Francisco Metro IX, San Francisco, California],
[route-views.siex.routeviews.org]	,[Sothern Italy Exchange (SIEX), Rome, Italy],
[route-views.sg.routeviews.org],[Equinix SG1, Singapore, Singapore],
[route-views.soxrs.routeviews.org] 	,[Serbia Open Exchange, Belgrade, Serbia],
[route-views.sydney.routeviews.org],[Equinix SYD1, Sydney, Australia],
[route-views.telxatl.routeviews.org],	[TELXATL, Atlanta, Georgia],
[route-views.uaeix.routeviews.org],[UAE-IX, Dubai, United Arab Emirates],
[route-views.wide.routeviews.org],[DIXIE (NSPIXP), Tokyo, Japan]
)



= Cosas Extras 

- ¿Cómo se ve el sobreajuste?
- Heat map para analisar de la importancia de los atributos
- ¿Por qué se obtienen mejores resultados con GraphSAGE que con CGN?
- ¿Por que no se ocupo un enfoque transductivo y unicamente uno inductive Learning?
- Transductive  
- pros y contra de cada metrica de evaluacion.



