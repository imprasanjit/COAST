package com.coast.app.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.BoundaryCustomRepo;
import com.coast.app.dto.GeoJsonDTO;
import com.coast.app.repository.DistrictRepository;
import com.coast.app.service.GeoJsonService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


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
		      json.setName(plotno);	      
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
	public GeoJsonDTO getAllPlotGeoJson(String vill, String gp, String tehsil, String dist) {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String plotJson="";
				if(dist.equalsIgnoreCase("Cuttack")||dist.equalsIgnoreCase("Kendrapara")||dist.equalsIgnoreCase("Baleshwar"))
				{
					plotJson=boundaryRepo.getAllPlotGeoJsonFor_(dist,tehsil,gp,vill);
				}
				else {
					plotJson=boundaryRepo.getAllPlotGeoJson(dist,tehsil,gp,vill);					
				}
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(plotJson);
		      json.setName("All Plot");
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
	public GeoJsonDTO getCAAJson() {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String CAAJson=boundaryRepo.getCAAGeoJson();
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(CAAJson);
		      json.setName("CAA Boundary");
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
	public GeoJsonDTO getCRZBounadryJson() {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String CRZJson=boundaryRepo.getCRZGeoJson();
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(CRZJson);
		      json.setName("CRZ Boundary");
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
	public GeoJsonDTO getCRZ1aJson() {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String CRZ1aJson=boundaryRepo.getCRZ1aGeoJson();
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(CRZ1aJson);
		      json.setName("CRZ 1A Boundary");
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
	public GeoJsonDTO getCRZ1bJson() {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String CRZ1bJson=boundaryRepo.getCRZ1bGeoJson();
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(CRZ1bJson);
		      json.setName("CRZ 1B Boundary");
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
	public GeoJsonDTO getCRZiiJson() {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String CRZiiJson=boundaryRepo.getCRZiiGeoJson();
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(CRZiiJson);
		      json.setName("CRZ II Boundary");
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
	public GeoJsonDTO getRFJson() {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String RFJson=boundaryRepo.getRFGeoJson();
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(RFJson);
		      json.setName("RF Boundary");
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
	public GeoJsonDTO getSanctuaryJsonBydist(String dist) {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String RFJson=boundaryRepo.getSanctuaryJsonByDist(dist);
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(RFJson);
		      json.setName("Sanctuary Boundary");
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
	public GeoJsonDTO getAllSanctuaryJson() {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String RFJson=boundaryRepo.getAllSanctuaryJson();
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(RFJson);
		      json.setName("Sanctuary Boundary");
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
	public GeoJsonDTO getFishingHarbourJsonBydist(String dist) {
		GeoJsonDTO json=new GeoJsonDTO();
		try {		
		     String RFJson=boundaryRepo.getFishingHarbourJsonBydist(dist);
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(RFJson);
		      json.setName("Fishing Harbour");
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
	public GeoJsonDTO getAquaPondInfoGeoJson(String pondno, String vill, String gp, String tehsil, String dist) {
		GeoJsonDTO json=new GeoJsonDTO();
		try {
			String plotJson="";
			if(dist.equalsIgnoreCase("Cuttack")||dist.equalsIgnoreCase("Kendrapara"))
			{
				plotJson=boundaryRepo.getGeoJsonAquaPondInfoFor_(pondno,vill,gp,tehsil,dist);
			}
			else {
				plotJson=boundaryRepo.getGeoJsonAquaPondInfo(pondno,vill,gp,tehsil,dist);
			}
		      ObjectMapper mapper = new ObjectMapper();
		      JsonNode actualObj = mapper.readTree(plotJson);
		      json.setName(pondno);	      
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
