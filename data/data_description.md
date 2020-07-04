# Data Description

We used data from population registers and national censuses. We drew on data from the [IMAGE](https://imageproject.com.au) global repository and individual national statistical offices collected for a [Regional Studies Association](https://www.regionalstudies.org)-funded project:[Understanding the declining trend in internal migration in Europe](http://www.franciscorowe.com/project/migration_decline/). The Table below provides details of the data used to produce the flow map reported in the article:  

Country | Year | No. of Regions
:---------|----------|---------:
Albania | 2011 | 12
Armenia | 2011 | 11
Austria | 2010 | 99
Belarus | 2011 | 6
Belgium | 2005 | 589
Bosnia-Herzegovina | 2011 | 3
Bulgaria | 2010 | 28
Cyprus | 2001 | 5
Czech Republic | 2010 | 77
Denmark | 2011 | 99
Estonia | 2010 | 15
Finland | 2011 | 336
France | 2006 | 22
Georgia | 2014 | 12
Germany | 2009 | 412
Greece | 2011 | 54
Hungary | 2004 | 20
Iceland | 2016 | 8
Ireland | 2006 | 26
Italy | 2009 | 107
Latvia | 2010 | 5
Lithuania | 2004 | 10
Malta | 2005 | 6
Montenegro | 2018 | 21
Netherlands | 2010 | 431
Norway | 2013 | 428
Poland | 2010 | 16
Portugal | 2011 | 30
Romania | 2002 | 42
Russia | 2010 | 80
Slovakia | 2006 | 4
Slovenia | 2010 | 12
Spain | 2011 | 52
Sweden | 2012 | 290
Switzerland | 2000 | 184
Turkey | 2012 | 81
UK | 2011 | 404
Ukraine | 2010 | 27

## Flow data (RDS format) file
This file includes the Origin-Destination flows between regions by country. The file consists of nine columns described below:

`Origin`: The name of the origin region

`Destination`: The name of the destination region

`flows`: The number of people migrated between the Origin and Destination regions

`or_Lon`: Centroid longitude of the Origin region's polygon

`or_Lat`: Centroid latitude of the Origin region's polygon

`des_Lon`: Centroid longitude of the Destination region's polygon

`des_Lat`: Centroid latitude of the Destination region's polygon

`ISO_code `: ISO 3166-1 alpha-3 code of the country that the Origin and Destination 
regions belong to

`country_name `: Name of the country that the Origin and Destination regions belong to

This dataset is used by [`EU_flow_map.R`](https://github.com/fcorowe/mappingeuflows/tree/master/code) file which produces the flow map reported in the article.



