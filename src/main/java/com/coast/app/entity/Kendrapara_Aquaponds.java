package  com.coast.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="KENDRAPARA_AQUAPONDS",schema = "coast_oltp")
public class Kendrapara_Aquaponds {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="GID")
	private int gid;
    private double pondNo; 
    private String pondCode;
    private double areaHa;
    private double areaAc;
    private String distName;
    private String tehName;
    private String regNo;
    private String licensed;
    private double totgaAc;
    private double totpaAc;
    private double gfAc;
    private double gnfAc;
    private double crzaAc;
    private String villCode;
    private String villName;   
    private String gpName;
    private double lat;
    private double lon;
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public double getPondNo() {
		return pondNo;
	}
	public void setPondNo(double pondNo) {
		this.pondNo = pondNo;
	}
	public String getPondCode() {
		return pondCode;
	}
	public void setPondCode(String pondCode) {
		this.pondCode = pondCode;
	}
	public double getAreaHa() {
		return areaHa;
	}
	public void setAreaHa(double areaHa) {
		this.areaHa = areaHa;
	}
	public double getAreaAc() {
		return areaAc;
	}
	public void setAreaAc(double areaAc) {
		this.areaAc = areaAc;
	}
	public String getDistName() {
		return distName;
	}
	public void setDistName(String distName) {
		this.distName = distName;
	}
	public String getTehName() {
		return tehName;
	}
	public void setTehName(String tehName) {
		this.tehName = tehName;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getLicensed() {
		return licensed;
	}
	public void setLicensed(String licensed) {
		this.licensed = licensed;
	}
	public double getTotgaAc() {
		return totgaAc;
	}
	public void setTotgaAc(double totgaAc) {
		this.totgaAc = totgaAc;
	}
	public double getTotpaAc() {
		return totpaAc;
	}
	public void setTotpaAc(double totpaAc) {
		this.totpaAc = totpaAc;
	}
	public double getGfAc() {
		return gfAc;
	}
	public void setGfAc(double gfAc) {
		this.gfAc = gfAc;
	}
	public double getGnfAc() {
		return gnfAc;
	}
	public void setGnfAc(double gnfAc) {
		this.gnfAc = gnfAc;
	}
	public double getCrzaAc() {
		return crzaAc;
	}
	public void setCrzaAc(double crzaAc) {
		this.crzaAc = crzaAc;
	}
	public String getVillCode() {
		return villCode;
	}
	public void setVillCode(String villCode) {
		this.villCode = villCode;
	}
	public String getVillName() {
		return villName;
	}
	public void setVillName(String villName) {
		this.villName = villName;
	}
	public String getGpName() {
		return gpName;
	}
	public void setGpName(String gpName) {
		this.gpName = gpName;
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
