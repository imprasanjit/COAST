package com.coast.app.service;

import com.coast.app.dto.GeoJsonDTO;

public interface GeoJsonService {

	GeoJsonDTO getDistrictJson(String dist);

	GeoJsonDTO getTehsilJson(String tehsil,String distname);

	GeoJsonDTO getStateBoundaryJson();

	GeoJsonDTO getGpJson(String gp, String tehsil, String dist);

	GeoJsonDTO getVillageJson(String vill, String gp, String tehsil, String dist);

	GeoJsonDTO getPlotInfoGeoJson(String plotno, String vill, String gp, String tehsil, String dist);

	GeoJsonDTO getCAAJson();

	GeoJsonDTO getCRZBounadryJson();

	GeoJsonDTO getCRZ1aJson();

	GeoJsonDTO getCRZ1bJson();

	GeoJsonDTO getCRZiiJson();

	GeoJsonDTO getRFJson();

	GeoJsonDTO getAllPlotGeoJson(String vill, String gp, String tehsil, String dist);

	GeoJsonDTO getSanctuaryJsonBydist(String dist);

	GeoJsonDTO getAllSanctuaryJson();

	GeoJsonDTO getFishingHarbourJsonBydist(String dist);

	GeoJsonDTO getAquaPondInfoGeoJson(String pondno, String vill, String gp, String tehsil, String dist);



}
