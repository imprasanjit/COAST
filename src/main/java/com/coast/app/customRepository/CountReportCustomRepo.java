package com.coast.app.customRepository;

import java.util.List;

public interface CountReportCustomRepo 
{
	
	List<Object[]> getCountAcquapond();

	List<Object[]> getCountFeasible();

	List<Object[]> getCountLease();
}
