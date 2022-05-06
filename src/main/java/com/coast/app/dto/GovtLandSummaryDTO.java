package com.coast.app.dto;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.data.annotation.Immutable;

@Entity
@Immutable
public class GovtLandSummaryDTO {
	@Id
	private Integer row_number;
	private String distname;
	private String tehname;
	private String gpname;
	private String villname;
	private String plotno;
	//private Integer pondno;
	private Double areaac;
	
	
	public Integer getRow_number() {
		return row_number;
	}
	public void setRow_number(Integer row_number) {
		this.row_number = row_number;
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
	public Double getAreaac() {
		return areaac;
	}
	public void setAreaac(Double areaac) {
		this.areaac = areaac;
	}
	

}
