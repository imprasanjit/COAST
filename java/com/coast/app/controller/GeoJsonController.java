package com.coast.app.controller;

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
	public GeoJsonDTO getPlotInfoGeoJson(@RequestParam String plotno,@RequestParam String vill,@RequestParam String gp,@RequestParam String tehsil,@RequestParam String dist) 
	{
		return geoJsonService.getPlotInfoGeoJson(plotno,vill,gp,tehsil,dist);
	}
	
}
