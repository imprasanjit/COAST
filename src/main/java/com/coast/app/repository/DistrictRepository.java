package com.coast.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.coast.app.entity.District_Boundary;

public interface DistrictRepository extends JpaRepository<District_Boundary, Integer>{

	@Query(value = "SELECT ST_AsGeoJSON(ST_Transform(geom,4326)) from layers.district_boundary  where dist_name=:dist", nativeQuery = true)
	String  getGeoJsonBydistName(String dist);

	List<District_Boundary> findAllByCoastDist(String string);
       
}
