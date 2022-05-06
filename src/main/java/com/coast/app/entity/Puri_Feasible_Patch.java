package  com.coast.app.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PURI_FEASIBLE_PATCH",schema = "coast_oltp")
public class Puri_Feasible_Patch {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "GID")
	private int gid;
	private double paId;
	private String distName;
	private double areaAc;
	private String paCatg;
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public double getPaId() {
		return paId;
	}
	public void setPaId(double paId) {
		this.paId = paId;
	}
	public String getDistName() {
		return distName;
	}
	public void setDistName(String distName) {
		this.distName = distName;
	}
	public double getAreaAc() {
		return areaAc;
	}
	public void setAreaAc(double areaAc) {
		this.areaAc = areaAc;
	}
	public String getPaCatg() {
		return paCatg;
	}
	public void setPaCatg(String paCatg) {
		this.paCatg = paCatg;
	}
}
