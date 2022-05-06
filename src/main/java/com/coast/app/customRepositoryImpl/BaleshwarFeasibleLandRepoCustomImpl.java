package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.coast.app.customRepository.BaleshwarFeasibleLandRepoCustom;
import com.coast.app.entity.Baleshwar_Feasible_Land;

public class BaleshwarFeasibleLandRepoCustomImpl implements BaleshwarFeasibleLandRepoCustom{

	@PersistenceContext
	private EntityManager entityManager;
	//get all feasble land
		@Override
		public List<Baleshwar_Feasible_Land> getAllFesLanddetails(String district, String tehsil, String gp, String village,
				String query) {
			String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from "+district+"_feasible_land where "+query+" and tehname='"+tehsil+"'"
					+ " and gpname='"+gp+"' and villname='"+village+"'";
			Query queryy = entityManager.createNativeQuery(jpql);
			
			List<Baleshwar_Feasible_Land> list = queryy.getResultList();
			return list; 
		}

		@Override
		public List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String tehsil, String gp, String village,
				String query) {
			String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from "+dist+"_feasible_land where tehname='"+tehsil+"'"
					+ " and gpname='"+gp+"' and villname='"+village+"'";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<Baleshwar_Feasible_Land> list = queryy.getResultList();
			return list; 
		}

		@Override
		public List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String tehsil, String gp, String query) {
			String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from "+dist+"_feasible_land where "+query+" and tehname='"+tehsil+"'"
					+ " and gpname='"+gp+"'";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<Baleshwar_Feasible_Land> list = queryy.getResultList();
			return list; 
		}

		@Override
		public List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String tehsil, String gp, String query) {
			String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from "+dist+"_feasible_land where tehname='"+tehsil+"'"
					+ " and gpname='"+gp+"'";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<Baleshwar_Feasible_Land> list = queryy.getResultList();
			return list; 
		}

		@Override
		public List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String tehsil, String query) {
			String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from "+dist+"_feasible_land where "+query+" and tehname='"+tehsil+"'";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<Baleshwar_Feasible_Land> list = queryy.getResultList();
			return list; 
		}

		@Override
		public List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String tehsil, String query) {
			String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from "+dist+"_feasible_land where tehname='"+tehsil+"'";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<Baleshwar_Feasible_Land> list = queryy.getResultList();
			return list; 
		}

		@Override
		public List<Baleshwar_Feasible_Land> getAllFesLanddetails(String dist, String query) {
			String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from "+dist+"_feasible_land where "+query+"";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<Baleshwar_Feasible_Land> list = queryy.getResultList();
			return list; 
		}

		@Override
		public List<Baleshwar_Feasible_Land> getAllFesLanddetailsAll(String dist, String query) {
			String jpql = "select distname,tehname,gpname,villname,khatano,plotno,kisameng,areaac,leasac,apaac,lat,lon from "+dist+"_feasible_land ";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<Baleshwar_Feasible_Land> list = queryy.getResultList();
			return list; 
		}
		

}
