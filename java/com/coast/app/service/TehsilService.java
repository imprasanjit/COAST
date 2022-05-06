package com.coast.app.service;

import java.util.List;

public interface TehsilService {
	public List<String> findbydist(String dist);

	public List<String> findbydisttehsil(String dist, String tehsil);

	public List<String> findbydisttehsilgp(String dist, String tehsil, String gp);

	public List<String> findbydistAndtehsil(String dist, String tehsil);

	//public List<String> findbydisttehsilgpvillage(String dist, String tehsil, String gp, String village);
}
