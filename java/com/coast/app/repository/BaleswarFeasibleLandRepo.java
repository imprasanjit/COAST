package com.coast.app.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.coast.app.customRepository.BaleshwarFeasibleLandRepoCustom;
import com.coast.app.customRepository.BaleshwarLeadPlotsRepoCustom;
import com.coast.app.entity.Baleshwar_Feasible_Land;
import com.coast.app.entity.Baleshwar_Leas_Plots;

public interface BaleswarFeasibleLandRepo extends CrudRepository<Baleshwar_Feasible_Land, Integer>, BaleshwarFeasibleLandRepoCustom {
	List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String tehsil, String gp, String village, String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String tehsil, String gp, String village,String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String tehsil, String gp, String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String tehsil, String gp, String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String tehsil, String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String tehsil, String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String query);

	List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String query);
}
