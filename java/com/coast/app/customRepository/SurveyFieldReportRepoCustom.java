package com.coast.app.customRepository;

import java.util.List;

import com.coast.app.entity.Tbl_field_Reporting;

public interface SurveyFieldReportRepoCustom {
	List<Tbl_field_Reporting> getField_Reportings(String dist, String tehsil, String gp, String village);

	List<Tbl_field_Reporting> getField_ReportingsAll(String dist, String tehsil, String gp);

	List<Tbl_field_Reporting> getField_ReportingsAll(String dist, String tehsil);

	List<Tbl_field_Reporting> getField_ReportingsAll(String dist);

	List<Tbl_field_Reporting> getField_ReportingsAll();
	}
