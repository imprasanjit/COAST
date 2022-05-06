package com.coast.app.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_type",schema = "coast_oltp")
public class UserType {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer usertypeid;
	private String usertypename;
	private Integer usertypestatus;

	public Integer getUsertypeid() {
		return usertypeid;
	}

	public void setUsertypeid(Integer usertypeid) {
		this.usertypeid = usertypeid;
	}

	public String getUsertypename() {
		return usertypename;
	}

	public void setUsertypename(String usertypename) {
		this.usertypename = usertypename;
	}

	public Integer getUsertypestatus() {
		return usertypestatus;
	}

	public void setUsertypestatus(Integer usertypestatus) {
		this.usertypestatus = usertypestatus;
	}

}
