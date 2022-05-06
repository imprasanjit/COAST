package com.coast.app.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.coast.app.customRepository.AnalyticPlotDetailsCustomRepo;
import com.coast.app.entity.Baleshwar_Plots;
import com.coast.app.service.AnalyticsPlotsDTO;

public interface AnalyticPlotDetailsRepo extends CrudRepository<Baleshwar_Plots, Integer>
{

	//List<AnalyticsPlotsDTO> getPlotDetails(String dist, String tehsil, String gp, String village, String query);

}
