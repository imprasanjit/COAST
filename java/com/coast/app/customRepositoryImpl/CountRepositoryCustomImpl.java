package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.coast.app.customRepository.CountReportCustomRepo;



@Repository
public class CountRepositoryCustomImpl implements CountReportCustomRepo {

	@PersistenceContext
	private EntityManager entityManager;
	@Override
	public List<Object[]> getCountAcquapond() {
		String jpql = "SELECT distname, acqpond, totalarea FROM public.view_acqpond_count";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Object[]> resultList = queryy.getResultList();
		return resultList;
	}
	@Override
	public List<Object[]> getCountFeasible() {
		String jpql = "SELECT distname, totalplot, totalarea FROM public.view_feasibleland_report;";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Object[]> resultList = queryy.getResultList();
		return resultList;
	}
	@Override
	public List<Object[]> getCountLease() {
		String jpql = "SELECT distname, totalplot, totalarea FROM public.view_leaseland_report";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Object[]> resultList = queryy.getResultList();
		return resultList;
	}


	

}
