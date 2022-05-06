package com.coast.app.customRepository;

import java.util.List;

import com.coast.app.entity.Baleshwar_Aquaponds;



public interface BaleshwarAquapondRepositoryCustom 
{

	List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String tehsil, String gp, String village, String query);

	List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String tehsil, String gp, String query);
	
	List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String tehsil, String query);

	List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String query);

}
