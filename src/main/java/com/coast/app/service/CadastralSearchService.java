package com.coast.app.service;

import java.util.List;

import com.coast.app.dto.CadastralSearchPlot_DTO;

public interface CadastralSearchService {

	List<CadastralSearchPlot_DTO> getCadastralPlot(String dist, String tehsil, String gp, String village) ;
}
