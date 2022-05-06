package com.coast.app.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coast.app.repository.BalasoreAquaPondRepo;
import com.coast.app.repository.BaleswarLeasPlotsRepo;
import com.coast.app.repository.FlcFishharbourJettiesPortRepo;
import com.coast.app.repository.McsOsdmaRepository;
import com.coast.app.repository.StudyAreaVillagesRepository;
import com.coast.app.service.FlcFishharbourJettiesPortService;

@Service
public class FlcFishharbourJettiesPortServiceimpl implements FlcFishharbourJettiesPortService {

	@Autowired
	private FlcFishharbourJettiesPortRepo flcFishharbourJettiesPortRepo;

	@Autowired
	private McsOsdmaRepository mcsRepo;

	@Autowired
	private StudyAreaVillagesRepository studyAreaVillagesRepository;

	@Autowired
	private BaleswarLeasPlotsRepo baleswarLeasPlotsRepo;

	@Autowired
	private BalasoreAquaPondRepo balasoreAquaPondRepo;
	
	
	@Override
	public Map<String, List<Object>> getCountAll(String dist) {
		Map<String, List<Object>> map = new HashMap<String, List<Object>>();
		List<Object> list = new ArrayList<Object>();
		Integer fnet_totaqupnd = 0;
		Float totalFeasGovtLndar = 0.0f;
		Integer totalGovtLandArea = 0;
		Float totalRegFarmArea = 0.0f;
		Float totalTotalAquapondArea = 0.0f;

		int countByFlc = flcFishharbourJettiesPortRepo.getCountByFlc();
		int countByFishingHarbour = flcFishharbourJettiesPortRepo.getCountByFishingHarbour();
		int countByJetties = flcFishharbourJettiesPortRepo.getCountByJetties();
		int countByLightHouse = flcFishharbourJettiesPortRepo.getCountByLightHouse();
		int countByPort = flcFishharbourJettiesPortRepo.getCountByPort();
		int count = mcsRepo.getCount();
		int countByVillageName = studyAreaVillagesRepository.getCountByVillageName();
		int countByTehsilName = studyAreaVillagesRepository.getCountByTehsilName();

		fnet_totaqupnd = fnet_totaqupnd +Integer.parseInt(studyAreaVillagesRepository.getTotalAquapond(dist));
		totalFeasGovtLndar = totalFeasGovtLndar
				+ Float.parseFloat(studyAreaVillagesRepository.getTotalFeasGovtLndar(dist));//feasible govt land area
		totalGovtLandArea = totalGovtLandArea
				+ Integer.parseInt(studyAreaVillagesRepository.getTotalGovtLandArea(dist));//no. of registered farm.
		totalRegFarmArea = totalRegFarmArea + Float.parseFloat(studyAreaVillagesRepository.getTotalRegFarmArea(dist));//registered farm area
		totalTotalAquapondArea = totalTotalAquapondArea
				+ Float.parseFloat(studyAreaVillagesRepository.getTotalTotalAquapondArea(dist));

		list.add(countByPort);
		list.add(countByFishingHarbour);
		list.add(countByFlc);
		list.add(countByJetties);
		list.add(countByLightHouse);
		list.add(count);
		list.add(countByTehsilName);
		list.add(countByVillageName);
		list.add(totalTotalAquapondArea);
		list.add(fnet_totaqupnd);
		list.add(totalGovtLandArea);
		list.add(totalRegFarmArea);			
		list.add(totalFeasGovtLndar);

		List<Object> aquaPondAreaList = new ArrayList<Object>();
		List<Object> govtLandInfoList = new ArrayList<Object>();
		List<Object> govtFeasLandInfoChartList = new ArrayList<Object>();
		List<Object> regdFarmList = new ArrayList<Object>();

		if (!dist.equals("all")) {
			List<Object> aquaPondAreaByDist = baleswarLeasPlotsRepo.getAquaPondAreaByDist(dist);
			List<Object> govtLandInfoByDist = baleswarLeasPlotsRepo.getGovtLandInfoByDist(dist);
			List<Object> govtFeasLandInfoChartByDist = baleswarLeasPlotsRepo.getGovtFeasLandInfoChartByDist(dist);
			List<Object> regdFarm = baleswarLeasPlotsRepo.getRegdFarm(dist);

			Iterator itr = aquaPondAreaByDist.iterator();
			while (itr.hasNext()) {
				Object[] obj = (Object[]) itr.next();
				aquaPondAreaList.add(String.valueOf(obj[0]));
				aquaPondAreaList.add(String.valueOf(obj[1]));
				aquaPondAreaList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				if (obj[3] != null)
					aquaPondAreaList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[3]))));
				else
					aquaPondAreaList.add("0");
			}

			Iterator<Object> iterator3 = govtLandInfoByDist.iterator();
			while (iterator3.hasNext()) {
				Object[] obj = (Object[]) iterator3.next();
				govtLandInfoList.add(String.valueOf(obj[0]));
				govtLandInfoList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtLandInfoList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				if (obj[3] != null)
					govtLandInfoList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[3]))));
				else
					govtLandInfoList.add("0");
			}

			Iterator<Object> iterator = govtFeasLandInfoChartByDist.iterator();
			while (iterator.hasNext()) {
				Object[] obj = (Object[]) iterator.next();
				govtFeasLandInfoChartList.add(String.valueOf(obj[0]));
				govtFeasLandInfoChartList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtFeasLandInfoChartList.add(String.valueOf(obj[2]));

			}

		} else {

			List<Object> aquaPondArea = baleswarLeasPlotsRepo.getAquaPondArea(dist);
			List<Object> govtLandInfo = baleswarLeasPlotsRepo.getGovtLandInfo(dist);
			List<Object> regdFarm = baleswarLeasPlotsRepo.getRegdFarm(dist);
			List<Object> govtFeasLandInfoChart = baleswarLeasPlotsRepo.getGovtFeasLandInfoChart(dist);

			Iterator<Object> iterator2 = aquaPondArea.iterator();
			while (iterator2.hasNext()) {
				Object[] obj = (Object[]) iterator2.next();
				aquaPondAreaList.add(String.valueOf(obj[0]));
				aquaPondAreaList.add(String.valueOf(obj[1]));
				aquaPondAreaList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				if (obj[3] != null)
					aquaPondAreaList.add(String.valueOf(obj[3]));
				else
					aquaPondAreaList.add("0");
			}

			Iterator<Object> iterator3 = govtFeasLandInfoChart.iterator();
			while (iterator3.hasNext()) {
				Object[] obj = (Object[]) iterator3.next();
				govtFeasLandInfoChartList.add(String.valueOf(obj[0]));
				govtFeasLandInfoChartList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtFeasLandInfoChartList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				govtFeasLandInfoChartList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[3]))));
			}

			Iterator<Object> iterator = govtLandInfo.iterator();
			while (iterator.hasNext()) {
				Object[] obj = (Object[]) iterator.next();
				govtLandInfoList.add(String.valueOf(obj[0]));
				govtLandInfoList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtLandInfoList.add(String.valueOf(obj[2]));
			}

			Iterator<Object> iterator4 = regdFarm.iterator();
			while (iterator4.hasNext()) {
				Object[] obj = (Object[]) iterator4.next();
				regdFarmList.add(String.valueOf(obj[0]));
				regdFarmList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				regdFarmList.add(String.valueOf(obj[3]));
			}

		}

		List<Object> distListFinal = new ArrayList<Object>();
		for (int i = 0; i < aquaPondAreaList.size(); i++) {
			String s = (String) aquaPondAreaList.get(i);
			distListFinal.add(s);
			i = i + 3;
		}

		List<Object> value1 = new ArrayList<Object>();
		for (int i = 1; i < aquaPondAreaList.size(); i++) {
			String s = (String) aquaPondAreaList.get(i);
			value1.add(s);
			i = i + 3;
		}
		List<Object> value2 = new ArrayList<Object>();
		for (int i = 2; i < aquaPondAreaList.size(); i++) {
			String s = (String) aquaPondAreaList.get(i);
			value2.add(s);
			i = i + 3;
		}
		List<Object> value3 = new ArrayList<Object>();
		for (int i = 3; i < aquaPondAreaList.size(); i++) {
			String s = (String) aquaPondAreaList.get(i);
			value3.add(s);
			i = i + 3;
		}

		List<Object> tehsilListFinal = new ArrayList<Object>();
		for (int i = 0; i < govtLandInfoList.size(); i++) {
			String s = (String) govtLandInfoList.get(i);
			tehsilListFinal.add(s);
			i = i + 3;
		}

		List<Object> value11 = new ArrayList<Object>();
		for (int i = 1; i < govtLandInfoList.size(); i++) {
			String s = (String) govtLandInfoList.get(i);
			value11.add(s);
			i = i + 3;
		}
		List<Object> value22 = new ArrayList<Object>();
		for (int i = 2; i < govtLandInfoList.size(); i++) {
			String s = (String) govtLandInfoList.get(i);
			value22.add(s);
			i = i + 3;
		}
		List<Object> value33 = new ArrayList<Object>();
		for (int i = 3; i < govtLandInfoList.size(); i++) {
			String s = (String) govtLandInfoList.get(i);
			value33.add(s);
			i = i + 3;
		}

		List<Object> value111 = new ArrayList<Object>();
		for (int i = 0; i < govtFeasLandInfoChartList.size(); i++) {
			String s = (String) govtFeasLandInfoChartList.get(i);
			value111.add(s);
			i = i + 3;
		}
		List<Object> value222 = new ArrayList<Object>();
		for (int i = 1; i < govtFeasLandInfoChartList.size(); i++) {
			String s = (String) govtFeasLandInfoChartList.get(i);
			value222.add(s);
			i = i + 3;
		}

		List<Object> value333 = new ArrayList<Object>();
		for (int i = 2; i < govtFeasLandInfoChartList.size(); i++) {
			String s = (String) govtFeasLandInfoChartList.get(i);
			value333.add(s);
			i = i + 3;
		}
		List<Object> value777 = new ArrayList<Object>();
		for (int i = 3; i < govtFeasLandInfoChartList.size(); i++) {
			String s = (String) govtFeasLandInfoChartList.get(i);
			value777.add(s);
			i = i + 3;
		}

		List<Object> value444 = new ArrayList<Object>();
		for (int i = 0; i < regdFarmList.size(); i++) {
			String s = (String) regdFarmList.get(i);
			value444.add(s);
			i = i + 2;
		}

		List<Object> value555 = new ArrayList<Object>();
		for (int i = 1; i < regdFarmList.size(); i++) {
			String s = (String) regdFarmList.get(i);
			value555.add(s);
			i = i + 2;
		}

		List<Object> value666 = new ArrayList<Object>();
		for (int i = 2; i < regdFarmList.size(); i++) {
			String s = (String) regdFarmList.get(i);
			value666.add(s);
			i = i + 2;
		}

		map.put("list", list);
		map.put("distListFinal", distListFinal);
		map.put("value1", value1);
		map.put("value2", value2);
		map.put("value3", value3);
		map.put("tehsilListFinal", tehsilListFinal);
		map.put("value11", value11);//Total no of feasible land
		map.put("value22", value22);//Total area of govt. land in hectare
		map.put("value33", value33);//Total area of feasible land in hectare
		map.put("value111", value111);
		map.put("value222", value222);
		map.put("value333", value333);
		map.put("value777", value777);
		map.put("value444", value444);
		map.put("value555", value555);
		map.put("value666", value666);
		return map;
	}


	@Override
	public Map<String, List<Object>> getCountAlldist(List<String> dist) {
		Map<String, List<Object>> map = new HashMap<String, List<Object>>();
		List<Object> list = new ArrayList<Object>();
		Integer fnet_totaqupnd = 0;
		Float totalFeasGovtLndar = 0.0f;
		Integer totalGovtLandArea = 0;
		Float totalRegFarmArea = 0.0f;
		Float totalTotalAquapondArea = 0.0f;
		
		int countByFlc = flcFishharbourJettiesPortRepo.getCountByFlc(dist);
		int countByFishingHarbour = flcFishharbourJettiesPortRepo.getCountByFishingHarbour(dist);
		int countByJetties = flcFishharbourJettiesPortRepo.getCountByJetties(dist);
		int countByLightHouse = flcFishharbourJettiesPortRepo.getCountByLightHouse(dist);
		int countByPort = flcFishharbourJettiesPortRepo.getCountByPort(dist);
		int count = mcsRepo.getCount(dist);
		
		List<String> newdist = new ArrayList<String>();
		for (int i = 0; i < dist.size(); i++) {
			if (dist.get(i).contains("Jajpur")) {
				newdist.add(dist.get(i).replace("Jajpur", "Jajapur"));

			} else {
				newdist.add(dist.get(i));
			}

		}

		int countByVillageName = studyAreaVillagesRepository.getCountByVillageName(newdist);

		int countByTehsilName = studyAreaVillagesRepository.getCountByTehsilName(newdist);

		
		for (int i = 0; i < dist.size(); i++) {
			String totalAquapond = studyAreaVillagesRepository.getTotalAquapond(dist.get(i));
			if(totalAquapond!=null) {
				fnet_totaqupnd = fnet_totaqupnd
						+ Integer.parseInt(totalAquapond);
			}
			String totalFeasGovtLndar2 = studyAreaVillagesRepository.getTotalFeasGovtLndar(dist.get(i));
			if(totalFeasGovtLndar2!=null) {
				totalFeasGovtLndar = totalFeasGovtLndar
						+ Float.parseFloat(totalFeasGovtLndar2);
			}
			String totalGovtLandArea2 = studyAreaVillagesRepository.getTotalGovtLandArea(dist.get(i));
			if(totalGovtLandArea2!=null){
				totalGovtLandArea = totalGovtLandArea
						+ Integer.parseInt(totalGovtLandArea2);
			}
			String totalRegFarmArea2 = studyAreaVillagesRepository.getTotalRegFarmArea(dist.get(i));
			if(totalRegFarmArea2!=null) {
				totalRegFarmArea = totalRegFarmArea
						+ Float.parseFloat(totalRegFarmArea2);
			}
			String totalTotalAquapondArea2 = studyAreaVillagesRepository.getTotalTotalAquapondArea(dist.get(i));
			if(totalTotalAquapondArea2!=null) {
				totalTotalAquapondArea = totalTotalAquapondArea
						+ Float.parseFloat(totalTotalAquapondArea2);
			}
		}
		list.add(countByPort);
		list.add(countByFishingHarbour);
		list.add(countByFlc);
		list.add(countByJetties);
		list.add(countByLightHouse);
		list.add(count);
		list.add(countByTehsilName);
		list.add(countByVillageName);
		list.add(totalTotalAquapondArea);
		list.add(fnet_totaqupnd);
		list.add(totalGovtLandArea);
		list.add(totalRegFarmArea);			
		list.add(totalFeasGovtLndar);

		List<Object> aquaPondAreaList = new ArrayList<Object>();
		List<Object> govtLandInfoList = new ArrayList<Object>();
		List<Object> govtFeasLandInfoChartList = new ArrayList<Object>();
		List<Object> regdFarmList = new ArrayList<Object>();

		if (!dist.equals("all")) {
			List<Object> aquaPondAreaByDist = new ArrayList<Object>();
			List<Object> govtLandInfoByDist = new ArrayList<Object>();
			List<Object> govtFeasLandInfoChartByDist = new ArrayList<Object>();
			List<Object> regdFarm = new ArrayList<Object>();

			for (int i = 0; i < dist.size(); i++) {
				if(!dist.get(i).toString().equalsIgnoreCase("Cuttack")) {
				List<Object> aquaPondAreaByDist2 = baleswarLeasPlotsRepo.getAquaPondAreaByDist(dist.get(i));
				if(aquaPondAreaByDist2!=null) {
					aquaPondAreaByDist.addAll(aquaPondAreaByDist2);
				}
				}
				List<Object> govtLandInfoByDist2 = baleswarLeasPlotsRepo.getGovtLandInfoByDist(dist.get(i));
				if(govtLandInfoByDist2!=null) {
					govtLandInfoByDist.addAll(govtLandInfoByDist2);
				}
				List<Object> govtFeasLandInfoChartByDist2 = baleswarLeasPlotsRepo.getGovtFeasLandInfoChartByDist(dist.get(i));
				if(govtFeasLandInfoChartByDist2!=null) {
					govtFeasLandInfoChartByDist.addAll(govtFeasLandInfoChartByDist2);
				}

				List<Object> regdFarm2 = baleswarLeasPlotsRepo.getRegdFarm(dist.get(i));
				if(regdFarm2!=null) {
					regdFarm.addAll(regdFarm2);
				}
			}
			Iterator<Object> itr = aquaPondAreaByDist.iterator();
			while (itr.hasNext()) {
				Object[] obj = (Object[]) itr.next();
				aquaPondAreaList.add(String.valueOf(obj[0]));
				aquaPondAreaList.add(String.valueOf(obj[1]));
				aquaPondAreaList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				if (obj[3] != null)
					aquaPondAreaList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[3]))));
				else
					aquaPondAreaList.add("0");
			}

			Iterator<Object> iterator3 = govtLandInfoByDist.iterator();
			while (iterator3.hasNext()) {
				Object[] obj = (Object[]) iterator3.next();
				govtLandInfoList.add(String.valueOf(obj[0]));
				govtLandInfoList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtLandInfoList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				if (obj[3] != null)
					govtLandInfoList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[3]))));
				else
					govtLandInfoList.add("0");
			}

			Iterator<Object> iterator = govtFeasLandInfoChartByDist.iterator();
			while (iterator.hasNext()) {
				Object[] obj = (Object[]) iterator.next();
				govtFeasLandInfoChartList.add(String.valueOf(obj[0]));
				govtFeasLandInfoChartList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtFeasLandInfoChartList.add(String.valueOf(obj[2]));

			}

		} else {

			List<Object> aquaPondArea = new ArrayList<Object>();
			List<Object> govtLandInfo = new ArrayList<Object>();
			List<Object> regdFarm = new ArrayList<Object>();
			List<Object> govtFeasLandInfoChart = new ArrayList<Object>();

			for (int i = 0; i < dist.size(); i++) {
				if(dist.get(i)!="Cuttack") {
					List<Object> aquaPondArea2 = baleswarLeasPlotsRepo.getAquaPondArea(dist.get(i));
					if(aquaPondArea2!=null){
						aquaPondArea.add(aquaPondArea2);
					}
				}
				
				List<Object> govtLandInfo2 = baleswarLeasPlotsRepo.getGovtLandInfo(dist.get(i));
				if(govtLandInfo2!=null) {
					govtLandInfo.add(govtLandInfo2);
				}
				List<Object> regdFarm2 = baleswarLeasPlotsRepo.getRegdFarm(dist.get(i));
				if(regdFarm2!=null) {
					regdFarm.add(regdFarm2);
				}
				
				List<Object> govtFeasLandInfoChart2 = baleswarLeasPlotsRepo.getGovtFeasLandInfoChart(dist.get(i));
				if(govtFeasLandInfoChart2!=null)
				{
					govtFeasLandInfoChart.add(govtFeasLandInfoChart2);
				}				
			}

			Iterator<Object> iterator2 = aquaPondArea.iterator();
			while (iterator2.hasNext()) {
				Object[] obj = (Object[]) iterator2.next();
				aquaPondAreaList.add(String.valueOf(obj[0]));
				aquaPondAreaList.add(String.valueOf(obj[1]));
				aquaPondAreaList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				if (obj[3] != null)
					aquaPondAreaList.add(String.valueOf(obj[3]));
				else
					aquaPondAreaList.add("0");
			}

			Iterator<Object> iterator3 = govtFeasLandInfoChart.iterator();
			while (iterator3.hasNext()) {
				Object[] obj = (Object[]) iterator3.next();
				govtFeasLandInfoChartList.add(String.valueOf(obj[0]));
				govtFeasLandInfoChartList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtFeasLandInfoChartList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				govtFeasLandInfoChartList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[3]))));
			}

			Iterator<Object> iterator = govtLandInfo.iterator();
			while (iterator.hasNext()) {
				Object[] obj = (Object[]) iterator.next();
				govtLandInfoList.add(String.valueOf(obj[0]));
				govtLandInfoList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtLandInfoList.add(String.valueOf(obj[2]));
			}

			Iterator<Object> iterator4 = regdFarm.iterator();
			while (iterator4.hasNext()) {
				Object[] obj = (Object[]) iterator4.next();
				regdFarmList.add(String.valueOf(obj[0]));
				regdFarmList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				regdFarmList.add(String.valueOf(obj[3]));
			}

		}

		List<Object> distListFinal = new ArrayList<Object>();
		for (int i = 0; i < aquaPondAreaList.size(); i++) {
			String s = (String) aquaPondAreaList.get(i);
			distListFinal.add(s);
			i = i + 3;
		}

		List<Object> value1 = new ArrayList<Object>();
		for (int i = 1; i < aquaPondAreaList.size(); i++) {
			String s = (String) aquaPondAreaList.get(i);
			value1.add(s);
			i = i + 3;
		}
		List<Object> value2 = new ArrayList<Object>();
		for (int i = 2; i < aquaPondAreaList.size(); i++) {
			String s = (String) aquaPondAreaList.get(i);
			value2.add(s);
			i = i + 3;
		}
		List<Object> value3 = new ArrayList<Object>();
		for (int i = 3; i < aquaPondAreaList.size(); i++) {
			String s = (String) aquaPondAreaList.get(i);
			value3.add(s);
			i = i + 3;
		}

		List<Object> tehsilListFinal = new ArrayList<Object>();
		for (int i = 0; i < govtLandInfoList.size(); i++) {
			String s = (String) govtLandInfoList.get(i);
			tehsilListFinal.add(s);
			i = i + 3;
		}

		List<Object> value11 = new ArrayList<Object>();
		for (int i = 1; i < govtLandInfoList.size(); i++) {
			String s = (String) govtLandInfoList.get(i);
			value11.add(s);
			i = i + 3;
		}
		List<Object> value22 = new ArrayList<Object>();
		for (int i = 2; i < govtLandInfoList.size(); i++) {
			String s = (String) govtLandInfoList.get(i);
			value22.add(s);
			i = i + 3;
		}
		List<Object> value33 = new ArrayList<Object>();
		for (int i = 3; i < govtLandInfoList.size(); i++) {
			String s = (String) govtLandInfoList.get(i);
			value33.add(s);
			i = i + 3;
		}

		List<Object> value111 = new ArrayList<Object>();
		for (int i = 0; i < govtFeasLandInfoChartList.size(); i++) {
			String s = (String) govtFeasLandInfoChartList.get(i);
			value111.add(s);
			i = i + 2;
		}
		List<Object> value222 = new ArrayList<Object>();
		for (int i = 1; i < govtFeasLandInfoChartList.size(); i++) {
			String s = (String) govtFeasLandInfoChartList.get(i);
			value222.add(s);
			i = i + 2;
		}

		List<Object> value333 = new ArrayList<Object>();
		for (int i = 2; i < govtFeasLandInfoChartList.size(); i++) {
			String s = (String) govtFeasLandInfoChartList.get(i);
			value333.add(s);
			i = i + 2;
		}
		List<Object> value777 = new ArrayList<Object>();
		for (int i = 3; i < govtFeasLandInfoChartList.size(); i++) {
			String s = (String) govtFeasLandInfoChartList.get(i);
			value777.add(s);
			i = i + 3;
		}

		List<Object> value444 = new ArrayList<Object>();
		for (int i = 0; i < regdFarmList.size(); i++) {
			String s = (String) regdFarmList.get(i);
			value444.add(s);
			i = i + 2;
		}

		List<Object> value555 = new ArrayList<Object>();
		for (int i = 1; i < regdFarmList.size(); i++) {
			String s = (String) regdFarmList.get(i);
			value555.add(s);
			i = i + 2;
		}

		List<Object> value666 = new ArrayList<Object>();
		for (int i = 2; i < regdFarmList.size(); i++) {
			String s = (String) regdFarmList.get(i);
			value666.add(s);
			i = i + 2;
		}

		map.put("list", list);
		map.put("distListFinal", distListFinal);
		map.put("value1", value1);
		map.put("value2", value2);
		map.put("value3", value3);
		map.put("tehsilListFinal", tehsilListFinal);
		map.put("value11", value11);
		map.put("value22", value22);
		map.put("value33", value33);
		map.put("value111", value111);
		map.put("value222", value222);
		map.put("value333", value333);
		map.put("value777", value777);
		map.put("value444", value444);
		map.put("value555", value555);
		map.put("value666", value666);
		return map;
	}

}