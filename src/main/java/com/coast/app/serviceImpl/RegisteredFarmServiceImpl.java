package com.coast.app.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.RegisteredFarmRepoCustom;
import com.coast.app.dto.Registered_Farm_DTO;
import com.coast.app.entity.Baleshwar_Leas_Plots;
import com.coast.app.service.RegisteredFarmService;
@Service
public class RegisteredFarmServiceImpl implements RegisteredFarmService {
	@Autowired
	private RegisteredFarmRepoCustom registeredFarmRepoCustom;
	@Override
	public List<Registered_Farm_DTO> getRegFarm(String dist, String tehsil, String gp, String village, String query) {
		List<Registered_Farm_DTO> regFarm = null;
		if (dist.equals("Khurda")) 
		{
			dist="Khurdha";
		}
		if (!dist.equalsIgnoreCase("ALL")) {
			if (!tehsil.equalsIgnoreCase("ALL")) {
				if (!gp.equalsIgnoreCase("ALL")) {
					if (!village.equalsIgnoreCase("ALL")) {
						if (!query.equals("ALL")) {
							regFarm = registeredFarmRepoCustom.getRegFarm_vill(dist, tehsil, gp, village, query);

						} else {
							regFarm = registeredFarmRepoCustom.getRegFarmAll_vill(dist, tehsil, gp, village, query);

						}
					} else {
							regFarm = registeredFarmRepoCustom.getRegFarm_All_gp(dist, tehsil, gp, query);

						}             		

				} else 
					 {
						regFarm = registeredFarmRepoCustom.getRegFarm_tehsil_All(dist, tehsil, query);

					}
				}
			 else 
				 {
					regFarm = registeredFarmRepoCustom.getRegFarm_dist_All(dist, query);

				}
			
			
		}
			
		return regFarm;
	}


}
