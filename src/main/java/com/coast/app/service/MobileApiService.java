package com.coast.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.coast.app.dto.CadastralSearchPlot_DTO;
import com.coast.app.dto.DashboardDto;
import com.coast.app.dto.DashboardFilterDto;
import com.coast.app.dto.DistrictDTO;
import com.coast.app.dto.FeasibleLandResponse;
import com.coast.app.dto.PlotDto;
import com.coast.app.dto.StudyAreaVillagesDto;
import com.coast.app.dto.fieldReportingDto;
import com.coast.app.serviceImpl.GpDto;
import com.coast.app.serviceImpl.VillageDto;

public interface MobileApiService 
{
	ResponseEntity<?> aunthetictaeUser(String email, String password);
	
	public List<StudyAreaVillagesDto> findbydist(String dist);

	public List<GpDto> findbydisttehsil(String dist, String tehsil);

	public List<VillageDto> findbydisttehsilgp(String dist, String tehsil, String gp);

	public List<StudyAreaVillagesDto> findbydistAndtehsil(String dist, String tehsil);
	
	List<FeasibleLandResponse> getAllFesLanddetails(String dist, String tehsil, String gp, String village);
	
	ResponseEntity<?> insertFieldReporting(fieldReportingDto fieldReporting);
	
	DashboardFilterDto getDashboardCountAll(String dist);

	List<DistrictDTO> getAllDistrict();

	List<PlotDto> findplotbydisttehsilgp(String dist, String tehsil, String gp, String village);
}
