package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.coast.app.customRepository.AnalyticPlotDetailsCustomRepo;
import com.coast.app.entity.Baleshwar_Plots;

@Component
public class AnalyticPlotDetailsCustomRepoImpl implements AnalyticPlotDetailsCustomRepo 
{
	@PersistenceContext
	private EntityManager entityManager;
	String dist;
	@Override
	public List<Baleshwar_Plots> getPlotDetails_vill(String dist, String tehsil, String gp, String village,String plotno) 
	{
		String jpql = "select '"+dist+"' as distname,tehname,gpname,villname,plotno,crzsts,caasts from coast_oltp."+dist+"_plots where plotno='"
				+ plotno + "' and tehname='" + tehsil + "' and gpname='" + gp + "' and villname='" + village + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Plots> list = queryy.getResultList();
		return list;
	}
	@Override
	public List<Baleshwar_Plots> getPlotDetails_Allvill(String dist, String tehsil, String gp, String village,String plotno) {
		String jpql = "select '"+dist+"' as distname,tehname,gpname,villname,plotno,crzsts,caasts from coast_oltp."+dist+"_plots where " + plotno +" and tehname='" + tehsil + "' and gpname='" + gp + "' and villname='" + village + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Plots> list = queryy.getResultList();
		return list;
	}
	
	@Override
	public List<Baleshwar_Plots> getPlotDetails_gp(String dist, String tehsil, String gp, String plotno) {
		String jpql = "select '"+dist+"' as distname,tehname,gpname,villname,plotno,crzsts,caasts from coast_oltp."+dist+"_plots where plotno='" + plotno +"' and tehname='" + tehsil + "' and gpname='" + gp + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Plots> list = queryy.getResultList();
		return list;
	}
	@Override
	public List<Baleshwar_Plots> getPlotDetails_gpAll(String dist, String tehsil, String gp, String plotno) {
		String jpql = "select '"+dist+"' as distname,tehname,gpname,villname,plotno,crzsts,caasts from coast_oltp."+dist+"_plots where " + plotno +" and tehname='" + tehsil + "' and gpname='" + gp + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Plots> list = queryy.getResultList();
		return list;
	}
	@Override
	public List<Baleshwar_Plots> getPlotDetails_tehsil(String dist, String tehsil, String plotno) {
		String jpql = "select '"+dist+"' as distname,tehname,gpname,villname,plotno,crzsts,caasts from coast_oltp."+dist+"_plots where plotno='" + plotno +"' and tehname='" + tehsil + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Plots> list = queryy.getResultList();
		return list;
	}
	@Override
	public List<Baleshwar_Plots> getPlotDetails_tehsilAll(String dist, String tehsil, String plotno) {
		String jpql = "select '"+dist+"' as distname,tehname,gpname,villname,plotno,crzsts,caasts from coast_oltp."+dist+"_plots where " + plotno +" and tehname='" + tehsil + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Plots> list = queryy.getResultList();
		return list;
	}
	@Override
	public List<Baleshwar_Plots> getPlotDetails_dist(String dist, String plotno) {
		String jpql = "select '"+dist+"' as distname,tehname,gpname,villname,plotno,crzsts,caasts from coast_oltp."+dist+"_plots where plotno='" + plotno + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Plots> list = queryy.getResultList();
		return list;
	}
	@Override
	public List<Baleshwar_Plots> getPlotDetails_distAll(String dist, String plotno) {
		String jpql = "select '"+dist+"' as distname,tehname,gpname,villname,plotno,crzsts,caasts from coast_oltp."+dist+"_plots where " + plotno + "";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Plots> list = queryy.getResultList();
		return list;
	}
}
