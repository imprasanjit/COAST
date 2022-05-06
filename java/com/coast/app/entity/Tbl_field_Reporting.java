package com.coast.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_field_reporting",schema = "coast_oltp")
public class Tbl_field_Reporting {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "slno")
	Integer slno;
	String distname;
	String tehname;
	String gpname;
	String villname;
	String plotno;
	String img;
	String lat;
	String lon;
	String remark;

	public Tbl_field_Reporting() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getSlno() {
		return slno;
	}

	public void setSlno(Integer slno) {
		this.slno = slno;
	}

	public String getDistname() {
		return distname;
	}

	public void setDistname(String distname) {
		this.distname = distname;
	}

	public String getTehname() {
		return tehname;
	}

	public void setTehname(String tehname) {
		this.tehname = tehname;
	}

	public String getGpname() {
		return gpname;
	}

	public void setGpname(String gpname) {
		this.gpname = gpname;
	}

	public String getVillname() {
		return villname;
	}

	public void setVillname(String villname) {
		this.villname = villname;
	}

	public String getPlotno() {
		return plotno;
	}

	public void setPlotno(String plotno) {
		this.plotno = plotno;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


}
