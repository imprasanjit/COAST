package com.coast.app.controller;

import java.util.HashMap;
import java.util.Map;

import org.geojson.Feature;
import org.geojson.FeatureCollection;
import org.geojson.Point;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coast.app.dto.GeoJsonDTO;
import com.coast.app.service.GeoJsonService;

@Controller
@Scope("session") 
@RequestMapping(value="/geojson")
public class GeoJsonController {
	
	@Autowired
	private GeoJsonService geoJsonService;
	
	@ResponseBody
	@GetMapping(value = "/getStateBoundaryJson")
	public GeoJsonDTO getStateBoundaryJson() 
	{
		return geoJsonService.getStateBoundaryJson();
	}
	
	@ResponseBody
	@GetMapping(value = "/getDistrictJson")
	public GeoJsonDTO getDistrictJson(@RequestParam String dist) 
	{
		return geoJsonService.getDistrictJson(dist);
	}
	
	@ResponseBody
	@GetMapping(value = "/getTehsilJson")
	public GeoJsonDTO getTehsilJson(@RequestParam String tehsil,@RequestParam String dist) 
	{
		return geoJsonService.getTehsilJson(tehsil,dist);
	}
	
	@ResponseBody
	@GetMapping(value = "/getGpJson")
	public GeoJsonDTO getGpJson(@RequestParam String gp,@RequestParam String tehsil,@RequestParam String dist) 
	{
		return geoJsonService.getGpJson(gp,tehsil,dist);
	}
	
	@ResponseBody
	@GetMapping(value = "/getVillageJson")
	public GeoJsonDTO getVillageJson(@RequestParam String vill,@RequestParam String gp,@RequestParam String tehsil,@RequestParam String dist) 
	{
		return geoJsonService.getVillageJson(vill,gp,tehsil,dist);
	}
	
	@ResponseBody
	@GetMapping(value = "/getPlotInfoGeoJson")
	public GeoJsonDTO getPlotInfoGeoJson(@RequestParam String plotno,@RequestParam String vill,@RequestParam String gp,@RequestParam String tehsil,
			@RequestParam String dist) 
	{
		return geoJsonService.getPlotInfoGeoJson(plotno,vill,gp,tehsil,dist);
	}
	@ResponseBody
	@GetMapping(value = "/getAllPlotGeoJson")
	public GeoJsonDTO getAllPlotGeoJson(@RequestParam String vill,@RequestParam String gp,@RequestParam String tehsil,
			@RequestParam String dist) 
	{
		return geoJsonService.getAllPlotGeoJson(vill,gp,tehsil,dist);
	}
	@ResponseBody
	@GetMapping(value = "/getAquaPondInfoGeoJson")
	public GeoJsonDTO getAquaPondInfoGeoJson(@RequestParam String pondno,@RequestParam String vill,@RequestParam String gp,@RequestParam String tehsil,
			@RequestParam String dist) 
	{
		return geoJsonService.getAquaPondInfoGeoJson(pondno,vill,gp,tehsil,dist);
	}
	@ResponseBody
	@GetMapping(value = "/getCAAJson")
	public GeoJsonDTO getCAAJson() 
	{
		return geoJsonService.getCAAJson();
	}
	@ResponseBody
	@GetMapping(value = "/getCRZBoundaryJson")
	public GeoJsonDTO getCRZBounadryJson() 
	{
		return geoJsonService.getCRZBounadryJson();
	}
	
	@ResponseBody
	@GetMapping(value = "/getCRZ1aJson")
	public GeoJsonDTO getCRZ1aJson() 
	{
		return geoJsonService.getCRZ1aJson();
	}
	@ResponseBody
	@GetMapping(value = "/getCRZ1bJson")
	public GeoJsonDTO getCRZ1bJson() 
	{
		return geoJsonService.getCRZ1bJson();
	}
	@ResponseBody
	@GetMapping(value = "/getCRZiiJson")
	public GeoJsonDTO getCRZiiJson() 
	{
		return geoJsonService.getCRZiiJson();
	}
	@ResponseBody
	@GetMapping(value = "/getRFJson")
	public GeoJsonDTO getRFJson() 
	{
		return geoJsonService.getRFJson();
	}
	@ResponseBody
	@GetMapping(value = "/getSanctuaryJsonBydist")
	public GeoJsonDTO getSanctuaryJsonBydist(@RequestParam String dist) 
	{
		return geoJsonService.getSanctuaryJsonBydist(dist);
	}
	@ResponseBody
	@GetMapping(value = "/getAllSanctuaryJson")
	public GeoJsonDTO getAllSanctuaryJson() 
	{
		return geoJsonService.getAllSanctuaryJson();
	}
	@ResponseBody
	@GetMapping(value = "/getFishingHarbourJsonBydist")
	public GeoJsonDTO getFishingHarbourJsonBydist(@RequestParam String dist) 
	{
		return geoJsonService.getFishingHarbourJsonBydist(dist);
	}
}
