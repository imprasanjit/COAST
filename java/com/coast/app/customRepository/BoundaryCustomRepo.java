package com.coast.app.customRepository;

public interface BoundaryCustomRepo {

	String getGeoJsonByTehsilName(String tehsil,String distname);

	String getStateBoundaryGeoJson();

	String getGeoJsonByGpName(String gp, String tehsil, String dist);

	String getGeoJsonByVillName(String vill, String gp, String tehsil, String dist);

	String getGeoJsonPlotInfo(String plotno, String vill, String gp, String tehsil, String dist);

	String getGeoJsonPlotInfoFor_(String plotno, String vill, String gp, String tehsil, String lowerCase);


}
