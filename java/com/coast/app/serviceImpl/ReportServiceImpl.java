package com.coast.app.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.ReportRepositoryCustom;
import com.coast.app.dto.GovtLandSummaryDTO;
import com.coast.app.entity.Tehsil_summary;
import com.coast.app.entity.Village_Summary;
import com.coast.app.repository.ReportRepository;
import com.coast.app.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService {
	
	/*
	 * @Autowired private ReportRepository reportRepository;
	 */
	@Autowired
	private ReportRepositoryCustom reportRepositoryCustom;

	@Override
	public List<GovtLandSummaryDTO> getGovtLandSummary(String actionCode,String district, String tehsil, String gp, String village) {
		// List<GovtLandSummaryDTO> dto=new ArrayList<GovtLandSummaryDTO>();
		 List<GovtLandSummaryDTO> govtLandSummary=null;
		if(actionCode.equals("GT")) {
			actionCode=district.toLowerCase()+"_govt_land";
			if(!tehsil.equals("ALL")) {
				if(!gp.equals("ALL")) {
					if(!village.equals("ALL")) {
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil, gp, village);
					}else {
						govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil, gp);
					}
				}else {
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil);
				}
			}else {
				govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district);
			}
		}
		
		else if(actionCode.equals("FT")) {
			actionCode=district.toLowerCase()+"_feasible_land";
			if(!tehsil.equals("ALL")) {
				if(!gp.equals("ALL")) {
					if(!village.equals("ALL")) {
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil, gp, village);
					}else {
						govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil, gp);
					}
				}else {
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil);
				}
			}else {
				govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district);
			}
		
			
		}else if(actionCode.equals("LT")) {
			actionCode=district.toLowerCase()+"_leas_plots";
			if(!tehsil.equals("ALL")) {
				if(!gp.equals("ALL")) {
					if(!village.equals("ALL")) {
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil, gp, village);
					}else {
						govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil, gp);
					}
				}else {
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil);
				}
			}else {
				govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district);
			}
		
			
		}else if(actionCode.equals("AQ")) {
			actionCode=district.toLowerCase()+"_aquaponds";
			if(!tehsil.equals("ALL")) {
				if(!gp.equals("ALL")) {
					if(!village.equals("ALL")) {
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil, gp, village);
					}else {
						govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil, gp);
					}
				}else {
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil);
				}
			}else {
				govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district);
			}
		
			
		}
	
		return  govtLandSummary;		
	}

	@Override
	public List<Tehsil_summary> getTehsilAreaSummary(String district) {
		List<Tehsil_summary> tehsilAreaSummary=null;
		if(district.equalsIgnoreCase("ALL"))
			tehsilAreaSummary=reportRepositoryCustom.getAllDistrictLandSummary();
		else
			tehsilAreaSummary=reportRepositoryCustom.getTehsilLandSummary(district);
			
		return tehsilAreaSummary;
	}

	@Override
	public List<Village_Summary> getVillageAreaSummary(String district, String tehsil, String village) 
	{
		List<Village_Summary> villageAreaSummary=null;
		if(district!=null) 
		{
			if(tehsil.equalsIgnoreCase("ALL")) 
			{
				
				villageAreaSummary=reportRepositoryCustom.getVillageareasummary(district);
			}
			else 
				if(village.equalsIgnoreCase("ALL")) 
				{
				villageAreaSummary=reportRepositoryCustom.getVillageareasummarybyDistTeh(district,tehsil);
				}
				else
				villageAreaSummary=reportRepositoryCustom.getVillageareasummarybyAll(district,tehsil,village);
		
		}
		
		return villageAreaSummary;
	
	}
}
