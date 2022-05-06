package com.coast.app.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.CadastralSearchRepoCustom;
import com.coast.app.dto.CadastralSearchPlot_DTO;
import com.coast.app.dto.Feasible_Land_DTO;
import com.coast.app.service.CadastralSearchService;
@Service
public class CadastralSearchServiceImpl  implements CadastralSearchService{
	
	@Autowired
	private CadastralSearchRepoCustom cadastralSearchRepoCustom;
	@Override
	public List<CadastralSearchPlot_DTO> getCadastralPlot(String dist, String tehsil, String gp, String village) 
	{
		List<CadastralSearchPlot_DTO> cadastralSearchPlot_DTO = null;
		if (dist.equals("Khurda")) 
		{
			dist="Khurdha";
		}
		if (!dist.equals("ALL")) {
			if (!tehsil.equals("ALL")) {
				if (!gp.equals("ALL")) {
					if (!village.equals("ALL")) {
						cadastralSearchPlot_DTO = cadastralSearchRepoCustom.getPlot(dist, tehsil, gp,village);
							}
					else {
						cadastralSearchPlot_DTO = cadastralSearchRepoCustom.getPlot_All(dist, tehsil, gp);

						}
				}
				else {
					cadastralSearchPlot_DTO = cadastralSearchRepoCustom.getPlot_All(dist, tehsil);
						}
			}
			else {
				cadastralSearchPlot_DTO = cadastralSearchRepoCustom.getPlot_All(dist);		
					} 
		
					
			}
	
	return cadastralSearchPlot_DTO;
}
	

}
