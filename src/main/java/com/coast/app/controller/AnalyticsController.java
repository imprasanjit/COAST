package com.coast.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coast.app.dto.Feasible_Land_DTO;
import com.coast.app.dto.Registered_Farm_DTO;
import com.coast.app.entity.Baleshwar_Aquaponds;
import com.coast.app.entity.Baleshwar_Plots;
import com.coast.app.service.AnalyticPlotDetailsServuce;
import com.coast.app.service.BaleshwarLeadPlotsService;
import com.coast.app.service.FeasibleService;
import com.coast.app.service.RegisteredFarmService;
import com.google.gson.Gson;

/**
 * @author Prasanjit
 *
 */
@Controller
@Scope("session") 
public class AnalyticsController {
	@Autowired
	private FeasibleService feasibleService;
	
	@Autowired
	private AnalyticPlotDetailsServuce analyticPlotDetailsServuce;
	@Autowired
	private RegisteredFarmService registeredFarmService;
	@Autowired
	private BaleshwarLeadPlotsService baleshwarLeadPlotsService;
	
	@ResponseBody
	@RequestMapping(value = "/getFesLand", method = RequestMethod.GET)
	public List<Feasible_Land_DTO> getFesLand(@RequestParam("dist") String dist, 
											  @RequestParam("tehsil") String tehsil,
											  @RequestParam("gp") String gp, 
											  @RequestParam("village") String village,
											  @RequestParam("query") String query,HttpSession session) {
		var district="";
		if (dist.equalsIgnoreCase("jajapur")) {
			district="jajpur";
			List<Feasible_Land_DTO> details = feasibleService.getAllFesLanddetails(district, tehsil, gp, village, query);
			return details;
		}
		/*
		 * if (dist.equalsIgnoreCase("Khurda")) { district="Khurdha"; }
		 */
		else {
			List<Feasible_Land_DTO> details = feasibleService.getAllFesLanddetails(dist, tehsil, gp, village, query);
			return details;
		}
		
		

	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getAquapond", method = RequestMethod.GET)
	public List<Baleshwar_Aquaponds> getAquaPond(@RequestParam("dist") String dist,
												 @RequestParam("tehsil") String tehsil, 
												 @RequestParam("gp") String gp,
												 @RequestParam("village") String village, 
												 @RequestParam("query") String query,HttpSession session) 
	{
		var district="";
		if (dist.equalsIgnoreCase("jajapur")) {
			district="jajpur";
			List<Baleshwar_Aquaponds> details = baleshwarLeadPlotsService.getAquapond(district, tehsil, gp, village, query);
			return details;
		}
		else {
			List<Baleshwar_Aquaponds> details = baleshwarLeadPlotsService.getAquapond(dist, tehsil, gp, village, query);
			return details;			
		}		
	}
	
	@ResponseBody
	@RequestMapping(value = "/getRegFarm", method = RequestMethod.GET)
	public String getRegFarm(@RequestParam("dist") String dist, 
			 				 @RequestParam("tehsil") String tehsil,
			                 @RequestParam("gp") String gp, 
			                 @RequestParam("village") String village,
			                 @RequestParam("query") String query,HttpSession session) 
	{

		List<Registered_Farm_DTO> details = registeredFarmService.getRegFarm(dist, tehsil, gp, village, query);
		Gson gson = new Gson();
		String jsonvillage = gson.toJson(details);
		return jsonvillage; 
	}
		
	@ResponseBody
	@RequestMapping(value = "/getAnalyticPlot", method = RequestMethod.GET)
	public String getAnalyticPlot(@RequestParam("dist") String dist, 
								  @RequestParam("tehsil") String tehsil,
								  @RequestParam("gp") String gp, 
								  @RequestParam("village") String village,
								  @RequestParam("plotno") String plotno,HttpSession session) 
	{
		var district="";
		if (dist.equalsIgnoreCase("jajapur")) {
			district="jajpur";
			List<Baleshwar_Plots> details = analyticPlotDetailsServuce.getAnalyticPlot(district, tehsil, gp, village, plotno);
			Gson gson = new Gson();
			String jsonvillage = gson.toJson(details);
			return jsonvillage;
		}
		else 
		{
		List<Baleshwar_Plots> details = analyticPlotDetailsServuce.getAnalyticPlot(dist, tehsil, gp, village, plotno);
		Gson gson = new Gson();
		String jsonvillage = gson.toJson(details);
		return jsonvillage;
		}
		//List<Baleshwar_Plots> details = analyticPlotDetailsServuce.getAnalyticPlot(dist, tehsil, gp, village, plotno);
		
	}
	

}
