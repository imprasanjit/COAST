package com.coast.app.dto;

public class FeasibleLandResponse {

//	private String distname;
//	private String tehname;
//	private String gpname;
//	private String villname;
//	private String khatano;
//	private String plotno;
//	private String kisameng;
//	private double areaac;
//	private double leasac;
//	private double apaac;
//	private double lat;
//	private double lon;

	private Integer r_slno;
	private String r_dist;
	private String r_tehsil;
	private String r_gp;
	private String r_village;
	private String r_plotno;
	private String r_kisama;
	private double r_area;
	private double lat;
	private double lon;

	public Integer getR_slno() {
		return r_slno;
	}

	public void setR_slno(Integer r_slno) {
		this.r_slno = r_slno;
	}

	public String getR_dist() {
		return r_dist;
	}

	public void setR_dist(String r_dist) {
		this.r_dist = r_dist;
	}

	public String getR_tehsil() {
		return r_tehsil;
	}

	public void setR_tehsil(String r_tehsil) {
		this.r_tehsil = r_tehsil;
	}

	public String getR_gp() {
		return r_gp;
	}

	public void setR_gp(String r_gp) {
		this.r_gp = r_gp;
	}

	public String getR_village() {
		return r_village;
	}

	public void setR_village(String r_village) {
		this.r_village = r_village;
	}

	public String getR_plotno() {
		return r_plotno;
	}

	public void setR_plotno(String r_plotno) {
		this.r_plotno = r_plotno;
	}

	public String getR_kisama() {
		return r_kisama;
	}

	public void setR_kisama(String r_kisama) {
		this.r_kisama = r_kisama;
	}

	public double getR_area() {
		return r_area;
	}

	public void setR_area(double r_area) {
		this.r_area = r_area;
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

}
