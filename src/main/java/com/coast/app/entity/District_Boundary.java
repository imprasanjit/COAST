package  com.coast.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "DISTRICT_BOUNDARY",schema = "coast_oltp")
public class District_Boundary {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "GID")
	private int gid;

	private String stateCode;

	private String distCode;

	private String distName;

	private String coastDist;

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getStateCode() {
		return stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getDistCode() {
		return distCode;
	}

	public void setDistCode(String distCode) {
		this.distCode = distCode;
	}

	public String getDistName() {
		return distName;
	}

	public void setDistName(String distName) {
		this.distName = distName;
	}

	public String getCoastDist() {
		return coastDist;
	}

	public void setCoastDist(String coastDist) {
		this.coastDist = coastDist;
	}

	
}
