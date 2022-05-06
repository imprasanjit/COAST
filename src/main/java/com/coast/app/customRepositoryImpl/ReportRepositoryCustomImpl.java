package com.coast.app.customRepositoryImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Configuration;

import com.coast.app.customRepository.ReportRepositoryCustom;
import com.coast.app.dto.BaleshwarLeasPlotsDTO;
import com.coast.app.dto.GovtLandSummaryDTO;
import com.coast.app.entity.Tehsil_summary;
import com.coast.app.entity.Village_Summary;

@Configuration
public class ReportRepositoryCustomImpl implements ReportRepositoryCustom {

	@PersistenceContext
	private EntityManager entityManager;

	/*public List<GovtLandSummaryDTO> getGovtLandSummary(String p_actioncode, String p_distname, String p_tehsilname,
		String p_gpname, String p_villagename) {
		String[] split = p_actioncode.split("_");		
		if(split[1].equals("aquaponds")) {
			String jpql = "select '"+p_distname+"' as distname ,tehname,gpname,villname,pondno,areaac from coast_oltp."
					+ p_actioncode + " where distname='" + p_distname + "' and tehname='" + p_tehsilname + "' and gpname='" + p_gpname 
					+ "' and villname='" + p_villagename + "'";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<GovtLandSummaryDTO> list = queryy.getResultList();
			return list;
		}
		String jpql = "select '"+p_distname+"' as distname ,tehname,gpname,villname,plotno,areaac from coast_oltp."
				+ p_actioncode + " where tehname='" + p_tehsilname + "' and gpname='" + p_gpname + "' and villname='" + p_villagename + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<GovtLandSummaryDTO> list = queryy.getResultList();
		return list;
	}*/

	/*@Override
	public List<GovtLandSummaryDTO> getGovtLandSummary(String actionCode, String district, String tehsil, String gp) {
		String[] split = actionCode.split("_");		
		if(split[1].equals("aquaponds")) {
			String jpql = "select '"+district+"' as distname ,tehname,gpname,villname,pondno,areaac from coast_oltp."
					+ actionCode + " where tehname='" + tehsil + "' and gpname='" + gp + "'";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<GovtLandSummaryDTO> list = queryy.getResultList();
			return list;
		}
		String jpql = "select '"+district+"' as distname ,tehname,gpname,villname,plotno,areaac from coast_oltp."
				+ actionCode + " where tehname='" + tehsil + "' and gpname='" + gp + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<GovtLandSummaryDTO> list = queryy.getResultList();
		return list;
	}*/

	@Override
	public List<GovtLandSummaryDTO> getGovtLandSummary(String actionCode, String district, String tehsil) {
		String[] split = actionCode.split("_");		
		if(split[1].equals("aquaponds")) {
			String jpql = "select '"+district+"' as distname ,tehname,gpname,villname,pondno,areaac from coast_oltp."
					+ actionCode + " where tehname='" + tehsil + "'";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<GovtLandSummaryDTO> list = queryy.getResultList();
			return list;
		}
		String jpql = "select '"+district+"' as distname ,tehname,gpname,villname,plotno,areaac from coast_oltp."
				+ actionCode + " where tehname='" + tehsil + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<GovtLandSummaryDTO> list = queryy.getResultList();
		return list;
	}

	/*@Override
	public List<GovtLandSummaryDTO> getGovtLandSummary(String p_actioncode, String p_distname) {
		String[] split = p_actioncode.split("_");		
		if(split[1].equals("aquaponds")) {
			String jpql = "select '"+p_distname+"' as distname ,tehname,gpname,villname,pondno,areaac from coast_oltp."
					+ p_actioncode + " where distname='" + p_distname + "'";
			Query queryy = entityManager.createNativeQuery(jpql);
			List<GovtLandSummaryDTO> list = queryy.getResultList();
			return list;
		}
		String jpql = "select '"+p_distname+"' as distname ,tehname,gpname,villname,plotno,areaac from coast_oltp."
				+ p_actioncode + " where distname='" + p_distname + "'";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<GovtLandSummaryDTO> list = queryy.getResultList();
		return list;
	}*/
	@Override
	public List<Tehsil_summary> getAllTehsilLandSummary() {
		String jpql = "select distname,tehname,totalgovtland,gvtlndnotconsidered,gvtfeslndconsidered,aqpondarea,reglndinfeslnd"
				+ " ,commonreglandaquawithinfeasiblelnd,feslndutilised,availablefeslnd from coast_oltp.tehsil_sumary order by distname";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Tehsil_summary> list = queryy.getResultList();
		return list;
	}
	@Override
	public List<Tehsil_summary> getTehsilLandSummary(String district,String tehsil) {
		String jpql = "select distname,tehname,totalgovtland,gvtlndnotconsidered,gvtfeslndconsidered,aqpondarea,reglndinfeslnd"
				+ " ,commonreglandaquawithinfeasiblelnd,feslndutilised,availablefeslnd from coast_oltp.tehsil_sumary where distname='" + district + "' and tehname='"+tehsil+"'  order by distname";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Tehsil_summary> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Tehsil_summary> getAllDistrictLandSummary() {
		String jpql = "select distname,tehname,totalgovtland,gvtlndnotconsidered,gvtfeslndconsidered,aqpondarea,reglndinfeslnd"
				+ " ,commonreglandaquawithinfeasiblelnd,feslndutilised,availablefeslnd from coast_oltp.tehsil_sumary order by distname";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Tehsil_summary> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Village_Summary> getVillageareasummary() {
		String jpql = "select dist_name,teh_name,vill_name,total_govtLand,gvtlnd_notconsidered,gvtfeslnd_considered,aqpond_area,reglnd_in_feslnd"
				+ " ,common_regland_aqua_within_feasiblelnd,feslnd_utilised,available_feslnd from coast_oltp.vill_summary_table  order by dist_name";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Village_Summary> list = queryy.getResultList();
		return list;
		
	}

	@Override
	public List<Village_Summary> getVillageareasummarybyDistTeh(String district, String tehsil) {
		String jpql = "select dist_name,teh_name,vill_name,total_govtLand,gvtlnd_notconsidered,gvtfeslnd_considered,aqpond_area,reglnd_in_feslnd"
				+ " ,common_regland_aqua_within_feasiblelnd,feslnd_utilised,available_feslnd from coast_oltp.vill_summary_table where dist_name='"+district+"' and teh_name='"+tehsil+"' order by dist_name";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Village_Summary> list = queryy.getResultList();
		return list;
	}
	@Override
	public List<Village_Summary> getVillageareasummarybyAll(String district, String tehsil, String village) {
		String jpql = "select dist_name,teh_name,vill_name,total_govtLand,gvtlnd_notconsidered,gvtfeslnd_considered,aqpond_area,reglnd_in_feslnd"
				+ " ,common_regland_aqua_within_feasiblelnd,feslnd_utilised,available_feslnd from coast_oltp.vill_summary_table where dist_name='"+district+"' and teh_name='"+tehsil+"' and vill_name='"+village+"' order by dist_name";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Village_Summary> list = queryy.getResultList();
		return list;
}

	@Override
	public List<Object> getDTRSummaryReport(String lon,String lat) {
		String jpql = "SELECT * from  layers.fn_getdtrinfo ('"+Double.parseDouble(lon)+"','"+Double.parseDouble(lat)+"')";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Object> list = queryy.getResultList();
		return list;
	}

	@Override
	public List<Object> getDTRReport(String village) {
		String jpql = "SELECT \"Village\" as villageName, \"DTR_no\" as dtrno, latitude, longitude from layers.\"DTR\"  where \"Village\"='"+village+"' ";
		Query queryy = entityManager.createNativeQuery(jpql);
		List<Object> list = queryy.getResultList();
		return list;
	}

}
