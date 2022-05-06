package com.coast.app.dto;

import org.springframework.web.multipart.MultipartFile;

public class fieldReportingDto {
	String distname;
	String tehname;
	String gpname;
	String villname;
	String plotno;
	MultipartFile img;
	String lat;
	String lon;
	String remark;

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

	public MultipartFile getImg() {
		return img;
	}

	public void setImg(MultipartFile img) {
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
