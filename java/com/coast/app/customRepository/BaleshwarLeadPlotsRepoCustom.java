package com.coast.app.customRepository;

import java.util.List;
import com.coast.app.entity.Baleshwar_Feasible_Land;
import com.coast.app.dto.BaleshwarLeasPlotsDTO;
import com.coast.app.entity.Baleshwar_Leas_Plots;
import com.coast.app.entity.User_Details;

public interface BaleshwarLeadPlotsRepoCustom 
{
	List<Object> getAquaPondAreaByDist(String dist);

	List<Object> getGovtLandInfoByDist(String dist);

	List<Object> getGovtFeasLandInfoChartByDist(String dist);


	List<Baleshwar_Leas_Plots> getAllFesLanddetails(String dist, String tehsil, String gp, String village,
			String query);

	List<Baleshwar_Leas_Plots> getAllFesLanddetailsAll(String dist, String tehsil, String gp, String village,
			String query);
	

	List<Baleshwar_Leas_Plots> getAllFesLanddetails(String dist, String tehsil, String gp, String query);

	List<Baleshwar_Leas_Plots> getAllFesLanddetailsAll(String dist, String tehsil, String gp, String query);

	List<Baleshwar_Leas_Plots> getAllFesLanddetails(String dist, String tehsil, String query);

	List<Baleshwar_Leas_Plots> getAllFesLanddetailsAll(String dist, String tehsil, String query);
	
	List<Baleshwar_Leas_Plots> getAllFesLanddetails(String dist, String query);

	List<Baleshwar_Leas_Plots> getAllFesLanddetailsAll(String dist, String query);
	
	List<Baleshwar_Leas_Plots> getRegFarm(String dist, String tehsil, String gp, String village, String query);

	List<Baleshwar_Leas_Plots> getRegFarm(String dist, String tehsil, String gp, String query);
	
	List<Baleshwar_Leas_Plots> getRegFarm(String dist, String tehsil, String query);

	List<Baleshwar_Leas_Plots> getRegFarm(String dist, String query);
	
	List<User_Details> getAllUser();
}
