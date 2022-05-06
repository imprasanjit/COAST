package com.coast.app.customRepository;

import java.util.List;

import com.coast.app.dto.Feasible_Land_DTO;
import com.coast.app.dto.Registered_Farm_DTO;

public interface RegisteredFarmRepoCustom {

	// List<Feasible_Land_DTO> getAllFesLanddetails_vill(String dist, String tehsil,
	// String gp, String village,String query);

	// List<Feasible_Land_DTO> getRegFarm(String dist, String tehsil, String
	// gp,String query);

	// List<Feasible_Land_DTO> getRegFarm(String dist, String tehsil,String query);

	// List<Feasible_Land_DTO> getRegFarm(String dist,String query);
	List<Object> getAquaPondAreaByDist(String dist);

	List<Object> getGovtLandInfoByDist(String dist);

	List<Object> getGovtFeasLandInfoChartByDist(String dist);

	List<Registered_Farm_DTO> getRegFarm_vill(String dist, String tehsil, String gp, String village, String query);

	List<Registered_Farm_DTO> getRegFarm_All_gp(String dist, String tehsil, String gp, String query);

	List<Registered_Farm_DTO> getRegFarm_tehsil_All(String dist, String tehsil, String query);

	List<Registered_Farm_DTO> getRegFarm_dist_All(String dist, String query);

	List<Registered_Farm_DTO> getRegFarmAll_vill(String dist, String tehsil, String gp, String village, String query);

}
