package com.coast.app.customRepository;

import java.util.List;

import com.coast.app.entity.Baleshwar_Feasible_Land;

public interface BaleshwarFeasibleLandRepoCustom {
	List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String tehsil, String gp, String village,
			String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String tehsil, String gp, String village,
			String query);
	

	List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String tehsil, String gp, String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String tehsil, String gp, String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String tehsil, String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String tehsil, String query);
	
	List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String query);
}
