package com.coast.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.coast.app.dto.CadastralSearchPlot_DTO;
import com.coast.app.dto.DashboardFilterDto;
import com.coast.app.dto.DistrictDTO;
import com.coast.app.dto.FeasibleLandResponse;
import com.coast.app.dto.PlotDto;
import com.coast.app.dto.StudyAreaVillagesDto;
import com.coast.app.dto.fieldReportingDto;
import com.coast.app.service.MobileApiService;
import com.coast.app.serviceImpl.GpDto;
import com.coast.app.serviceImpl.VillageDto;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author Prasanjit
 *
 */
@RestController
@RequestMapping("/ROOT/api") //base url
public class MobileApiContoller 
{
	@Autowired
	private MobileApiService mobileApi;
	
    	
	@PostMapping(value = "/login")
	public ResponseEntity<?> login(@RequestParam("txtEmailId") String email, @RequestParam("txtPassword") String password) 
	{
		ResponseEntity<?> aunthetictaeUser = mobileApi.aunthetictaeUser(email, password);
		return aunthetictaeUser;
	}
	@GetMapping(value = "/getAllDistrict")
	public List<DistrictDTO> getAllDistrict() 
	{
		List<DistrictDTO> finddist = mobileApi.getAllDistrict();
		return finddist;
	}
	@GetMapping(value = "/getTehsilName")
	public List<StudyAreaVillagesDto> getTehsilName(@RequestParam String dist) 
	{
		List<StudyAreaVillagesDto> findbydist = mobileApi.findbydist(dist);
		return findbydist;

	}
	@GetMapping(value = "/getTehsilByDist")
	public List<StudyAreaVillagesDto> getTehsilByDist(@RequestParam String dist) 
	{
		List<StudyAreaVillagesDto> findbydist = mobileApi.findbydist(dist);
		return findbydist;

	}
	@GetMapping(value = "/getGpName")
	public List<GpDto> getGpName(@RequestParam("districtname") String dist, @RequestParam("tehsil") String tehsil) 
	{
		List<GpDto> findbydisttehsil = mobileApi.findbydisttehsil(dist, tehsil);
		return findbydisttehsil;

	}

	@GetMapping(value = "/getVillageName")
	public  List<VillageDto> getVillageName(@RequestParam("districtname") String dist,
			@RequestParam("tehsil") String tehsil ,@RequestParam("gp") String gp) 
	{
		List<VillageDto> findbydisttehsilgp = mobileApi.findbydisttehsilgp(dist, tehsil, gp);
		return findbydisttehsilgp;

	}
	@GetMapping(value = "/getPlotno")
	public  List<PlotDto> getPlotList(@RequestParam("dist") String dist, @RequestParam("tehsil") String tehsil,
			@RequestParam("gp") String gp, @RequestParam("village") String village) 
	{
		List<PlotDto> findplotbydisttehsilgp = mobileApi.findplotbydisttehsilgp(dist, tehsil, gp, village);
		return findplotbydisttehsilgp;

	}
	
	@GetMapping(value = "/getFesLandReport")
	public List<FeasibleLandResponse> getFesLand(@RequestParam("dist") String dist, 
											  @RequestParam("teh") String tehsil,
											  @RequestParam("gramp") String gp, 
											  @RequestParam("vill") String village) 
	{

		List<FeasibleLandResponse> details = mobileApi.getAllFesLanddetails(dist, tehsil, gp, village);
		return details;

	}
	
	@PostMapping("/insertFieldData")
	public ResponseEntity<?> insertFieldReporting(@RequestParam(value = "model", required = false) String fieldReporting,
			                                      @RequestParam(value = "img", required = false) MultipartFile img)
	{
		ObjectMapper mapper = new ObjectMapper();
		fieldReportingDto fieldRepor=null;
		try 
		{
			fieldRepor = mapper.readValue(fieldReporting, fieldReportingDto.class);
			if (img!=null) 
			{
				fieldRepor.setImg(img);
			}
		} 
		catch (JsonMappingException e1) {
			e1.printStackTrace();
		} catch (JsonProcessingException e1) {
			e1.printStackTrace();
		}
		ResponseEntity<?> insertFieldReporting = mobileApi.insertFieldReporting(fieldRepor);
		return insertFieldReporting;	
	}
	
	@GetMapping(value = "/dashBoard")
	public DashboardFilterDto dashBoard(@RequestParam String dist)
	{
		DashboardFilterDto countAll = mobileApi.getDashboardCountAll(dist);
		return countAll;		
	}

}
