package com.coast.app.service;

import java.util.List;

import com.coast.app.entity.Baleshwar_Plots;

public interface AnalyticPlotDetailsServuce {

	List<Baleshwar_Plots> getAnalyticPlot(String dist, String tehsil, String gp, String village, String plotno);

}
