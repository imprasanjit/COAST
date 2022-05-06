package com.coast.app.entity;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vill_summary_table",schema = "coast_oltp")
public class Village_Summary {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="slno")
private Integer slno;
private String dist_name;
private String teh_name;
private String vill_name;
private Double total_govtLand;
private Double gvtlnd_notconsidered;
private Double gvtfeslnd_considered;
private Double aqpond_area;
private Double common_regland_aqua_within_feasiblelnd;
private Double reglnd_in_feslnd;
private Double feslnd_utilised;
private Double available_feslnd;
public Integer getSlno() {
	return slno;
}
public void setSlno(Integer slno) {
	this.slno = slno;
}
public String getDist_name() {
	return dist_name;
}
public void setDist_name(String dist_name) {
	this.dist_name = dist_name;
}
public String getTeh_name() {
	return teh_name;
}
public void setTeh_name(String teh_name) {
	this.teh_name = teh_name;
}
public String getVill_name() {
	return vill_name;
}
public void setVill_name(String vill_name) {
	this.vill_name = vill_name;
}
public Double getTotal_govtLand() {
	return total_govtLand;
}
public void setTotal_govtLand(Double total_govtLand) {
	this.total_govtLand = total_govtLand;
}
public Double getGvtlnd_notconsidered() {
	return gvtlnd_notconsidered;
}
public void setGvtlnd_notconsidered(Double gvtlnd_notconsidered) {
	this.gvtlnd_notconsidered = gvtlnd_notconsidered;
}
public Double getGvtfeslnd_considered() {
	return gvtfeslnd_considered;
}
public void setGvtfeslnd_considered(Double gvtfeslnd_considered) {
	this.gvtfeslnd_considered = gvtfeslnd_considered;
}
public Double getAqpond_area() {
	return aqpond_area;
}
public void setAqpond_area(Double aqpond_area) {
	this.aqpond_area = aqpond_area;
}
public Double getCommon_regland_aqua_within_feasiblelnd() {
	return common_regland_aqua_within_feasiblelnd;
}
public void setCommon_regland_aqua_within_feasiblelnd(Double common_regland_aqua_within_feasiblelnd) {
	this.common_regland_aqua_within_feasiblelnd = common_regland_aqua_within_feasiblelnd;
}

public Double getReglnd_in_feslnd() {
	return reglnd_in_feslnd;
}
public void setReglnd_in_feslnd(Double reglnd_in_feslnd) {
	this.reglnd_in_feslnd = reglnd_in_feslnd;
}
public Double getFeslnd_utilised() {
	return feslnd_utilised;
}
public void setFeslnd_utilised(Double feslnd_utilised) {
	this.feslnd_utilised = feslnd_utilised;
}
public Double getAvailable_feslnd() {
	return available_feslnd;
}
public void setAvailable_feslnd(Double available_feslnd) {
	this.available_feslnd = available_feslnd;
}

}
