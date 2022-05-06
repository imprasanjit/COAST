package com.coast.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.coast.app.customRepository.BaleshwarAquapondRepositoryCustom;
import com.coast.app.entity.Baleshwar_Aquaponds;


public interface BalasoreAquaPondRepo extends CrudRepository<Baleshwar_Aquaponds, Integer>
{
	/*
	 * @Query(
	 * value="SELECT DISTNAME,COUNT(*),SUM(AREAHA) FROM BALESHWAR_AQUAPONDS GROUP BY DISTNAME"
	 * ,nativeQuery = true) List<Baleshwar_Aquaponds> getAquaPondArea();
	 * 
	 * List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String tehsil,
	 * String gp, String village, String query);
	 * 
	 * List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String tehsil,
	 * String gp, String query);
	 * 
	 * List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String tehsil,
	 * String query);
	 * 
	 * List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String query);
	 */

	
}
