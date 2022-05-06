package com.coast.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.coast.app.customRepository.BaleshwarLeadPlotsRepoCustom;
import com.coast.app.entity.Baleshwar_Leas_Plots;

@Repository
public interface BaleswarLeasPlotsRepo extends CrudRepository<Baleshwar_Leas_Plots, Integer>, BaleshwarLeadPlotsRepoCustom 
{
	  @Query(value = "select distname,count(*),sum(areaha)as pondarea,(select round(sum(areaac*0.404)) AS regfarmarea from coast_oltp.baleshwar_leas_plots),'7' as distsort from coast_oltp.baleshwar_aquaponds group by distname \r\n"
			+ "union \r\n"
			+ "select distname,count(*),sum(areaha) as pondarea,(select round(sum(areaac*0.404)) AS regfarmarea from coast_oltp.bhadrak_leas_plots),'6' as distsort from coast_oltp.bhadrak_aquaponds group by distname \r\n"
			+ "union \r\n"
			+ "select distname,count(*),sum(areaha) as pondarea,(select round(sum(areaac*0.404)) AS regfarmarea from coast_oltp.khurdha_leas_plots),'2' as distsort from coast_oltp.khurdha_aquaponds group by distname\r\n"
			+ "union \r\n"
			+ "select distname,count(*),sum(areaha) as pondarea,(select round(sum(areaac*0.404)) AS regfarmarea from coast_oltp.jagatsinghapur_leas_plots),'4' as distsort from coast_oltp.jagatsinghapur_aquaponds group by distname\r\n"
			+ "union \r\n"
			+ "select distname,count(*),sum(areaha) as pondarea,(select round(sum(areaac*0.404)) AS regfarmarea from coast_oltp.kendrapara_leas_plots),'5' as distsort from coast_oltp.kendrapara_aquaponds group by distname \r\n"
			+ "union \r\n"
			+ "select distname,count(*),sum(areaha) as pondarea,(select round(sum(areaac*0.404)) AS regfarmarea from coast_oltp.ganjam_leas_plots),'1' as distsort from coast_oltp.ganjam_aquaponds group by distname \r\n"
			+ "union \r\n"
			+ "select distname,count(*),sum(areaha) as pondarea,(select round(sum(areaac*0.404)) AS regfarmarea from coast_oltp.puri_leas_plots),'3' as distsort from coast_oltp.puri_aquaponds group by distname order by distsort;\r\n"
			+ "", nativeQuery = true)
	 List<Object> getAquaPondArea(String dist);

	@Query(value = "select distname,(select count(*) from coast_oltp.baleshwar_feasible_land),(select sum(areaac*0.404) AS areagovt from coast_oltp.baleshwar_govt_land),(select sum(areaac*0.404) AS area_fes from coast_oltp.baleshwar_feasible_land)from coast_oltp.baleshwar_govt_land group by distname "
			+ "union "
			+ "select distname,(select count(*) from coast_oltp.bhadrak_feasible_land),(select sum(areaac*0.404) AS areagovt from coast_oltp.bhadrak_govt_land),(select sum(areaac*0.404) AS area_fes from coast_oltp.bhadrak_feasible_land)from coast_oltp.bhadrak_govt_land group by distname "
			+ "union "
			+ "select distname,(select count(*) from coast_oltp.cuttack_feasible_land),(select sum(areaac*0.404) AS areagovt from coast_oltp.cuttack_govt_land),(select sum(areaac*0.404) AS area_fes from coast_oltp.cuttack_feasible_land)from coast_oltp.cuttack_govt_land group by distname "
			+ "union "
			+ "select distname,(select count(*) from coast_oltp.ganjam_feasible_land),(select sum(areaac*0.404) AS areagovt from coast_oltp.ganjam_govt_land),(select sum(areaac*0.404) AS area_fes from coast_oltp.ganjam_feasible_land)from coast_oltp.ganjam_govt_land group by distname "
			+ "union "
			+ "select distname,(select count(*) from coast_oltp.jagatsinghapur_feasible_land),(select sum(areaac*0.404) AS areagovt from coast_oltp.jagatsinghapur_govt_land),(select sum(areaac*0.404) AS area_fes from coast_oltp.jagatsinghapur_feasible_land)from coast_oltp.jagatsinghapur_govt_land group by distname "
			+ "union "
			+ "select distname,(select count(*) from coast_oltp.jajpur_feasible_land),(select sum(areaac*0.404) AS areagovt from coast_oltp.jajpur_govt_land),(select sum(areaac*0.404) AS area_fes from coast_oltp.jajpur_feasible_land)from coast_oltp.jajpur_govt_land group by distname "
			+ "union "
			+ "select distname,(select count(*) from coast_oltp.kendrapara_feasible_land),(select sum(areaac*0.404) AS areagovt from coast_oltp.kendrapara_govt_land),(select sum(areaac*0.404) AS area_fes from coast_oltp.kendrapara_feasible_land)from coast_oltp.kendrapara_govt_land group by distname "
			+ "union "
			+ "select distname,(select count(*) from coast_oltp.khurdha_feasible_land),(select sum(areaac*0.404) AS areagovt from coast_oltp.khurdha_govt_land),(select sum(areaac*0.404) AS area_fes from coast_oltp.khurdha_feasible_land)from coast_oltp.khurdha_govt_land group by distname "
			+ "union "
			+ "select distname,(select count(*) from coast_oltp.puri_feasible_land),(select sum(areaac*0.404) AS areagovt from coast_oltp.puri_govt_land),(select sum(areaac*0.404) AS area_fes from coast_oltp.puri_feasible_land)from coast_oltp.puri_govt_land group by distname", nativeQuery = true)
	List<Object> getGovtFeasLandInfoChart(String dist);

	@Query(value = "select 'Baleshwar' as distname ,sum(areaac*0.404),count(distinct regno) from coast_oltp.baleshwar_leas_plots group by distname\r\n"
			+ "union\r\n"
			+ "select 'Bhadrak' as distname ,sum(areaac*0.404),count(distinct regno) from coast_oltp.bhadrak_leas_plots group by distname\r\n"
			+ "union\r\n"
			+ "select 'Ganjam' as distname ,sum(areaac*0.404),count(distinct regno) from coast_oltp.ganjam_leas_plots group by distname\r\n"
			+ "union\r\n"
			+ "select 'Kendrapada' as distname ,sum(areaac*0.404),count(distinct regno) from coast_oltp.Kendrapara_Leas_Plots group by distname\r\n"
			+ "union\r\n"
			+ "select 'Jagatsinghpur' as distname ,sum(areaac*0.404),count(distinct regno) from coast_oltp.Jagatsinghapur_Leas_Plots group by distname\r\n"
			+ "union\r\n"
			+ "select 'Puri' as distname ,sum(areaac*0.404),count(distinct regno) from coast_oltp.Puri_Leas_Plots group by distname ", nativeQuery = true)
	List<Object> getGovtLandInfo(String dist);
	
	@Query(value="select 'Baleshwar' as distname,sum(areaac*0.404),'7' as distsort,count(distinct regno)  from coast_oltp.baleshwar_leas_plots group by distname\r\n" + 
			"union\r\n" + 
			"select 'Bhadrak' as distname,sum(areaac*0.404),'6' as distsort,count(distinct regno)  from coast_oltp.bhadrak_leas_plots group by distname\r\n" + 
			"union\r\n" + 
			"select 'Ganjam' as distname,sum(areaac*0.404),'1' as distsort,count(distinct regno)  from coast_oltp.ganjam_leas_plots group by distname\r\n" + 
			"union\r\n" + 
			"select 'Kendrapada' as distname,sum(areaac*0.404),'5' as distsort,count(distinct regno)  from coast_oltp.Kendrapara_Leas_Plots group by distname\r\n" + 
			"union\r\n" + 
			"select 'Jagatsinghpur' as distname,sum(areaac*0.404),'4' as distsort,count(distinct regno)  from coast_oltp.Jagatsinghapur_Leas_Plots group by distname\r\n" + 
			"union\r\n" + 
			"select 'Puri' as distname,sum(areaac*0.404),'3' as distsort,count(distinct regno)  from coast_oltp.Puri_Leas_Plots group by distname order by distsort\r\n" + 
			"",nativeQuery = true)
	List<Object> getRegdFarm(String dist);
	

	@Procedure(procedureName = "coast_oltp.FN_GET_AQUPNDAREABYDIST")
	List<Object> getAquaPondAreaByDist(@Param("p_distname") String p_distname);

	List<Object> getGovtLandInfoByDist(String dist);

	List<Object> getGovtFeasLandInfoChartByDist(String dist);

		

}
