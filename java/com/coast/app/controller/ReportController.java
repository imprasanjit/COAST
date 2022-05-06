package com.coast.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.coast.app.dto.GovtLandSummaryDTO;
import com.coast.app.entity.Tehsil_summary;
import com.coast.app.entity.Village_Summary;
import com.coast.app.service.ReportService;

/**
 * @author Prasanjit
 *
 */
@Controller
@Scope("session") 
@RequestMapping(value="/report")
public class ReportController {

		@Autowired
		private ReportService reportService;
		
		@RequestMapping(value = "/reportView/{type}")
		public ModelAndView reportView(@PathVariable String type,  HttpServletRequest request, HttpSession session) 
		{
			session = request.getSession();
			ModelAndView mav = new ModelAndView("ReportView");
			if(type.equals("GT"))
			{
				session.setAttribute("type_name", "Government Land");
			}else if(type.equals("FT"))
			{
				session.setAttribute("type_name", "Feasible Land");
			}
			else if(type.equals("LT"))
			{
				session.setAttribute("type_name", "Leased Farm Land");
			}		
			else if(type.equals("AQ"))
			{
				session.setAttribute("type_name", "Aquaculture Pond Land");
			}
			mav.addObject("type", type);		
			return mav;
		}
		
		
		@RequestMapping(value = "/vill_Summary_report")
		public ModelAndView report(HttpSession session) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("villSummaryReport");
			return modelAndView;
		}

		@ResponseBody
		@RequestMapping(value="/getGovtLandSummary", method = RequestMethod.GET)
		public List<GovtLandSummaryDTO> getGovtLandSummary(@RequestParam("district") String district, 
														   @RequestParam("tehsil") String tehsil,
														   @RequestParam("gp") String gp, 
														   @RequestParam("village") String village,
														   @RequestParam("actionCode")String actionCode,HttpSession session) 
		{
			if (district.equalsIgnoreCase("jajapur")) {
				district="jajpur";
				List<GovtLandSummaryDTO> govtLandSummary = reportService.getGovtLandSummary(actionCode,district, tehsil, gp, village);
				return govtLandSummary;
			}
			
			else {
				List<GovtLandSummaryDTO> govtLandSummary = reportService.getGovtLandSummary(actionCode,district, tehsil, gp, village);
				return govtLandSummary;
			}
			}
		
		@RequestMapping(value = "/tehsil_summary_report")
		public ModelAndView reportViews(HttpSession session) 
		{
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("tehsilSummaryReport");
			return modelAndView;
		}
		
		@ResponseBody
		@RequestMapping(value="/getTehsilSummaryReport", method = RequestMethod.GET)
		public List<Tehsil_summary> getTehsilAreaSummary(@RequestParam("district") String district,HttpSession session) 
		{
			List<Tehsil_summary> govtLandSummary = reportService.getTehsilAreaSummary(district);
			return govtLandSummary;
						
		}
			
		
		@RequestMapping(value="/getVillageSummaryReport", method = RequestMethod.GET)
		@ResponseBody
		public List<Village_Summary> getVillageAreaSummary(@RequestParam("district") String district,
														   @RequestParam("tehsil") String tehsil,
														   @RequestParam("village") String village, HttpSession session) 
		{

			List<Village_Summary> govtLandSummary = reportService.getVillageAreaSummary(district,tehsil,village);

			return govtLandSummary;
		}
}
