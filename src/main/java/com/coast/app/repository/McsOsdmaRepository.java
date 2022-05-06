package com.coast.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.coast.app.entity.Mcs_Osdma;


public interface McsOsdmaRepository extends CrudRepository<Mcs_Osdma, Integer> 
{
	@Query(value = "SELECT count(*) FROM coast_oltp.mcs_osdma", nativeQuery = true)
    int getCount();

	@Query(value = "SELECT count(*) FROM coast_oltp.mcs_osdma where dist_name in(:dist)", nativeQuery = true)
	int getCount(List<String> dist);
	
}
