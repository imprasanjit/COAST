package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Configuration;

import com.coast.app.customRepository.FeasibleLandRepoCustom;
import com.coast.app.dto.Feasible_Land_DTO;

@Configuration
public class FeasibleLandRepoCustomImpl implements FeasibleLandRepoCustom {
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Feasible_Land_DTO> getAllFesLanddetails_vill(String dist, String tehsil, String gp, String village,String query) {
		/*
		 * if (dist.equals("Khurda")) { dist="Khurdha"; } if(dist.equals("jajapur")) {
		 * dist="jajpur"; }
		 */
		String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from coast_oltp."
				+ dist + "_feasible_land where " + query + " and tehname='" + tehsil + "'" + " and gpname='" + gp
				+ "' and villname='" + village + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Feasible_Land_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Feasible_Land_DTO> getAllFesLanddetailsAll_vill(String dist, String tehsil, String gp, String village,
			String query) {
		/*
		 * if (dist.equals("Khurda")) { dist="Khurdha"; } if(dist.equals("jajapur")) {
		 * dist="jajpur"; }
		 */
		String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from coast_oltp."
				+ dist + "_feasible_land where " + query + " and tehname='" + tehsil + "'" + " and gpname='" + gp
				+ "' and villname='" + village + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Feasible_Land_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Feasible_Land_DTO> getAllFesLanddetails_gp(String dist, String tehsil, String gp, String query) {		
		/*
		 * if (dist.equals("Khurda")) { dist="Khurdha"; } if(dist.equals("jajapur")) {
		 * dist="jajpur"; }
		 */
		String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from coast_oltp."
				+ dist + "_feasible_land where " + query + " and tehname='" + tehsil + "'" + " and gpname='" + gp + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Feasible_Land_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Feasible_Land_DTO> getAllFesLanddetails_teh(String dist, String tehsil, String query) {
		/*
		 * if (dist.equals("Khurda")) { dist="Khurdha"; } if(dist.equals("jajapur")) {
		 * dist="jajpur"; }
		 */
		String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from coast_oltp."
				+ dist + "_feasible_land where " + query + " and tehname='" + tehsil + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Feasible_Land_DTO> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Feasible_Land_DTO> getAllFesLanddetails_dist(String dist, String query) {
		/*
		 * if (dist.equals("Khurda")) { dist="Khurdha"; } if(dist.equals("jajapur")) {
		 * dist="jajpur"; }
		 */
		String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from coast_oltp."
				+ dist + "_feasible_land where " + query + "";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Feasible_Land_DTO> list = queryy.getResultList();
		return list;
	}

}
