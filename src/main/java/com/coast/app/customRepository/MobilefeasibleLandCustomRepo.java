package com.coast.app.customRepository;

import java.util.List;

import com.coast.app.dto.Feasible_Land_DTO;

public interface MobilefeasibleLandCustomRepo {
	List<Feasible_Land_DTO> getAllFesLanddetails_vill(String dist, String tehsil, String gp, String village);

	List<Feasible_Land_DTO> getAllFesLanddetails_gp(String dist, String tehsil, String gp);

	List<Feasible_Land_DTO> getAllFesLanddetails_teh(String dist, String tehsil);

	List<Feasible_Land_DTO> getAllFesLanddetails_dist(String dist);

	List<Feasible_Land_DTO> getAllFesLanddetailsAll_vill(String dist, String tehsil, String gp, String village);

}
