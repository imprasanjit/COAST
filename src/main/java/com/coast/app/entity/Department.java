package com.coast.app.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "department",schema = "coast_oltp")
public class Department  
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer dept_id;
	private String dept_name;
	private Integer dept_status;
	
	public Integer getDept_id() {
		return dept_id;
	}
	public void setDept_id(Integer dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public Integer getDept_status() {
		return dept_status;
	}
	public void setDept_status(Integer dept_status) {
		this.dept_status = dept_status;
	}
	
	

}
