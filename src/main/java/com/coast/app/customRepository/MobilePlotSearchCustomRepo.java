package com.coast.app.customRepository;

import java.util.List;

import com.coast.app.dto.PlotDto;

public interface MobilePlotSearchCustomRepo 
{
	List<String> getPlot(String dist, String tehsil, String gp, String village);

}
