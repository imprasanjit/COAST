package com.coast.app.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.coast.app.customRepository.SurveyFieldReportRepoCustom;
import com.coast.app.entity.Tbl_field_Reporting;

public interface SurveyFieldReportRepo extends CrudRepository<Tbl_field_Reporting,Integer>{

	//List<Tbl_field_Reporting> getSurveyField_Report(String dist, String tehsil, String gp, String village);
	//List<Tbl_field_Reporting> getField_Reportings(String dist, String tehsil, String gp, String village);

}
