package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Configuration;

import com.coast.app.customRepository.MobilePlotSearchCustomRepo;

@Configuration
public class MobilePlotSearchCustomRepoImpl implements MobilePlotSearchCustomRepo{
	@PersistenceContext
	EntityManager entityManager;
	
	@Override
	public List<String> getPlot(String dist, String tehsil, String gp, String village) 
	{
		String jpql = "select plotno from "+dist+"_plots where  tehname='" + tehsil + "' and gpname='" + gp + "' and villname='" + village + "'";
		Query query = entityManager.createNativeQuery(jpql);
		List<String> str = query.getResultList();
		return str;
	}

}
