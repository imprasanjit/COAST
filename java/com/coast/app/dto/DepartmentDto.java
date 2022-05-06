package com.coast.app.dto;

public class DepartmentDto 
{
	private Integer userid;
	private Integer department_status; 
	
	private String department;

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getDepartment_status() {
		return department_status;
	}

	public void setDepartment_status(Integer department_status) {
		this.department_status = department_status;
	}

	

	
}
