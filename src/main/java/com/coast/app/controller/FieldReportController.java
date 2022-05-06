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
import org.springframework.web.servlet.ModelAndView;

import com.coast.app.entity.Tbl_field_Reporting;
import com.coast.app.service.SurveyFieldReportService;
import com.google.gson.Gson;

@Controller
@Scope("session") 
public class FieldReportController  
{	
	@Autowired
	SurveyFieldReportService surveyFieldReportService;
	
	@RequestMapping(value = "/ViewFieldReport")
	public ModelAndView ViewFieldReport() {
		ModelAndView mav = new ModelAndView("ViewFieldReport");
		return mav;

	}
	@ResponseBody
	@RequestMapping(value = "/getsurveydata", method = RequestMethod.GET)
	public String getsurveydata(@RequestParam("dist") String dist, 
								  @RequestParam("tehsil") String tehsil,
								  @RequestParam("gp") String gp, 
								  @RequestParam("village") String village,HttpSession session)
	{
		List<Tbl_field_Reporting> details = surveyFieldReportService.getSurveyField_Report(dist, tehsil, gp, village);
		Gson gson = new Gson();
		String jsonvillage = gson.toJson(details);
		return jsonvillage;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getImage", method = RequestMethod.GET)
	public String getImage(@RequestParam("image") String image)
	{
		//List<Tbl_field_Reporting> details = surveyFieldReportService.getSurveyField_Report(dist, tehsil, gp, village);
		Gson gson = new Gson();
		//String jsonvillage = gson.toJson(details);
		return null;
	}
}
