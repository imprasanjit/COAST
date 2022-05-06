package  com.coast.app.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "KHURDHA_LEAS_PLOTS",schema = "coast_oltp")
public class Khurdha_Leas_Plots {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="GID")
	private int gid;
	private double sl;

	private String villName;

	private String villCode;

	private String plotNo;

	private String plotCode;

	private String tehName;

	private double areaAc;

	private String regNo;
	private Date issueDate;

	private String name;

	private String fatherN;

	private String address;
	private double wsa;

	private String status;

	private String khataNo;

	private String caaOsp;

	private String apExist;
	private double apAc;
	private double glAc;

	private String gpName;

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public double getSl() {
		return sl;
	}

	public void setSl(double sl) {
		this.sl = sl;
	}

	public String getVillName() {
		return villName;
	}

	public void setVillName(String villName) {
		this.villName = villName;
	}

	public String getVillCode() {
		return villCode;
	}

	public void setVillCode(String villCode) {
		this.villCode = villCode;
	}

	public String getPlotNo() {
		return plotNo;
	}

	public void setPlotNo(String plotNo) {
		this.plotNo = plotNo;
	}

	public String getPlotCode() {
		return plotCode;
	}

	public void setPlotCode(String plotCode) {
		this.plotCode = plotCode;
	}

	public String getTehName() {
		return tehName;
	}

	public void setTehName(String tehName) {
		this.tehName = tehName;
	}

	public double getAreaAc() {
		return areaAc;
	}

	public void setAreaAc(double areaAc) {
		this.areaAc = areaAc;
	}

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFatherN() {
		return fatherN;
	}

	public void setFatherN(String fatherN) {
		this.fatherN = fatherN;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getWsa() {
		return wsa;
	}

	public void setWsa(double wsa) {
		this.wsa = wsa;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getKhataNo() {
		return khataNo;
	}

	public void setKhataNo(String khataNo) {
		this.khataNo = khataNo;
	}

	public String getCaaOsp() {
		return caaOsp;
	}

	public void setCaaOsp(String caaOsp) {
		this.caaOsp = caaOsp;
	}

	public String getApExist() {
		return apExist;
	}

	public void setApExist(String apExist) {
		this.apExist = apExist;
	}

	public double getApAc() {
		return apAc;
	}

	public void setApAc(double apAc) {
		this.apAc = apAc;
	}

	public double getGlAc() {
		return glAc;
	}

	public void setGlAc(double glAc) {
		this.glAc = glAc;
	}

	public String getGpName() {
		return gpName;
	}

	public void setGpName(String gpName) {
		this.gpName = gpName;
	}

}
