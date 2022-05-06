package com.coast.app.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.AnalyticPlotDetailsCustomRepo;
import com.coast.app.entity.Baleshwar_Plots;
import com.coast.app.entity.Tbl_field_Reporting;
import com.coast.app.repository.AnalyticPlotDetailsRepo;
import com.coast.app.service.AnalyticPlotDetailsServuce;
import com.coast.app.service.AnalyticsPlotsDTO;

@Service
public class AnalyticplotDetailsServuceImpl implements AnalyticPlotDetailsServuce {

	/*
	 * @Autowired private AnalyticPlotDetailsRepo analyticPlotDetailsRepo;
	 */
	
	@Autowired
	private AnalyticPlotDetailsCustomRepo analyticPlotDetailsCustomRepo;

	
	@Override
	public List<Baleshwar_Plots> getAnalyticPlot(String dist, String tehsil, String gp, String village, String plotno) 
	{
		List<Baleshwar_Plots> plotDetails = null;
		if (dist.equals("Khurda")) 
		{
			dist="Khurdha";
		}
		if (!dist.equalsIgnoreCase("ALL")) {
			if (!tehsil.equalsIgnoreCase("ALL")) {
				if (!gp.equalsIgnoreCase("ALL")) {
					if (!village.equalsIgnoreCase("ALL")) {
						if (!plotno.equals("plotno is NOT null")) {
							plotDetails = analyticPlotDetailsCustomRepo.getPlotDetails_vill(dist, tehsil, gp, village, plotno);
						}
							else {
								plotDetails =  analyticPlotDetailsCustomRepo.getPlotDetails_Allvill(dist, tehsil, gp, village,plotno);
							}
						}
					else if(!plotno.equals("plotno is NOT null"))
					{
						plotDetails =  analyticPlotDetailsCustomRepo.getPlotDetails_gp(dist, tehsil, gp , plotno);
					}
					else {
						plotDetails =  analyticPlotDetailsCustomRepo.getPlotDetails_gpAll(dist, tehsil, gp , plotno);
					}
					

				}
				else if(!plotno.equals("plotno is NOT null"))
				{
					plotDetails =  analyticPlotDetailsCustomRepo.getPlotDetails_tehsil(dist, tehsil, plotno);
				}
				else
				{
					plotDetails =  analyticPlotDetailsCustomRepo.getPlotDetails_tehsilAll(dist, tehsil, plotno);
				}
			}
			else if(!plotno.equals("plotno is NOT null")){
				plotDetails =  analyticPlotDetailsCustomRepo.getPlotDetails_dist(dist, plotno);
			}
			else
			{
				plotDetails =  analyticPlotDetailsCustomRepo.getPlotDetails_distAll(dist, plotno);
			}
		}
		return plotDetails;
	}
}
