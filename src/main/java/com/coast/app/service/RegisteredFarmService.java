package com.coast.app.service;

import java.util.List;

import com.coast.app.dto.Registered_Farm_DTO;

public interface RegisteredFarmService {
	public List<Registered_Farm_DTO> getRegFarm(String dist, String tehsil, String gp, String village, String query);
}
