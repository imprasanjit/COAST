package com.coast.app.dto;

import java.util.List;

public class DashboardFilterDto {
	private Integer tehsil;
	private Integer vill;
	private String aqpndcount;
	private String feslndcount;
	private String govtlndcount;
	private String reglandcount;
	private String district_name;
	private List<Aquapondinfo_chart> aquapondinfo_chart;
	private List<Govtlandinfo_chart> govtlandinfo_chart;
	private List<Govtfeaslandinfo_chart> govtfeaslandinfo_chart;
	private List<Aquapond_regfarm_info> aquapond_regfarm_info;

	public Integer getTehsil() {
		return tehsil;
	}

	public void setTehsil(Integer tehsil) {
		this.tehsil = tehsil;
	}

	public Integer getVill() {
		return vill;
	}

	public void setVill(Integer vill) {
		this.vill = vill;
	}

	public String getAqpndcount() {
		return aqpndcount;
	}

	public void setAqpndcount(String aqpndcount) {
		this.aqpndcount = aqpndcount;
	}

	public String getFeslndcount() {
		return feslndcount;
	}

	public void setFeslndcount(String feslndcount) {
		this.feslndcount = feslndcount;
	}

	public String getGovtlndcount() {
		return govtlndcount;
	}

	public void setGovtlndcount(String govtlndcount) {
		this.govtlndcount = govtlndcount;
	}

	public String getReglandcount() {
		return reglandcount;
	}

	public void setReglandcount(String reglandcount) {
		this.reglandcount = reglandcount;
	}

	public String getDistrict_name() {
		return district_name;
	}

	public void setDistrict_name(String district_name) {
		this.district_name = district_name;
	}

	public List<Aquapondinfo_chart> getAquapondinfo_chart() {
		return aquapondinfo_chart;
	}

	public void setAquapondinfo_chart(List<Aquapondinfo_chart> aquapondinfo_chart) {
		this.aquapondinfo_chart = aquapondinfo_chart;
	}

	public List<Govtlandinfo_chart> getGovtlandinfo_chart() {
		return govtlandinfo_chart;
	}

	public void setGovtlandinfo_chart(List<Govtlandinfo_chart> govtlandinfo_chart) {
		this.govtlandinfo_chart = govtlandinfo_chart;
	}

	public List<Govtfeaslandinfo_chart> getGovtfeaslandinfo_chart() {
		return govtfeaslandinfo_chart;
	}

	public void setGovtfeaslandinfo_chart(List<Govtfeaslandinfo_chart> govtfeaslandinfo_chart) {
		this.govtfeaslandinfo_chart = govtfeaslandinfo_chart;
	}

	public List<Aquapond_regfarm_info> getAquapond_regfarm_info() {
		return aquapond_regfarm_info;
	}

	public void setAquapond_regfarm_info(List<Aquapond_regfarm_info> aquapond_regfarm_info) {
		this.aquapond_regfarm_info = aquapond_regfarm_info;
	}

}
