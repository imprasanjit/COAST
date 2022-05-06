package com.coast.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FLC_FISHHARBOUR_JETTIES_PORT",schema = "coast_oltp")
public class FlcFishharbourJettiesPort {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="GID")
	 private int gid;
		private int id;
		private String majorloca;
		private String distname;
		private double longdd;
		private double latdd;
		private String desc;
		public int getGid() {
			return gid;
		}
		public void setGid(int gid) {
			this.gid = gid;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getMajorloca() {
			return majorloca;
		}
		public void setMajorloca(String majorloca) {
			this.majorloca = majorloca;
		}
		public String getDistname() {
			return distname;
		}
		public void setDistname(String distname) {
			this.distname = distname;
		}
		public double getLongdd() {
			return longdd;
		}
		public void setLongdd(double longdd) {
			this.longdd = longdd;
		}
		public double getLatdd() {
			return latdd;
		}
		public void setLatdd(double latdd) {
			this.latdd = latdd;
		}
		public String getDesc() {
			return desc;
		}
		public void setDesc(String desc) {
			this.desc = desc;
		}
		
}
