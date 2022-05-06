package com.coast.app.service;

import java.util.List;
import java.util.Map;

public interface FlcFishharbourJettiesPortService 
{
	Map<String, List<Object>> getCountAll(String dist);

	Map<String, List<Object>> getCountAlldist(List<String> dist);
}
