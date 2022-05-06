package com.coast.app.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.coast.app.entity.Department;

public interface DepartmentRepository extends JpaRepository<Department, Integer>
{

	//Boolean existsByDept_name(String deptname);
	
	//Boolean exists(String dept_name);
	
}
