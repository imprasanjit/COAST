package com.coast.app.customRepositoryImpl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;

import com.coast.app.customRepository.BoundaryCustomRepo;

@Service
public class BoundaryCustomRepoImpl implements  BoundaryCustomRepo{
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public String getStateBoundaryGeoJson() {
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers.state_boundary";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}
	
	@Override
	public String getGeoJsonByTehsilName(String tehsil,String distname) {
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers.tehsil_boundary  where tehname='" + tehsil + "'" + " and distname='" + distname + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}
	
	@Override
	public String getGeoJsonByGpName(String gp, String tehsil, String dist) {
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers.gp_boundary where distname='"+dist+"'"+" and blockname='" + tehsil + "'" + " and  gpname='" + gp + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getGeoJsonByVillName(String vill, String gp, String tehsil, String dist) {
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers.study_area_villages where distname='"+dist+"'"+" and tehname='" + tehsil + "'" + " and  gpname='" + gp + "'" + " and  villname='" + vill + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getGeoJsonPlotInfo(String plotno, String vill, String gp, String tehsil, String dist) {
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers.'"+dist.toLowerCase()+"'_plots where  tehname='" + tehsil + "'" + " and  gpname='" + gp + "'" + " and  villname='" + vill + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}

	@Override
	public String getGeoJsonPlotInfoFor_(String plotno, String vill, String gp, String tehsil, String dist) {
		String jpql = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from  layers.'"+dist.toLowerCase()+"'_plots where plotno='"+plotno+"'"+" and teh_name='" + tehsil + "'" + " and  gp_name='" + gp + "'" + " and  vill_name='" + vill + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
	     Object singleResult = queryy.getSingleResult();
	     String stringResult = singleResult.toString();
	     return stringResult;
	}
	
}
