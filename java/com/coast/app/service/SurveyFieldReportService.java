package com.coast.app.service;

import java.util.List;


import com.coast.app.entity.Tbl_field_Reporting;

public interface SurveyFieldReportService {
	List<Tbl_field_Reporting> getSurveyField_Report(String dist, String tehsil, String gp, String village);
	
	//List<Tbl_field_Reporting> getField_Reportings(String dist, String tehsil, String gp, String village);
	
   //List<Tbl_field_Reporting> 
}
