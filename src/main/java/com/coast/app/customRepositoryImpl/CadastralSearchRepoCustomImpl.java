package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Configuration;

import com.coast.app.customRepository.CadastralSearchRepoCustom;
import com.coast.app.dto.CadastralSearchPlot_DTO;

@Configuration
public class CadastralSearchRepoCustomImpl implements CadastralSearchRepoCustom {
	@PersistenceContext
	EntityManager entityManager;
	@Override
	public List<CadastralSearchPlot_DTO> getPlot(String dist, String tehsil, String gp, String village) {
		String jpql = "select distinct plotno from coast_oltp."+dist+"_plots where  tehname='" + tehsil + "' and gpname='" + gp + "' and villname='" + village + "' order by plotno asc";
		Query query = entityManager.createNativeQuery(jpql);
		List<CadastralSearchPlot_DTO> list = query.getResultList();
		return list;
	}

	@Override
	public List<CadastralSearchPlot_DTO> getPlot_All(String dist, String tehsil, String gp) {
		String jpql = "select distinct plotno from coast_oltp."+dist+"_plots where  tehname='" + tehsil + "' and gpname='" + gp + "'";
		Query query = entityManager.createNativeQuery(jpql);
		List<CadastralSearchPlot_DTO> list = query.getResultList();
		return list;
	}

	@Override
	public List<CadastralSearchPlot_DTO> getPlot_All(String dist, String tehsil) {
		String jpql = "select distinct plotno from coast_oltp."+dist+"_plots where tehname='" + tehsil + "'";
		Query query = entityManager.createNativeQuery(jpql);
		List<CadastralSearchPlot_DTO> list = query.getResultList();
		return list;
	}

	@Override
	public List<CadastralSearchPlot_DTO> getPlot_All(String dist) {
		String jpql = "select distinct plotno from coast_oltp."+dist+"_plots";
		Query query = entityManager.createNativeQuery(jpql);
		List<CadastralSearchPlot_DTO> list = query.getResultList();
		return list;
	}

}
