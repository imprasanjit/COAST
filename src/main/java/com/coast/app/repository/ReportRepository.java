package com.coast.app.repository;
import java.util.List;

import org.springframework.context.annotation.Primary;
import org.springframework.data.repository.CrudRepository;

import com.coast.app.customRepository.ReportRepositoryCustom;
import com.coast.app.dto.GovtLandSummaryDTO;
import com.coast.app.entity.Baleshwar_Govt_Land;

public interface ReportRepository 
{

	/*
	 * List<GovtLandSummaryDTO> getGovtLandSummary(String actioncode, String
	 * distname, String tehsilname, String gpname,String villagename);
	 * 
	 * List<GovtLandSummaryDTO> getGovtLandSummary(String actionCode, String
	 * district);
	 * 
	 * List<GovtLandSummaryDTO> getGovtLandSummary(String actionCode, String
	 * district, String village);
	 * 
	 * List<GovtLandSummaryDTO> getGovtLandSummary(String actionCode, String
	 * district, String tehsil, String gp);
	 */
}
