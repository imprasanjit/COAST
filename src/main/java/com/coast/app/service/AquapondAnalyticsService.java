package com.coast.app.service;

import java.util.List;

import com.coast.app.dto.Aquapond_Land_DTO;

public interface AquapondAnalyticsService {

	List<Aquapond_Land_DTO> getAquapond(String dist, String tehsil, String gp, String village, String query);

}
