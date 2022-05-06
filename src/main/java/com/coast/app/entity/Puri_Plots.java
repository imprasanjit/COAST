package  com.coast.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PURI_PLOTS",schema = "coast_oltp")
public class Puri_Plots {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "GID")
	private int gid;

	private String villCode;

	private String villName;

	private String plotNo;
	private double linkNo;

	private String linkCode;

	private String tehName;

	private String gpName;

	private String crzSts;

	private String caaSts;
	private double lat;

	private double lon;

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
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

	public String getPlotNo() {
		return plotNo;
	}

	public void setPlotNo(String plotNo) {
		this.plotNo = plotNo;
	}

	public double getLinkNo() {
		return linkNo;
	}

	public void setLinkNo(double linkNo) {
		this.linkNo = linkNo;
	}

	public String getLinkCode() {
		return linkCode;
	}

	public void setLinkCode(String linkCode) {
		this.linkCode = linkCode;
	}

	public String getTehName() {
		return tehName;
	}

	public void setTehName(String tehName) {
		this.tehName = tehName;
	}

	public String getGpName() {
		return gpName;
	}

	public void setGpName(String gpName) {
		this.gpName = gpName;
	}

	public String getCrzSts() {
		return crzSts;
	}

	public void setCrzSts(String crzSts) {
		this.crzSts = crzSts;
	}

	public String getCaaSts() {
		return caaSts;
	}

	public void setCaaSts(String caaSts) {
		this.caaSts = caaSts;
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
