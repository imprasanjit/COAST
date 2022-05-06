package com.coast.app.customRepository;

import java.util.List;

import com.coast.app.dto.BaleshwarLeasPlotsDTO;
import com.coast.app.dto.GovtLandSummaryDTO;
import com.coast.app.entity.Tehsil_summary;
import com.coast.app.entity.Village_Summary;

public interface ReportRepositoryCustom 
{
	//List<GovtLandSummaryDTO> getGovtLandSummary(String actioncode, String distname, String tehsilname, String gpname,String villagename);
	
	//List<GovtLandSummaryDTO> getGovtLandSummary(String actionCode, String district, String tehsil, String gp);
	
	List<GovtLandSummaryDTO> getGovtLandSummary(String actionCode, String district, String tehsil);

	//List<GovtLandSummaryDTO> getGovtLandSummary(String actionCode, String district);
	List<Tehsil_summary> getTehsilLandSummary( String district, String tehsil);

	List<Tehsil_summary> getAllDistrictLandSummary();

	//List<Village_Summary> getVillageareasummary(String district);

	List<Village_Summary> getVillageareasummarybyDistTeh(String district, String tehsil);

	List<Village_Summary> getVillageareasummarybyAll(String district, String tehsil, String village);

	List<Object> getDTRSummaryReport(String lon,String lat);

	List<Object> getDTRReport(String village);

	//List<Tehsil_summary> getAllDistrictLandSummary(String district);

	//List<Tehsil_summary> getAllTehsilLandSummary(String district);

	List<Tehsil_summary> getAllTehsilLandSummary();

	List<Village_Summary> getVillageareasummary();

	//List<Village_Summary> getVillageareasummary(String district);
	
}