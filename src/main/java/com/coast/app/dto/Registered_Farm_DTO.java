package com.coast.app.dto;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.data.annotation.Immutable;

@Entity
@Immutable
public class Registered_Farm_DTO {
	@Id
	private Integer gid;
	private String distname;
	private String villname;
	private String gpname;
	private String tehname;
	private String plotno;
	private String regno;
	private String status;
	private double apac;
	private double glac;
	private String khatano;
	
	public String getDistname() {
		return distname;
	}
	public void setDistname(String distname) {
		this.distname = distname;
	}
	public String getKhatano() {
		return khatano;
	}
	public void setKhatano(String khatano) {
		this.khatano = khatano;
	}
	public String getKisameng() {
		return kisameng;
	}
	public void setKisameng(String kisameng) {
		this.kisameng = kisameng;
	}
	public double getLeasac() {
		return leasac;
	}
	public void setLeasac(double leasac) {
		this.leasac = leasac;
	}
	public double getApaac() {
		return apaac;
	}
	public void setApaac(double apaac) {
		this.apaac = apaac;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	private String kisameng;
	private double areaac;
	private double leasac;
	private double apaac;
	private double lat;
	private double lon;
	
	
	
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	private double getAreaac() {
		return areaac;
	}
	public void setAreaac(double areaac) {
		this.areaac = areaac;
	}
	public String getVillname() {
		return villname;
	}
	public void setVillname(String villname) {
		this.villname = villname;
	}
	public String getGpname() {
		return gpname;
	}
	public void setGpname(String gpname) {
		this.gpname = gpname;
	}
	public String getTehname() {
		return tehname;
	}
	public void setTehname(String tehname) {
		this.tehname = tehname;
	}
	public String getPlotno() {
		return plotno;
	}
	public void setPlotno(String plotno) {
		this.plotno = plotno;
	}
	public String getRegno() {
		return regno;
	}
	public void setRegno(String regno) {
		this.regno = regno;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getApac() {
		return apac;
	}
	public void setApac(double apac) {
		this.apac = apac;
	}
	public double getGlac() {
		return glac;
	}
	public void setGlac(double glac) {
		this.glac = glac;
	}
	

	

}
