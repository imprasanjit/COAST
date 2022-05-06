package com.coast.app.customRepository;

import java.util.List;

import com.coast.app.entity.Baleshwar_Plots;

public interface AnalyticPlotDetailsCustomRepo 
{
	
	List<Baleshwar_Plots> getPlotDetails_vill(String dist, String tehsil, String gp, String village, String plotno);

	List<Baleshwar_Plots> getPlotDetails_Allvill(String dist, String tehsil, String gp, String village, String plotno);

	List<Baleshwar_Plots> getPlotDetails_gp(String dist, String tehsil, String gp, String plotno);

	List<Baleshwar_Plots> getPlotDetails_tehsil(String dist, String tehsil, String plotno);

	List<Baleshwar_Plots> getPlotDetails_dist(String dist, String plotno);

	List<Baleshwar_Plots> getPlotDetails_gpAll(String dist, String tehsil, String gp, String plotno);

	List<Baleshwar_Plots> getPlotDetails_tehsilAll(String dist, String tehsil, String plotno);

	List<Baleshwar_Plots> getPlotDetails_distAll(String dist, String plotno);
}
