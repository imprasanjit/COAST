package com.coast.app.service;

import java.util.List;

import com.coast.app.dto.Feasible_Land_DTO;

public interface FeasibleService {

	List<Feasible_Land_DTO> getAllFesLanddetails(String dist, String tehsil, String gp, String village, String query);
	

}
