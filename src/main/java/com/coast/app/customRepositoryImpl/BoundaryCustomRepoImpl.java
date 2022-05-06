package com.coast.app.customRepositoryImpl;

import java.sql.ResultSet;
import java.util.List;
import java.util.stream.Stream;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.BoundaryCustomRepo;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Service
public class BoundaryCustomRepoImpl implements  BoundaryCustomRepo{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public String getStateBoundaryGeoJson() {
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers.state_boundary";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}
	
	@Override
	public String getGeoJsonByTehsilName(String tehsil,String distname) {
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers.tehsil_boundary  where tehname='" + tehsil + "'" + " and distname='" + distname + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}
	
	@Override
	public String getGeoJsonByGpName(String gp, String tehsil, String dist) {
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers.gp_boundary where distname='"+dist+"'"+" and blockname='" + tehsil + "'" + " and  gpname='" + gp + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getGeoJsonByVillName(String vill, String gp, String tehsil, String dist) {
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers.study_area_villages where distname='"+dist+"'"+" and tehname='" + tehsil + "'" + " and  gpname='" + gp + "'" + " and  villname='" + vill + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getGeoJsonPlotInfo(String plotno, String vill, String gp, String tehsil, String dist) {
		var district=dist.toLowerCase();
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers."+district+"_plots where plotno='"+plotno+"' and  tehname='" + tehsil + "'" + " and  gpname='" + gp + "'" + " and  villname='" + vill + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getGeoJsonPlotInfoFor_(String plotno, String vill, String gp, String tehsil, String dist) {
		var district=dist.toLowerCase();
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers."+district+"_plots where plotno='"+plotno+"'"+" and teh_name='" + tehsil + "'" + " and  gp_name='" + gp + "'" + " and  vill_name='" + vill + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}
	@Override
	public String getAllPlotGeoJsonFor_(String dist, String tehsil, String gp, String vill) {
		 var district=dist.toLowerCase();
		 //String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers."+district+"_plots where  teh_name='" + tehsil + "'" + " and  gp_name='" + gp + "'" + " and  vill_name='" + vill + "'";	
		 String jpql = "SELECT cast(json_build_object('type', 'FeatureCollection', 'features', json_agg(cast(st_asgeojson(t.*) as json)) )as text ) AS json_build_object "
			 		+ " FROM ( SELECT st_transform("+district+"_plots.geom, 4326) AS st_transform"
			 		+ " FROM  layers."+district+"_plots   where  teh_name='" + tehsil + "'" + " and  gp_name='" + gp + "'" + " and  vill_name='" + vill + "' ) t";

		 Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}
	@Override
	public String getAllPlotGeoJson(String dist, String tehsil, String gp, String vill) {
		 var district=dist.toLowerCase();
		// String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers."+district+"_plots where  tehname='" + tehsil + "'" + " and  gpname='" + gp + "'" + " and  villname='" + vill + "'";
		 String jpql = "SELECT cast(json_build_object('type', 'FeatureCollection', 'features', json_agg(cast(st_asgeojson(t.*) as json)) )as text ) AS json_build_object "
		 		+ " FROM ( SELECT st_transform("+district+"_plots.geom, 4326) AS st_transform"
		 		+ " FROM  layers."+district+"_plots where  tehname='" + tehsil + "'" + " and  gpname='" + gp + "'" + " and  villname='" + vill + "') t";
		 Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}
	@Override
	public String getCAAGeoJson() {
		String stringResult=null;
		try {
		String jpql = "select * from  layers.uvw_caaGeoJson";
		Query queryy = entityManager.createNativeQuery(jpql);
		 Object singleResult = queryy.getSingleResult();
	     stringResult = singleResult.toString();
	     System.out.println(singleResult);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return stringResult;
	}

	@Override
	public String getCRZGeoJson() {
		String jpql = "select * from  layers.uvw_crzgeojson";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getCRZ1aGeoJson() {
		String jpql = "select * from  layers.uvw_crz1ageojson";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getCRZ1bGeoJson() {
		String jpql = "select * from  layers.uvw_crz1bgeojson";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getCRZiiGeoJson() {
		String jpql = "SELECT * from layers.uvw_crz_ii_areageojson";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getRFGeoJson() {
		String jpql = "SELECT * FROM layers.uvw_reserve_forest_geojson";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getAllSanctuaryJson() {
		 String jpql = "SELECT * FROM layers.uvw_reserve_forest_geojson";
		 Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getSanctuaryJsonByDist(String dist) {
		 String jpql = " select cast(json_build_object('type', 'FeatureCollection', 'features', json_agg(cast(st_asgeojson(t.*) as json)) )as text ) AS json_build_object "
		 		+ "           FROM ( SELECT st_transform(marine_protected_area.geom, 4326) AS st_transform\r\n"
		 		+ "                  FROM layers.marine_protected_area where dist_name ilike '"+ dist+"') t   ";
		 Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getFishingHarbourJsonBydist(String dist) {
		 String jpql = " SELECT cast(jsonb_build_object('type','FeatureCollection','features',jsonb_agg(feature))as text ) "
		 		+ " FROM(SELECT jsonb_build_object('type','Feature','id',gid,'geometry', cast(ST_AsGeoJSON(geom, 4326)as jsonb),'properties', to_jsonb(row) - 'gid' - 'geom') AS feature "
		 		+ " FROM (SELECT * FROM layers.fishing_harbour where district ilike '"+ dist+"' ) row) features";
			 Query queryy = entityManager.createNativeQuery(jpql);
		     Object singleResult = queryy.getSingleResult();
		     String stringResult = singleResult.toString();
		     return stringResult;
	}

	@Override
	public String getGeoJsonAquaPondInfoFor_(String pondno, String vill, String gp, String tehsil, String dist) {
		var district=dist.toLowerCase();
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers."+district+"_aquaponds where pondno='"+pondno+"'"+" and teh_name='" + tehsil + "'" + " and  gp_name='" + gp + "'" + " and  vill_name='" + vill + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getGeoJsonAquaPondInfo(String pondno, String vill, String gp, String tehsil, String dist) {
		var district=dist.toLowerCase();
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers."+district+"_aquaponds where pondno='"+pondno+"'"+" and tehname='" + tehsil + "'" + " and  gpname='" + gp + "'" + " and  villname='" + vill + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}


	
}
