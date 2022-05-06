package com.coast.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.coast.app.dto.StudyAreaVillagesDto;
import com.coast.app.entity.StudyAreaVillages;

public interface ApiStudyAreaVillagesRepository extends CrudRepository<StudyAreaVillages, Integer> 
{

	@Query(value = "SELECT DISTINCT blockname FROM coast_oltp.study_area_villages where distname=:dist ORDER BY blockname ASC ", nativeQuery = true)
	List<String> getAllTehsil(@Param(value = "dist") String dist);

	@Query(value = "SELECT DISTINCT gpname FROM coast_oltp.study_area_villages WHERE distname=:dist AND tehname=:tehsil ORDER BY gpname ASC", nativeQuery = true)
	List<String> getAllGp(@Param(value = "dist") String dist, @Param(value = "tehsil") String tehsil);
	

	@Query(value = "SELECT DISTINCT villname\r\n" + " FROM coast_oltp.study_area_villages where distname=:dist and tehname=:tehsil and gpname=:gp ORDER BY villname ASC ", nativeQuery = true)
	List<String> getAllVillage(@Param(value = "dist") String dist, @Param(value = "tehsil") String tehsil, @Param(value = "gp") String gp);

	@Query(value = "SELECT DISTINCT villname\r\n" + " FROM coast_oltp.study_area_villages where distname=:dist and tehname=:tehsil ORDER BY villname ASC ", nativeQuery = true)
	List<String> getAllVillage(@Param(value = "dist") String dist, @Param(value = "tehsil") String tehsil);

	/*
	 * @Query(value = "SELECT DISTINCT villname\r\n" +
	 * " FROM coast_oltp.study_area_villages where distname=:dist and tehname=:tehsil and gpname=:gp ORDER BY villname ASC "
	 * , nativeQuery = true) List<String> getAllVillage(@Param(value = "dist")
	 * String dist,@Param(value = "tehsil") String tehsil ,@Param(value = "gp")
	 * String gp);
	 */

}
