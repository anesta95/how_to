## esridump
[A targeted utility](https://github.com/openaddresses/pyesridump) to pull down geographic data from ESRI maps.

### Download a geojson
```bash
esri2geojson https://services.arcgis.com/iFBq2AW9XO0jYYF7/arcgis/rest/services/Covid19byZIPnew/FeatureServer/0 nc_zipDATE.geojson
```
Download data from the ESRI REST endpoint that powers the N.C. DHHS COVID map of cases by zip code and save it as a geojson file.
