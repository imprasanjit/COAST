package com.coast.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.coast.app.entity.StudyAreaVillages;


@Repository
public interface StudyAreaVillagesRepository extends CrudRepository<StudyAreaVillages, Integer> 
{
	

	@Query(value = "SELECT count(villname) FROM coast_oltp.study_area_villages", nativeQuery = true)
	int getCountByVillageName();

	@Query(value = "SELECT count(DISTINCT tehName) FROM coast_oltp.study_area_villages", nativeQuery = true)
	int getCountByTehsilName();

	@Procedure(procedureName = "coast_oltp.FN_GET_TOTAQUPND")
	String getTotalAquapond(@Param("p_distname") String p_distname);

	@Procedure(procedureName = "coast_oltp.FN_GET_GOVTLANDAREA")
	String getTotalGovtLandArea(@Param("p_distname") String p_distname);

	@Procedure(procedureName = "coast_oltp.FN_GET_AQUPNDAREA")
	String getTotalTotalAquapondArea(@Param("p_distname") String p_distname);

	@Procedure(procedureName = "coast_oltp.FN_GET_FEASGOVTLNDAR")
	String getTotalFeasGovtLndar(@Param("p_distname") String dist);

	@Procedure(procedureName = "coast_oltp.FN_GET_REGFARM_AREA")
	String getTotalRegFarmArea(@Param("p_distname") String p_distname);

	@Query(value = "SELECT DISTINCT blockname FROM coast_oltp.study_area_villages where distname=:dist ORDER BY blockname ASC ", nativeQuery = true)
	List<String> getTehsil(@Param(value = "dist") String dist);

	@Query(value = "SELECT DISTINCT gpname FROM coast_oltp.study_area_villages WHERE distname=:dist AND tehname=:tehsil ORDER BY gpname ASC", nativeQuery = true)
	List<String> getGp(@Param(value = "dist") String dist, @Param(value = "tehsil") String tehsil);

	@Query(value = "SELECT DISTINCT villname\r\n"
	+ " FROM coast_oltp.study_area_villages where distname=:dist and tehname=:tehsil and gpname=:gp ORDER BY villname ASC ", nativeQuery = true)
	List<String> getVillage(@Param(value = "dist") String dist, @Param(value = "tehsil") String tehsil,
	@Param(value = "gp") String gp);
	
	@Query(value = "SELECT DISTINCT villname\r\n"
			+ " FROM coast_oltp.study_area_villages where distname=:dist and tehname=:tehsil ORDER BY villname ASC ", nativeQuery = true)
			List<String> getVillage(@Param(value = "dist") String dist, @Param(value = "tehsil") String tehsil);

	@Procedure(procedureName = "coast_oltp.FN_AQUAPOND_CHARTDATA2")
	List<Object> getchartData(@Param("p_distname") String p_distname);

	
	@Query(value = "SELECT count(villname) FROM coast_oltp.study_area_villages where distname in(:dist)", nativeQuery = true)
	int getCountByVillageName(List<String> dist);

	@Query(value = "SELECT count(DISTINCT tehName) FROM coast_oltp.study_area_villages where distname in(:dist)", nativeQuery = true)
	int getCountByTehsilName(List<String> dist);
	
	

}
