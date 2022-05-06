package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Configuration;

import com.coast.app.customRepository.SurveyFieldReportRepoCustom;
import com.coast.app.entity.Tbl_field_Reporting;

@Configuration
public class SurveyFieldReportRepoCustomImpl implements SurveyFieldReportRepoCustom {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Tbl_field_Reporting> getField_Reportings(String dist, String tehsil, String gp, String village) {

		String jpql = "select distname,tehname,gpname,villname,plotno,remark,lat,lon from coast_oltp.tbl_field_reporting where distname='"
				+ dist + "' and tehname='" + tehsil + "'" + " and gpname='" + gp + "' and villname='" + village + "'";
		Query query = entityManager.createNativeQuery(jpql);
		List<Tbl_field_Reporting> list = query.getResultList();
		return list;
	}

	public List<Tbl_field_Reporting> getField_ReportingsAlldistrict(String dist, String tehsil, String gp,String village) {
		String jpql = "select distname,tehname,gpname,villname,plotno,remark,lat,lon from coast_oltp.tbl_field_reporting where distname='"
				+ dist + "'";
		Query query = entityManager.createNativeQuery(jpql);
		List<Tbl_field_Reporting> list = query.getResultList();
		return list;
	}

	@Override
	public List<Tbl_field_Reporting> getField_ReportingsAll() {
		String jpql = "select distname,tehname,gpname,villname,plotno,remark,lat,lon from coast_oltp.tbl_field_reporting";
		Query query = entityManager.createNativeQuery(jpql);
		List<Tbl_field_Reporting> list = query.getResultList();
		return list;
	}

	@Override
	public List<Tbl_field_Reporting> getField_ReportingsAll(String dist, String tehsil, String gp) {
		String jpql = "select distname,tehname,gpname,villname,plotno,remark,lat,lon from coast_oltp.tbl_field_reporting where  distname ='"
				+ dist + "'and " + "tehname='" + tehsil + "'" + " and gpname='" + gp + "'";
		Query query = entityManager.createNativeQuery(jpql);
		List<Tbl_field_Reporting> list = query.getResultList();
		return list;
	}

	@Override
	public List<Tbl_field_Reporting> getField_ReportingsAll(String dist, String tehsil) {
		String jpql = "select distname,tehname,gpname,villname,plotno,remark,lat,lon from coast_oltp.tbl_field_reporting where distname='"
				+ dist + "'and " + "tehname='" + tehsil + "'";
		Query query = entityManager.createNativeQuery(jpql);
		List<Tbl_field_Reporting> list = query.getResultList();
		return list;
	}

	@Override
	public List<Tbl_field_Reporting> getField_ReportingsAll(String dist) {
		String jpql = "select distname,tehname,gpname,villname,plotno,remark,lat,lon from coast_oltp.tbl_field_reporting where distname='"
				+ dist + "'";
		Query query = entityManager.createNativeQuery(jpql);
		List<Tbl_field_Reporting> list = query.getResultList();
		return list;
	}
}
