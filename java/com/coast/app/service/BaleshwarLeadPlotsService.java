package com.coast.app.service;

import java.util.List;

import com.coast.app.dto.BaleshwarLeasPlotsDTO;
import com.coast.app.entity.Baleshwar_Aquaponds;
import com.coast.app.entity.Baleshwar_Feasible_Land;
import com.coast.app.entity.Baleshwar_Leas_Plots;
import com.coast.app.entity.User_Details;

public interface BaleshwarLeadPlotsService {

	List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String tehsil, String gp, String village,String query);

	List<Baleshwar_Aquaponds> getAquapond(String dist, String tehsil, String gp, String village, String query);

	List<Baleshwar_Leas_Plots> getRegFarm(String dist, String tehsil, String gp, String village, String query);

	List<User_Details> getAllUser();

}
