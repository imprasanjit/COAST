package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.coast.app.customRepository.BaleshwarLeadPlotsRepoCustom;
import com.coast.app.dto.BaleshwarLeasPlotsDTO;
import com.coast.app.entity.Baleshwar_Leas_Plots;
import com.coast.app.entity.User_Details;


public class BaleshwarLeadPlotsRepoCustomImpl implements BaleshwarLeadPlotsRepoCustom {

	@PersistenceContext
	private EntityManager entityManager;
	String dist;
	@Override
	public List<Object> getAquaPondAreaByDist(String district) {
		dist=district.toLowerCase();
		String jpql = "select tehname,count(*),sum(areaha) as pondarea,(select sum(areaac*0.404) AS regfarmarea from coast_oltp."
				+ dist + "_leas_plots where " + dist + "_leas_plots.tehname="+ dist +"_aquaponds.tehname)from coast_oltp." + dist
				+ "_aquaponds group by tehname";
		Query query = entityManager.createNativeQuery(jpql);
		List<Object> list = query.getResultList();
		return list;
	}

	public List<Object> getGovtLandInfoByDist(String district) {
		dist=district.toLowerCase();
		String jpql = "select tehname,count(*),sum(areaac*0.404) as areagovt,(select sum(areaac*0.404) as areafes from coast_oltp."
				+ dist + "_feasible_land where " + dist + "_feasible_land.tehname=" + dist + "_govt_land.tehname)from coast_oltp."
				+ dist + "_govt_land group by tehname";
		Query query = entityManager.createNativeQuery(jpql);
		List<Object> list = query.getResultList();
		return list;
	}

	public List<Object> getGovtFeasLandInfoChartByDist(String district) {
		dist=district.toLowerCase();
		String jpql = "select tehname,sum(areaac*0.404),count(distinct regno) from coast_oltp." + dist
				+ "_Leas_Plots group by tehname";
		Query query = entityManager.createNativeQuery(jpql);
		List<Object> list = query.getResultList();
		return list;
	}

	

	@Override
	public List<Baleshwar_Leas_Plots> getRegFarm(String dist, String tehsil, String gp, String village,
			String query) {
		String jpql = "select '"+dist+"' as distname,areaac,villname,gpname,tehname,plotno,regno,status,apac,glac from coast_oltp."+dist+"_leas_plots where "
				+ query + " and tehname='" + tehsil + "'" + " and gpname='" + gp + "' and villname='" + village + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Leas_Plots> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getRegFarm(String dist, String tehsil, String gp, String query) {
		// TODO Auto-generated method stub
		String jpql = "select "+dist+" as distname,areaac,villname,tehname,plotno,regno,status,apac,glac from coast_oltp."+dist+"_leas_plots where "
				+ query + " and tehname='" + tehsil + "' and gpname='" + gp + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Leas_Plots> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getRegFarm(String dist, String tehsil, String query) {
		// TODO Auto-generated method stub
		String jpql = "select "+dist+" as distname,areaac,villname,tehname,plotno,regno,status,apac,glac from coast_oltp."+dist+"_leas_plots where "
				+ query + " and tehname='" + tehsil + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Leas_Plots> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getRegFarm(String dist, String query) {
		// TODO Auto-generated method stub
		String jpql = "select "+dist+" as distname,areaac,villname,tehname,plotno,regno,status,apac,glac from coast_oltp."+dist+"_leas_plots where "
				+ query + "";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Leas_Plots> list = queryy.getResultList();
		return list;
	}
	
	@Override
	public List<User_Details> getAllUser() {
		// TODO Auto-generated method stub
		String jpql = "select username,designation,emailid from coast_oltp.user_details";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<User_Details> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getAllFesLanddetails(String dist, String tehsil, String gp, String village,
			String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getAllFesLanddetailsAll(String dist, String tehsil, String gp, String village,
			String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getAllFesLanddetails(String dist, String tehsil, String gp, String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getAllFesLanddetailsAll(String dist, String tehsil, String gp, String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getAllFesLanddetails(String dist, String tehsil, String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getAllFesLanddetailsAll(String dist, String tehsil, String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getAllFesLanddetails(String dist, String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Baleshwar_Leas_Plots> getAllFesLanddetailsAll(String dist, String query) {
		// TODO Auto-generated method stub
		return null;
	}

}
