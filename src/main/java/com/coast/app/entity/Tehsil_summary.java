package com.coast.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="tehsil_sumary",schema = "coast_oltp")
public class Tehsil_summary {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="slno")
private Integer slno;
private String distname;
private String tehname;
private Double totalgovtLand;
private Double gvtlndnotconsidered;
private Double gvtfeslndconsidered;
private Double aqpondarea;
private Double reglndinfeslnd;
private Double commonreglandaquawithinfeasiblelnd;
private Double feslndutilised;
private Double availablefeslnd;
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
public Double getTotalgovtLand() {
	return totalgovtLand;
}
public void setTotalgovtLand(Double totalgovtLand) {
	this.totalgovtLand = totalgovtLand;
}
public Double getGvtlndnotconsidered() {
	return gvtlndnotconsidered;
}
public void setGvtlndnotconsidered(Double gvtlndnotconsidered) {
	this.gvtlndnotconsidered = gvtlndnotconsidered;
}
public Double getGvtfeslndconsidered() {
	return gvtfeslndconsidered;
}
public void setGvtfeslndconsidered(Double gvtfeslndconsidered) {
	this.gvtfeslndconsidered = gvtfeslndconsidered;
}
public Double getAqpondarea() {
	return aqpondarea;
}
public void setAqpondarea(Double aqpondarea) {
	this.aqpondarea = aqpondarea;
}
public Double getReglndinfeslnd() {
	return reglndinfeslnd;
}
public void setReglndinfeslnd(Double reglndinfeslnd) {
	this.reglndinfeslnd = reglndinfeslnd;
}
public Double getCommonreglandaquawithinfeasiblelnd() {
	return commonreglandaquawithinfeasiblelnd;
}
public void setCommonreglandaquawithinfeasiblelnd(Double commonreglandaquawithinfeasiblelnd) {
	this.commonreglandaquawithinfeasiblelnd = commonreglandaquawithinfeasiblelnd;
}
public Double getFeslndutilised() {
	return feslndutilised;
}
public void setFeslndutilised(Double feslndutilised) {
	this.feslndutilised = feslndutilised;
}
public Double getAvailablefeslnd() {
	return availablefeslnd;
}
public void setAvailablefeslnd(Double availablefeslnd) {
	this.availablefeslnd = availablefeslnd;
}
}
