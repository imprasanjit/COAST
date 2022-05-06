package com.coast.app.serviceImpl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.ReportRepositoryCustom;
import com.coast.app.dto.BaleshwarLeasPlotsDTO;
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
	public List<GovtLandSummaryDTO> getGovtLandSummary(String actionCode,String district, String tehsil) {
		// List<GovtLandSummaryDTO> dto=new ArrayList<GovtLandSummaryDTO>();
		 List<GovtLandSummaryDTO> govtLandSummary=null;
		if(actionCode.equals("GT")) {
			actionCode=district.toLowerCase()+"_govt_land";
			if(!tehsil.equals("ALL")) {				
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil);			
				}		
		}else if(actionCode.equals("FT")) {
			actionCode=district.toLowerCase()+"_feasible_land";
			if(!tehsil.equals("ALL")) {			
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil);
				}
			
		}else if(actionCode.equals("LT")) {
			actionCode=district.toLowerCase()+"_leas_plots";
			if(!tehsil.equals("ALL")) {				
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil);
			}
		}else if(actionCode.equals("AQ")) {
			actionCode=district.toLowerCase()+"_aquaponds";
			if(!tehsil.equals("ALL")) {
				
					govtLandSummary = reportRepositoryCustom.getGovtLandSummary(actionCode, district, tehsil);				
		}
		}
		return  govtLandSummary;		
	}
	@Override
	public List<Tehsil_summary> getAllTehsilLandSummary(String district) {
		List<Tehsil_summary> tehsilAreaSummary=null;
		if(district.equalsIgnoreCase("ALL"))
			tehsilAreaSummary=reportRepositoryCustom.getAllTehsilLandSummary();
		return tehsilAreaSummary;
	}
	@Override
	public List<Tehsil_summary> getTehsilAreaSummary(String district,String tehsil) {
		List<Tehsil_summary> tehsilAreaSummary=null;		
			tehsilAreaSummary=reportRepositoryCustom.getTehsilLandSummary(district,tehsil);
			
		return tehsilAreaSummary;
	}

	@Override
	public List<Village_Summary> getVillageAreaSummary(String district, String tehsil, String village) 
	{
		List<Village_Summary> villageAreaSummary=null;
		if(district!=null) {
			/*
			 * { if(tehsil.equalsIgnoreCase("ALL")) {
			 * 
			 * villageAreaSummary=reportRepositoryCustom.getVillageareasummary(district); }
			 * else if(village.equalsIgnoreCase("ALL")) {
			 * villageAreaSummary=reportRepositoryCustom.getVillageareasummarybyDistTeh(
			 * district,tehsil); } else
			 */
				villageAreaSummary=reportRepositoryCustom.getVillageareasummarybyAll(district,tehsil,village);
		
		}
		
		return villageAreaSummary;
	
	}
	@Override
	public List<Village_Summary> getAllVillageAreaSummary(String district) {
		// TODO Auto-generated method stub
		List<Village_Summary> villageAreaSummary=null;
		villageAreaSummary=reportRepositoryCustom.getVillageareasummary();
		return villageAreaSummary;
	}
	@Override
	public List<BaleshwarLeasPlotsDTO> getDTRSummaryReport(String Village) {
		List<BaleshwarLeasPlotsDTO> tehsilAreaSummary=new ArrayList<BaleshwarLeasPlotsDTO>();
		List<Object> listdtr=reportRepositoryCustom.getDTRReport(Village);
		Iterator<Object> iterator = listdtr.iterator();
		while (iterator.hasNext()) {
			Object[] next = (Object[]) iterator.next();
			if(next[0]!= null) 
			{
			   String village=String.valueOf(next[0]);
			   String dtrno=String.valueOf(next[1]);
			   String latitude=String.valueOf(next[2]);
			   String longitude=String.valueOf(next[3]);
			   List<Object> list=reportRepositoryCustom.getDTRSummaryReport(longitude,latitude);
				Iterator<Object> iterator2 = list.iterator();
				while (iterator2.hasNext()) {
					Object[] next2 = (Object[]) iterator2.next();
					if(next[0]!= null) 
				     {
						BaleshwarLeasPlotsDTO dto=new BaleshwarLeasPlotsDTO();
						 dto.setVillName(String.valueOf(next2[0]));
						 dto.setPlotNo(String.valueOf(next2[1]));
						 dto.setGpName(String.valueOf(next2[2]));
						 dto.setTehName(String.valueOf(next2[3]));
						 dto.setDtrno(dtrno);
						 dto.setLat(latitude);
						 dto.setLon(longitude);
						 dto.setAreaAc(Double.parseDouble(String.valueOf(next2[4])));
						 dto.setRegNo(String.valueOf(next2[5]));
						 dto.setDate (String.valueOf(next2[6]));
						 dto.setName(String.valueOf(next2[7]));
						dto.setFname(String.valueOf(next2[8]));
						dto.setAddress(String.valueOf(next2[9]));
						dto.setWsa(String.valueOf(next2[10]));
						dto.setStatus(String.valueOf(next2[11]));
						dto.setKhataNo(String.valueOf(next2[12]));
						dto.setCaaOsp(String.valueOf(next2[13]));
						dto.setApExist(String.valueOf(next2[14]));
						dto.setApAc(Double.parseDouble(String.valueOf(next2[15])));
						dto.setGlAc(Double.parseDouble(String.valueOf(next2[16])));
						tehsilAreaSummary.add(dto);
					}
				 }
			}
		}

		return tehsilAreaSummary;
	}
	
	
	
}
