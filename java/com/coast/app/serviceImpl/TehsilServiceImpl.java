package com.coast.app.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coast.app.repository.BaleswarPlotNoRepository;
import com.coast.app.repository.StudyAreaVillagesRepository;
import com.coast.app.service.TehsilService;

@Service
public class TehsilServiceImpl implements TehsilService {

	@Autowired
	private StudyAreaVillagesRepository studyAreaVillagesRepository;

	//@Autowired
	//private BaleswarPlotNoRepository baleswarPlotNoRepository;

	@Override
	public List<String> findbydist(String dist) {
		List<String> tehsilByDistrict = studyAreaVillagesRepository.getTehsil(dist);
		return tehsilByDistrict;
	}

	public List<String> findbydisttehsil(String dist, String tehsil) {
		List<String> GpByDistrictTehsil = studyAreaVillagesRepository.getGp(dist, tehsil);
		return GpByDistrictTehsil;
	}

	public List<String> findbydisttehsilgp(String dist, String tehsil, String gp) {
		List<String> VillageByDistrictTehsilGp = studyAreaVillagesRepository.getVillage(dist, tehsil, gp);
		return VillageByDistrictTehsilGp;
	}

	@Override
	public List<String> findbydistAndtehsil(String dist, String tehsil) {
		List<String> VillageByDistrictTehsil = studyAreaVillagesRepository.getVillage(dist, tehsil);
		return VillageByDistrictTehsil;
	}

	/*public List<String> findbydisttehsilgpvillage(String dist, String tehsil, String gp, String village) 
	{
		if (dist == "Baleshwar") {
			return baleswarPlotNoRepository.getPlotno(dist,tehsil, gp, village);
		} else if (dist == "Bhadrak") {
			return baleswarPlotNoRepository.getPlotno(dist,tehsil, gp, village);
		} else if (dist == "Cuttack") {
			return baleswarPlotNoRepository.getPlotno(dist,tehsil, gp, village);
		} else if (dist == "Ganjam") {
			return baleswarPlotNoRepository.getPlotno(dist,tehsil, gp, village);
		} else if (dist == "Jajpur") {
			return baleswarPlotNoRepository.getPlotno(dist,tehsil, gp, village);
		} else if (dist == "Khurdha") {
			return baleswarPlotNoRepository.getPlotno(dist,tehsil, gp, village);
		} else if (dist == "Puri") {
			return baleswarPlotNoRepository.getPlotno(dist,tehsil, gp, village);
			
		} else if (dist == "Kendrapara") {
			return baleswarPlotNoRepository.getPlotno(dist,tehsil, gp, village);
		} else {
			return baleswarPlotNoRepository.getPlotno(dist,tehsil, gp, village);
		}*/

	}

