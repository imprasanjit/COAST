package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Configuration;

import com.coast.app.customRepository.BaleshwarAquapondRepositoryCustom;
import com.coast.app.entity.Baleshwar_Aquaponds;
@Configuration
public class BaleshwarAquapondRepositoryCustomImpl implements BaleshwarAquapondRepositoryCustom {
	@PersistenceContext
	private EntityManager entityManager;
	String dist;

	@Override
	public List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String tehsil, String gp, String village,String query) {
		String jpql = "select distname,tehname,gpname,villname,pondno,regno,areaac,gfac,gnfac,lat,lon from coast_oltp."+dist+"_aquaponds where "
				+ query + " and tehname='" + tehsil + "'" + " and gpname='" + gp + "' and villname='" + village + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Baleshwar_Aquaponds> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String tehsil, String gp, String query) {
			String jpql = "select distname,tehname,gpname,villname,pondno,regno,areaac,gfac,gnfac,lat,lon from coast_oltp."+dist+"_aquaponds where "+query+" and tehname='"+tehsil+"'"
					+ " and gpname='"+gp+"'";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<Baleshwar_Aquaponds> list = queryy.getResultList();
			return list; 
	}

	@Override
	public List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String tehsil, String query) {
			String jpql = "select distname,tehname,gpname,villname,pondno,regno,areaac,gfac,gnfac,lat,lon from coast_oltp."+dist+"_aquaponds where "+query+" and tehname='"+tehsil+"'";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<Baleshwar_Aquaponds> list = queryy.getResultList();
			return list; 
	}

	@Override
	public List<Baleshwar_Aquaponds> getAquapondDetails(String dist, String query) {
			String jpql = "select distname,tehname,gpname,villname,pondno,regno,areaac,gfac,gnfac,lat,lon from coast_oltp."+dist+"_aquaponds where "+query+"";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<Baleshwar_Aquaponds> list = queryy.getResultList();
			return list; 
	}

}
