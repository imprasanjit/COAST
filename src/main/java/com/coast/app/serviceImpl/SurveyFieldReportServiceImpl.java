package com.coast.app.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.SurveyFieldReportRepoCustom;
import com.coast.app.entity.Tbl_field_Reporting;
import com.coast.app.service.SurveyFieldReportService;

@Service
public class SurveyFieldReportServiceImpl implements SurveyFieldReportService {
	@Autowired
	private SurveyFieldReportRepoCustom surveyFieldReportCustomRepo;

	@Override
	public List<Tbl_field_Reporting> getSurveyField_Report(String dist, String tehsil, String gp, String village) {
		List<Tbl_field_Reporting> tbl_field_Reporting = null;
		if (!dist.equalsIgnoreCase("ALL")) {
			if (!tehsil.equalsIgnoreCase("ALL")) {
				if (!gp.equalsIgnoreCase("ALL")) {
					if (!village.equalsIgnoreCase("ALL")) {
						tbl_field_Reporting = surveyFieldReportCustomRepo.getField_Reportings(dist, tehsil, gp,
								village);
					} else {
						tbl_field_Reporting = surveyFieldReportCustomRepo.getField_ReportingsAll(dist, tehsil, gp);

					}
				} else {
					tbl_field_Reporting = surveyFieldReportCustomRepo.getField_ReportingsAll(dist, tehsil);
				}
			} else {
				tbl_field_Reporting = surveyFieldReportCustomRepo.getField_ReportingsAll(dist);
			}
		} else {			tbl_field_Reporting = surveyFieldReportCustomRepo.getField_ReportingsAll();	}
		return tbl_field_Reporting;

	}

}
