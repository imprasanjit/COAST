package com.coast.app.service;

import java.util.List;

import com.coast.app.dto.GovtLandSummaryDTO;
import com.coast.app.entity.Tehsil_summary;
import com.coast.app.entity.Village_Summary;

public interface ReportService {

	List<GovtLandSummaryDTO> getGovtLandSummary(String actionCode,String district, String tehsil, String gp, String village);

	List<Tehsil_summary> getTehsilAreaSummary(String district);

	List<Village_Summary> getVillageAreaSummary(String district, String tehsil, String village);

}
