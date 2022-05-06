package com.coast.app.customRepository;

import java.util.List;

import com.coast.app.dto.CadastralSearchPlot_DTO;

public interface CadastralSearchRepoCustom {
List<CadastralSearchPlot_DTO> getPlot(String dist, String tehsil, String gp, String village);
List<CadastralSearchPlot_DTO> getPlot_All(String dist, String tehsil, String gp);
List<CadastralSearchPlot_DTO> getPlot_All(String dist, String tehsil);
List<CadastralSearchPlot_DTO> getPlot_All(String dist);
//List<CadastralSearchPlot_DTO> getPlot_All(String dist, String tehsil, String gp, String village);
}
