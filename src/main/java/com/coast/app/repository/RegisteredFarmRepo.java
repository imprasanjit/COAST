package com.coast.app.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.coast.app.dto.Registered_Farm_DTO;

public interface RegisteredFarmRepo extends CrudRepository<Registered_Farm_DTO, Integer> {
	//List<Registered_Farm_DTO> getRegFarm(String dist, String tehsil, String gp, String village,String query);

}
