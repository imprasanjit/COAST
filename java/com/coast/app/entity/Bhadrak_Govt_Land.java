package com.coast.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BHADRAK_GOVT_LAND",schema = "coast_oltp")
public class Bhadrak_Govt_Land {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="GID")
	private int gid;
	private double id;

	private String villCode;

	private String villName;

	private String distName;

	private String tehName;

	private String khataNo;

	private String tenants;

	private String plotNo;
	private double areaAc;

	private String kisam;

	private String kisamEng;

	private String linkNo;

	private String linkCode;

	private String gType;

	private String tenantSts;

	private String fdVil;

	private String kisamSts;

	private String gpName;

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public double getId() {
		return id;
	}

	public void setId(double id) {
		this.id = id;
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

	public String getDistName() {
		return distName;
	}

	public void setDistName(String distName) {
		this.distName = distName;
	}

	public String getTehName() {
		return tehName;
	}

	public void setTehName(String tehName) {
		this.tehName = tehName;
	}

	public String getKhataNo() {
		return khataNo;
	}

	public void setKhataNo(String khataNo) {
		this.khataNo = khataNo;
	}

	public String getTenants() {
		return tenants;
	}

	public void setTenants(String tenants) {
		this.tenants = tenants;
	}

	public String getPlotNo() {
		return plotNo;
	}

	public void setPlotNo(String plotNo) {
		this.plotNo = plotNo;
	}

	public double getAreaAc() {
		return areaAc;
	}

	public void setAreaAc(double areaAc) {
		this.areaAc = areaAc;
	}

	public String getKisam() {
		return kisam;
	}

	public void setKisam(String kisam) {
		this.kisam = kisam;
	}

	public String getKisamEng() {
		return kisamEng;
	}

	public void setKisamEng(String kisamEng) {
		this.kisamEng = kisamEng;
	}

	public String getLinkNo() {
		return linkNo;
	}

	public void setLinkNo(String linkNo) {
		this.linkNo = linkNo;
	}

	public String getLinkCode() {
		return linkCode;
	}

	public void setLinkCode(String linkCode) {
		this.linkCode = linkCode;
	}

	public String getgType() {
		return gType;
	}

	public void setgType(String gType) {
		this.gType = gType;
	}

	public String getTenantSts() {
		return tenantSts;
	}

	public void setTenantSts(String tenantSts) {
		this.tenantSts = tenantSts;
	}

	public String getFdVil() {
		return fdVil;
	}

	public void setFdVil(String fdVil) {
		this.fdVil = fdVil;
	}

	public String getKisamSts() {
		return kisamSts;
	}

	public void setKisamSts(String kisamSts) {
		this.kisamSts = kisamSts;
	}

	public String getGpName() {
		return gpName;
	}

	public void setGpName(String gpName) {
		this.gpName = gpName;
	}

	
}
