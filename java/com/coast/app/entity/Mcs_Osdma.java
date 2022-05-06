package com.coast.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MCS_OSDMA",schema = "coast_oltp")
public class Mcs_Osdma {
	private int gid;
	private String id;
	private String mcsName;
	private String distName;
	private String blockName;
	private String tehName;
	private String riName;
	private String gpName;
	private String villName;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="GID")
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMcsName() {
		return mcsName;
	}
	public void setMcsName(String mcsName) {
		this.mcsName = mcsName;
	}
	public String getDistName() {
		return distName;
	}
	public void setDistName(String distName) {
		this.distName = distName;
	}
	public String getBlockName() {
		return blockName;
	}
	public void setBlockName(String blockName) {
		this.blockName = blockName;
	}
	public String getTehName() {
		return tehName;
	}
	public void setTehName(String tehName) {
		this.tehName = tehName;
	}
	public String getRiName() {
		return riName;
	}
	public void setRiName(String riName) {
		this.riName = riName;
	}
	public String getGpName() {
		return gpName;
	}
	public void setGpName(String gpName) {
		this.gpName = gpName;
	}
	public String getVillName() {
		return villName;
	}
	public void setVillName(String villName) {
		this.villName = villName;
	}
	

}
