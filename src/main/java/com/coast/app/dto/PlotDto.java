package com.coast.app.dto;

public class PlotDto {
	private Integer plotNo;

	public Integer getPlotNo() {
		return plotNo;
	}

	public void setPlotNo(Integer plotNo) {
		this.plotNo = plotNo;
	}

	@Override
	public String toString() 
	{
		return "PlotDto [plotNo=" + plotNo + "]";
	}

}
