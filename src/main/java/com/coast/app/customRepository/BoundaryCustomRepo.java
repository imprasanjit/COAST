package com.coast.app.customRepository;

public interface BoundaryCustomRepo {

	String getGeoJsonByTehsilName(String tehsil,String distname);

	String getStateBoundaryGeoJson();

	String getGeoJsonByGpName(String gp, String tehsil, String dist);

	String getGeoJsonByVillName(String vill, String gp, String tehsil, String dist);

	String getGeoJsonPlotInfo(String plotno, String vill, String gp, String tehsil, String dist);

	String getGeoJsonPlotInfoFor_(String plotno, String vill, String gp, String tehsil, String lowerCase);
	
	String getAllPlotGeoJson(String dist, String tehsil, String gp, String vill);

	String getAllPlotGeoJsonFor_(String dist, String tehsil, String gp, String vill);

	String getCAAGeoJson();

	String getCRZGeoJson();

	String getCRZ1aGeoJson();

	String getCRZ1bGeoJson();

	String getCRZiiGeoJson();

	String getRFGeoJson();

	String getAllSanctuaryJson();

	String getSanctuaryJsonByDist(String dist);

	String getFishingHarbourJsonBydist(String dist);

	String getGeoJsonAquaPondInfoFor_(String pondno, String vill, String gp, String tehsil, String dist);

	String getGeoJsonAquaPondInfo(String pondno, String vill, String gp, String tehsil, String dist);

	

}
