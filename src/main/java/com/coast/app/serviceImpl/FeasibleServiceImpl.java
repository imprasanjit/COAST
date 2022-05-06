package com.coast.app.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.FeasibleLandRepoCustom;
import com.coast.app.dto.Feasible_Land_DTO;
import com.coast.app.service.FeasibleService;

@Service
public class FeasibleServiceImpl implements FeasibleService {

	@Autowired
	private FeasibleLandRepoCustom feasibleLandRepo;

	@Override
	public List<Feasible_Land_DTO> getAllFesLanddetails(String dist, String tehsil, String gp, String village,String query) 
	{
		List<Feasible_Land_DTO> allFesLanddetails = null;
		/*
		 * if (dist.equals("Khurda")) { dist="Khurdha"; }
		 */
		if (!dist.equalsIgnoreCase("all")) {
			if (!tehsil.equalsIgnoreCase("all")) {
				if (!gp.equalsIgnoreCase("all")) {
					if (!village.equalsIgnoreCase("all")) {
						if (!query.equalsIgnoreCase("all")) {
							allFesLanddetails = feasibleLandRepo.getAllFesLanddetails_vill(dist, tehsil, gp, village,
									query);

						} else {
							allFesLanddetails = feasibleLandRepo.getAllFesLanddetailsAll_vill(dist, tehsil, gp,
									village, query);
						}
					} else {
						
							allFesLanddetails = feasibleLandRepo.getAllFesLanddetails_gp(dist, tehsil, gp, query);
					}

					}

				 else {
					
						allFesLanddetails = feasibleLandRepo.getAllFesLanddetails_teh(dist, tehsil, query);
					}
				}
			 else {
				
					allFesLanddetails = feasibleLandRepo.getAllFesLanddetails_dist(dist,query);
			 }

		}
		return allFesLanddetails;

	}
}
