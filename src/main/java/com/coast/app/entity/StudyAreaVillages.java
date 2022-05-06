package com.coast.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "STUDY_AREA_VILLAGES",schema = "coast_oltp")
public class StudyAreaVillages {
	
	private int gid;
	private String villCode;
	private String villName;
	private String gpName;
	private String gpCode;
	private String tehName;
	private String blockName;
	private String distName;
	private double areaha;
	private String remarks;
	private double areaac;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="GID")
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getVillCode() {
		return villCode;
	}
	public void setVillCode(String villCode) {
		this.villCode = villCode;
	}
	public String getVillName() {
		return villName;
	}
	public void setVillName(String villName) {
		this.villName = villName;
	}
	public String getGpName() {
		return gpName;
	}
	public void setGpName(String gpName) {
		this.gpName = gpName;
	}
	public String getGpCode() {
		return gpCode;
	}
	public void setGpCode(String gpCode) {
		this.gpCode = gpCode;
	}
	public String getTehName() {
		return tehName;
	}
	public void setTehName(String tehName) {
		this.tehName = tehName;
	}
	public String getBlockName() {
		return blockName;
	}
	public void setBlockName(String blockName) {
		this.blockName = blockName;
	}
	public String getDistName() {
		return distName;
	}
	public void setDistName(String distName) {
		this.distName = distName;
	}
	public double getAreaha() {
		return areaha;
	}
	public void setAreaha(double areaha) {
		this.areaha = areaha;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public double getAreaac() {
		return areaac;
	}
	public void setAreaac(double areaac) {
		this.areaac = areaac;
	}
	

}
