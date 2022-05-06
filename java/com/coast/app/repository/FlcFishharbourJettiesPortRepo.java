package com.coast.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.coast.app.entity.FlcFishharbourJettiesPort;

public interface FlcFishharbourJettiesPortRepo extends CrudRepository<FlcFishharbourJettiesPort, Integer> 
{
	@Query(value = "SELECT count(*) FROM coast_oltp.flc_fishharbour_jetties_port where \"desc\"='FLC'", nativeQuery = true)
	int getCountByFlc();
	@Query(value = "SELECT count(*) FROM coast_oltp.flc_fishharbour_jetties_port where \"desc\"='Fishing Harbour'", nativeQuery = true)
	int getCountByFishingHarbour();
	@Query(value = "SELECT count(*) FROM coast_oltp.flc_fishharbour_jetties_port where \"desc\"='Jetties'", nativeQuery = true)
	int getCountByJetties();
	@Query(value = "SELECT count(*) FROM coast_oltp.flc_fishharbour_jetties_port where \"desc\"='Port'", nativeQuery = true)
	int getCountByPort();
	@Query(value = "SELECT count(*) FROM coast_oltp.flc_fishharbour_jetties_port where \"desc\"='Light House'", nativeQuery = true)
	int getCountByLightHouse();
	
	@Query(value = "SELECT count(*) FROM coast_oltp.flc_fishharbour_jetties_port where \"desc\"='FLC' and distname in(:dist)", nativeQuery = true)
	int getCountByFlc(List<String> dist);
	
	@Query(value = "SELECT count(*) FROM coast_oltp.flc_fishharbour_jetties_port where \"desc\"='Fishing Harbour' and distname in(:dist)", nativeQuery = true)
	int getCountByFishingHarbour(List<String> dist);
	
	@Query(value = "SELECT count(*) FROM coast_oltp.flc_fishharbour_jetties_port where \"desc\"='Jetties' and distname in(:dist)", nativeQuery = true)
	int getCountByJetties(List<String> dist);
	
	@Query(value = "SELECT count(*) FROM coast_oltp.flc_fishharbour_jetties_port where \"desc\"='Light House' and distname in(:dist)", nativeQuery = true)
	int getCountByLightHouse(List<String> dist);
	
	@Query(value = "SELECT count(*) FROM coast_oltp.flc_fishharbour_jetties_port where \"desc\"='Port' and distname in(:dist)", nativeQuery = true)
	int getCountByPort(List<String> dist);
}
