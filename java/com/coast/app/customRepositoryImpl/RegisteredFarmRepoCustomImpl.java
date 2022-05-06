package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Configuration;

import com.coast.app.customRepository.RegisteredFarmRepoCustom;
import com.coast.app.dto.Registered_Farm_DTO;
import com.coast.app.entity.Baleshwar_Leas_Plots;

@Configuration
public class RegisteredFarmRepoCustomImpl implements RegisteredFarmRepoCustom {

	@PersistenceContext
	private EntityManager entityManager;
	String dist;

	public List<Object> getAquaPondAreaByDist(String district) {
		dist = district.toLowerCase();
		String jpql = "select tehname,count(*),sum(areaha) as pondarea,(select sum(areaac*0.404) AS regfarmarea from coast_oltp."
				+ dist + "_leas_plots where " + dist + "_leas_plots.tehname=" + dist + "_aquaponds.tehname)from " + dist
				+ "_aquaponds group by tehname";
		Query query = entityManager.createNativeQuery(jpql);
		List<Object> list = query.getResultList();
		return list;
	}

	public List<Object> getGovtLandInfoByDist(String district) {
		dist = district.toLowerCase();
		String jpql = "select tehname,count(*),sum(areaac*0.404) as areagovt,(select sum(areaac*0.404) as areafes from coast_oltp."
				+ dist + "_feasible_land where " + dist + "_feasible_land.tehname=" + dist + "_govt_land.tehname)from "
				+ dist + "_govt_land group by tehname";
		Query query = entityManager.createNativeQuery(jpql);
		List<Object> list = query.getResultList();
		return list;
	}

	public List<Object> getGovtFeasLandInfoChartByDist(String district) {
		dist = district.toLowerCase();
		String jpql = "select tehname,sum(areaac*0.404),count(distinct regno) from coast_oltp." + dist
				+ "_Leas_Plots group by tehname";
		Query query = entityManager.createNativeQuery(jpql);
		List<Object> list = query.getResultList();
		return list;
	}

	public List<Registered_Farm_DTO> getRegFarm_vill(String dist, String tehsil, String gp, String village,
			String query) {
		String jpql = "select '" + dist
				+ "' as distname,tehname,villname,gpname,plotno,regno,status,areaac,apac,glac from coast_oltp." + dist
				+ "_leas_plots where " + query + " and tehname='" + tehsil + "'" + " and gpname='" + gp
				+ "' and villname='" + village + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Registered_Farm_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Registered_Farm_DTO> getRegFarm_All_gp(String dist, String tehsil, String gp, String query) {
		String jpql = "select '" + dist
				+ "' as distname,tehname,villname,gpname,plotno,regno,status,areaac,apac,glac from coast_oltp." + dist
				+ "_leas_plots where " + query + " and tehname='" + tehsil + "'" + " and gpname='" + gp + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Registered_Farm_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Registered_Farm_DTO> getRegFarm_tehsil_All(String dist, String tehsil, String query) {
		String jpql = "select '" + dist
				+ "' as distname,tehname,villname,gpname,plotno,regno,status,areaac,apac,glac from coast_oltp." + dist
				+ "_leas_plots where " + query + " and tehname='" + tehsil + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Registered_Farm_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Registered_Farm_DTO> getRegFarm_dist_All(String dist, String query) {
		String jpql = "select '" + dist + "' as distname,tehname,villname,gpname,plotno,regno,status,areaac,apac,glac from coast_oltp."
				+ dist + "_leas_plots where " + query + "";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Registered_Farm_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Registered_Farm_DTO> getRegFarmAll_vill(String dist, String tehsil, String gp, String village,
			String query) {
		String jpql = "select '" + dist
				+ "' as distname,tehname,villname,gpname,plotno,regno,status,areaac,apac,glac from coast_oltp." + dist
				+ "_leas_plots where " + query + " and tehname='" + tehsil + "'" + " and gpname='" + gp
				+ "' and villname='" + village + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Registered_Farm_DTO> list = queryy.getResultList();
		return list;
	}

}
