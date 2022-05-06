package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Configuration;

import com.coast.app.customRepository.MobilefeasibleLandCustomRepo;
import com.coast.app.dto.Feasible_Land_DTO;

@Configuration
public class MobilefeasibleLandCustomRepoImpl implements MobilefeasibleLandCustomRepo
{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Feasible_Land_DTO> getAllFesLanddetails_vill(String dist, String tehsil, String gp, String village) {
		String jpql = "select gid,distname,tehname,gpname,villname,plotno,kisameng,areaac,lat,lon from coast_oltp. "
				+ dist + "_feasible_land where " + "tehname='" + tehsil + "'" + " and gpname='" + gp
				+ "' and villname='" + village + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Feasible_Land_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Feasible_Land_DTO> getAllFesLanddetailsAll_vill(String dist, String tehsil, String gp, String village) {
		String jpql = "select gid,distname,tehname,gpname,villname,plotno,kisameng,areaac,lat,lon from coast_oltp."
				+ dist + "_feasible_land where " + "tehname='" + tehsil + "'" + " and gpname='" + gp
				+ "' and villname='" + village + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Feasible_Land_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Feasible_Land_DTO> getAllFesLanddetails_gp(String dist, String tehsil, String gp) {
		String jpql = "select gid,distname,tehname,gpname,villname,plotno,kisameng,areaac,lat,lon from coast_oltp."
				+ dist + "_feasible_land where " + "tehname='" + tehsil + "'" + " and gpname='" + gp + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Feasible_Land_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Feasible_Land_DTO> getAllFesLanddetails_teh(String dist, String tehsil) {
		String jpql = "select gid,distname,tehname,gpname,villname,plotno,kisameng,areaac,lat,lon from coast_oltp."
				+ dist + "_feasible_land where " + "tehname='" + tehsil + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Feasible_Land_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Feasible_Land_DTO> getAllFesLanddetails_dist(String dist) {
		String jpql = "select gid,distname,tehname,gpname,villname,plotno,kisameng,areaac,lat,lon from coast_oltp. "
				+ dist + "_feasible_land where " + "";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Feasible_Land_DTO> list = queryy.getResultList();
		return list;
	}

}
