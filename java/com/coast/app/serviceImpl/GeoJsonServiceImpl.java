package com.coast.app.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.BoundaryCustomRepo;
import com.coast.app.dto.GeoJsonDTO;
import com.coast.app.repository.DistrictRepository;
import com.coast.app.service.GeoJsonService;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@Service
public class GeoJsonServiceImpl  implements GeoJsonService{

	@Autowired
	private DistrictRepository  districtBoundary;
	
	@Autowired
	private BoundaryCustomRepo  boundaryRepo;
	
	@Override
	public GeoJsonDTO getStateBoundaryJson() {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String stateJson=boundaryRepo.getStateBoundaryGeoJson();
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(stateJson);
		      json.setName("Odisha");
		      json.setStatus(1);
		      json.setGeojson(actualObj.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(json==null) {
			  json.setStatus(0);
		}
		return json;
	}
	@Override
	public GeoJsonDTO getDistrictJson(String dist) {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		      String geoJsonBydistName = districtBoundary.getGeoJsonBydistName(dist);
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(geoJsonBydistName);
		      json.setName(dist);
		      json.setStatus(1);
		      json.setGeojson(actualObj.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(json==null) {
			  json.setStatus(0);
		}
		return json;
	}
	@Override
	public GeoJsonDTO getTehsilJson(String tehsil,String distname) {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String tehsilJson=boundaryRepo.getGeoJsonByTehsilName(tehsil,distname);
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(tehsilJson);
		      json.setName(tehsil);
		      json.setStatus(1);
		      json.setGeojson(actualObj.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(json==null) {
			  json.setStatus(0);
		}
		return json;
	}
	@Override
	public GeoJsonDTO getGpJson(String gp, String tehsil, String dist) {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String gpJson=boundaryRepo.getGeoJsonByGpName(gp,tehsil,dist);
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(gpJson);
		      json.setName(gp);
		      json.setStatus(1);
		      json.setGeojson(actualObj.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(json==null) {
			  json.setStatus(0);
		}
		return json;
	}
	@Override
	public GeoJsonDTO getVillageJson(String vill, String gp, String tehsil, String dist) {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String gpJson=boundaryRepo.getGeoJsonByVillName(vill,gp,tehsil,dist);
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(gpJson);
		      json.setName(vill);
		      json.setStatus(1);
		      json.setGeojson(actualObj.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(json==null) {
			  json.setStatus(0);
		}
		return json;
	}
	@Override
	public GeoJsonDTO getPlotInfoGeoJson(String plotno, String vill, String gp, String tehsil, String dist) {
		GeoJsonDTO json=new GeoJsonDTO();
		try {
			String plotJson="";
			if(dist.equalsIgnoreCase("Cuttack")||dist.equalsIgnoreCase("Kendrapara")||dist.equalsIgnoreCase("Baleshwar"))
			{
				plotJson=boundaryRepo.getGeoJsonPlotInfoFor_(plotno,vill,gp,tehsil,dist);
			}
			else {
				plotJson=boundaryRepo.getGeoJsonPlotInfo(plotno,vill,gp,tehsil,dist);
			}
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(plotJson);
		      json.setStatus(1);
		      json.setGeojson(actualObj.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(json==null) {
			  json.setStatus(0);
		}
		return json;
	}
	

}
