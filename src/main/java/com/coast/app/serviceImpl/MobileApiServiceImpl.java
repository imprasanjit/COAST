package com.coast.app.serviceImpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.coast.app.customRepository.CadastralSearchRepoCustom;
import com.coast.app.customRepository.MobilefeasibleLandCustomRepo;
import com.coast.app.dto.Aquapond_regfarm_info;
import com.coast.app.dto.Aquapondinfo_chart;
import com.coast.app.dto.CadastralSearchPlot_DTO;
import com.coast.app.dto.DashboardDto;
import com.coast.app.dto.DashboardFilterDto;
import com.coast.app.dto.DistrictDTO;
import com.coast.app.dto.FeasibleLandResponse;
import com.coast.app.dto.Feasible_Land_DTO;
import com.coast.app.dto.Govtfeaslandinfo_chart;
import com.coast.app.dto.Govtlandinfo_chart;
import com.coast.app.dto.LoginResponse;
import com.coast.app.dto.MessageResponse;
import com.coast.app.dto.PlotDto;
import com.coast.app.dto.StudyAreaVillagesDto;
import com.coast.app.dto.fieldReportingDto;
import com.coast.app.entity.District_Boundary;
import com.coast.app.entity.Tbl_field_Reporting;
import com.coast.app.entity.User_Details;
import com.coast.app.repository.ApiStudyAreaVillagesRepository;
import com.coast.app.repository.BaleswarLeasPlotsRepo;
import com.coast.app.repository.DistrictRepository;
import com.coast.app.repository.FieldReportRepository;
import com.coast.app.repository.FlcFishharbourJettiesPortRepo;
import com.coast.app.repository.McsOsdmaRepository;
import com.coast.app.repository.StudyAreaVillagesRepository;
import com.coast.app.repository.UserRepository;
import com.coast.app.security.JavaSecurity;
import com.coast.app.service.MobileApiService;
import com.google.gson.JsonObject;

@Service
public class MobileApiServiceImpl implements MobileApiService {
	@Autowired
	private ApiStudyAreaVillagesRepository apistudyAreaVillagesRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private MobilefeasibleLandCustomRepo mobilefeasibleLandRepo;

	@Autowired
	private FieldReportRepository FieldReportRepo;

	@Autowired
	private BaleswarLeasPlotsRepo baleswarLeasPlotsRepo;

	@Autowired
	private StudyAreaVillagesRepository studyAreaVillagesRepository;

	@Autowired
	private FlcFishharbourJettiesPortRepo flcFishharbourJettiesPortRepo;

	@Autowired
	private McsOsdmaRepository mcsRepo;
	
	@Autowired
	private DistrictRepository distrepo;
	@Autowired
	private CadastralSearchRepoCustom cadastralSearchRepoCustom;

	@Value("${file.upload.projectdirectory}")
	private String fileUploadProjectDirectory;

	@Override
	public ResponseEntity<?> aunthetictaeUser(String email, String password) {
		String status = "";
		User_Details findByEmailId = userRepository.findByEmailId(email);

		if ((email != "") && (findByEmailId != null)) {
			String password2 = findByEmailId.getPassword();
			JavaSecurity secure = new JavaSecurity();
			String decrypt = secure.decrypt(password2);

			if (password.equals(decrypt)) {
				status = "Logged In successfully !";
				LoginResponse loginResponse = new LoginResponse();
				loginResponse.setDept_id(findByEmailId.getDeptId());
				loginResponse.setDesignation(findByEmailId.getDesignation());
				loginResponse.setMobile_no(findByEmailId.getMobileNo());
				loginResponse.setStatus(findByEmailId.getStatus());
				loginResponse.setUser_name(findByEmailId.getUserName());
				loginResponse.setUser_type_id(findByEmailId.getUserTypeId());
				loginResponse.setPassword(findByEmailId.getPassword());
				loginResponse.setEmail_id(findByEmailId.getEmailId());
				loginResponse.setUser_id(findByEmailId.getUserId());
				loginResponse.setUser_status(findByEmailId.getUserStatus());
				loginResponse.setLogin_type(findByEmailId.getLogintype());
				return ResponseEntity.ok(loginResponse);
			} else {
				return ResponseEntity.badRequest().body(new MessageResponse("Password is incorrect !"));
			}
		} else {
			return ResponseEntity.badRequest().body(new MessageResponse("Please enter valid  UserId or Password!"));
		}
	}

	@Override
	public List<StudyAreaVillagesDto> findbydist(String dist) {
		List<String> allTehsil = apistudyAreaVillagesRepository.getAllTehsil(dist);
		List<StudyAreaVillagesDto> list = new ArrayList<StudyAreaVillagesDto>();
		Iterator<String> iterator = allTehsil.iterator();
		while (iterator.hasNext()) {
			String string = (String) iterator.next();
			StudyAreaVillagesDto studyAreaVillagesDto = new StudyAreaVillagesDto();
			studyAreaVillagesDto.setTehName(String.valueOf(string));
			list.add(studyAreaVillagesDto);
		}
		return list;
	}

	public List<GpDto> findbydisttehsil(String dist, String tehsil) {
		List<String> allGp = apistudyAreaVillagesRepository.getAllGp(dist, tehsil);
		List<GpDto> list = new ArrayList<GpDto>();
		Iterator<String> iterator = allGp.iterator();
		while (iterator.hasNext()) {
			String string = (String) iterator.next();
			GpDto gp = new GpDto();
			gp.setGpName(String.valueOf(string));
			list.add(gp);
		}
		return list;
	}


	@Override
	public List<StudyAreaVillagesDto> findbydistAndtehsil(String dist, String tehsil) {
		// apistudyAreaVillagesRepository.getVillage(dist, tehsil);
		return null;
	}

	@Override
	public List<FeasibleLandResponse> getAllFesLanddetails(String dist, String tehsil, String gp, String village) {
		List<Feasible_Land_DTO> allFesLanddetails = null;
		List<FeasibleLandResponse> list = new ArrayList<FeasibleLandResponse>();
		if (!dist.equalsIgnoreCase("all")) {
			if (!tehsil.equalsIgnoreCase("all")) {
				if (!gp.equalsIgnoreCase("all")) {
					if (!village.equalsIgnoreCase("all")) {
						allFesLanddetails = mobilefeasibleLandRepo.getAllFesLanddetailsAll_vill(dist, tehsil, gp,village);
					} else {
						allFesLanddetails = mobilefeasibleLandRepo.getAllFesLanddetails_gp(dist, tehsil, gp);
					}
				}
				else {
					allFesLanddetails = mobilefeasibleLandRepo.getAllFesLanddetails_teh(dist, tehsil);
				}
			} else {
				allFesLanddetails = mobilefeasibleLandRepo.getAllFesLanddetails_dist(dist);
			}
			Iterator itr = allFesLanddetails.iterator();
			while (itr.hasNext()) {
				Object[] obj = (Object[]) itr.next();
				FeasibleLandResponse feaslandResp = new FeasibleLandResponse();
				
//				feaslandResp.setDistname(String.valueOf(obj[0]));
//				feaslandResp.setTehname(String.valueOf(obj[1]));
//				feaslandResp.setGpname(String.valueOf(obj[2]));
//				feaslandResp.setVillname(String.valueOf(obj[3]));
//				feaslandResp.setKhatano(String.valueOf(obj[4]));
//				feaslandResp.setPlotno(String.valueOf(obj[5]));
//				feaslandResp.setKisameng(String.valueOf(obj[6]));
//				feaslandResp.setAreaac(Double.parseDouble(String.valueOf(obj[7])));
//				feaslandResp.setLeasac(Double.parseDouble(String.valueOf(obj[8])));
//				feaslandResp.setApaac(Double.parseDouble(String.valueOf(obj[9])));
//				feaslandResp.setLat(Double.parseDouble(String.valueOf(obj[10])));
//				feaslandResp.setLon(Double.parseDouble(String.valueOf(obj[11])));
//				list.add(feaslandResp);
				
				feaslandResp.setR_slno(Integer.parseInt( String.valueOf(obj[0])));
				feaslandResp.setR_dist(String.valueOf(obj[1]));
				feaslandResp.setR_tehsil(String.valueOf(obj[2]));
				feaslandResp.setR_gp(String.valueOf(obj[3]));
				feaslandResp.setR_village(String.valueOf(obj[4]));
				feaslandResp.setR_plotno(String.valueOf(obj[5]));
				feaslandResp.setR_kisama(String.valueOf(obj[6]));
				feaslandResp.setR_area(Double.parseDouble(String.valueOf(obj[7])));
				feaslandResp.setLat(Double.parseDouble(String.valueOf(obj[8])));
				feaslandResp.setLon(Double.parseDouble(String.valueOf(obj[9])));
				list.add(feaslandResp);
			}

		}
		return list;
	}

	@Override
	public ResponseEntity<?> insertFieldReporting(fieldReportingDto fieldReporting) {
		Tbl_field_Reporting fieldReport = new Tbl_field_Reporting();
		MultipartFile imgFile = fieldReporting.getImg();
		String ImgfileName = imgFile.getOriginalFilename();
		if (imgFile != null) {
			try {
				File newDirectory = new File(fileUploadProjectDirectory);
				boolean mkdirs = newDirectory.mkdirs();
					File uploadedFile = new File(newDirectory, ImgfileName);
					uploadedFile.createNewFile();
					uploadedFile.setReadable(true);
					FileOutputStream fileOutputStream = new FileOutputStream(uploadedFile);
					fileOutputStream.write((imgFile.getBytes()));
					fileOutputStream.close();				
				fieldReport.setImg(ImgfileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (fieldReport != null) 
		{
			fieldReport.setDistname(fieldReporting.getDistname());
			fieldReport.setGpname(fieldReporting.getGpname());
			fieldReport.setLat(fieldReporting.getLat());
			fieldReport.setLon(fieldReporting.getLon());
			fieldReport.setPlotno(fieldReporting.getPlotno());
			fieldReport.setRemark(fieldReporting.getRemark());
			fieldReport.setTehname(fieldReporting.getTehname());
			fieldReport.setVillname(fieldReporting.getVillname());
			Tbl_field_Reporting save = FieldReportRepo.save(fieldReport);
			if (save != null) 
			{
				return ResponseEntity.ok().body(new MessageResponse("Data submitted Successfully"));
			}
		}
		return ResponseEntity.ok().body(new MessageResponse("Data not available"));
	}

	@Override
	public DashboardFilterDto getDashboardCountAll(String dist) {
		Map<String, List<DashboardDto>> map = new HashMap<String, List<DashboardDto>>();
		List<DashboardDto> list = new ArrayList<DashboardDto>();
		DashboardFilterDto dashboardFilter = new DashboardFilterDto();
		Double fnet_totaqupnd = 0.0;
		Double totalFeasGovtLndar = 0.0;
		Double totalGovtLandArea = 0.0;
		Double totalRegFarmArea = 0.0;
		Double totalTotalAquapondArea = 0.0;

		int countByVillageName = studyAreaVillagesRepository.getCountByVillageName();
		int countByTehsilName = studyAreaVillagesRepository.getCountByTehsilName();

		fnet_totaqupnd = fnet_totaqupnd + Double.parseDouble(studyAreaVillagesRepository.getTotalAquapond(dist));
		totalFeasGovtLndar = totalFeasGovtLndar
				+ Double.parseDouble(studyAreaVillagesRepository.getTotalFeasGovtLndar(dist));// feasible govt land area
		totalGovtLandArea = totalGovtLandArea
				+ Double.parseDouble(studyAreaVillagesRepository.getTotalGovtLandArea(dist));// no. of registered farm.
		totalRegFarmArea = totalRegFarmArea + Double.parseDouble(studyAreaVillagesRepository.getTotalRegFarmArea(dist));// registered
																														// farm
																														// area
		totalTotalAquapondArea = totalTotalAquapondArea + Double.parseDouble(studyAreaVillagesRepository.getTotalTotalAquapondArea(dist));

		List<Aquapondinfo_chart> aquaPondAreaList = new ArrayList<Aquapondinfo_chart>();
		List<Govtlandinfo_chart> govtLandInfoLists = new ArrayList<Govtlandinfo_chart>();
		List<Govtfeaslandinfo_chart> govtlandinfoChart = new ArrayList<Govtfeaslandinfo_chart>();
		List<Aquapond_regfarm_info> aquapondRegfarmInfo = new ArrayList<Aquapond_regfarm_info>();

		//List<Object> govtLandInfoList = new ArrayList<Object>();
		//List<Object> govtFeasLandInfoChartList = new ArrayList<Object>();
		//List<Object> regdFarmList = new ArrayList<Object>();

		if (!dist.equals("all")) {
			List<Object> aquaPondAreaByDist = baleswarLeasPlotsRepo.getAquaPondAreaByDist(dist);
			List<Object> govtLandInfoByDist = baleswarLeasPlotsRepo.getGovtLandInfoByDist(dist);
			List<Object> govtFeasLandInfoChartByDist = baleswarLeasPlotsRepo.getGovtFeasLandInfoChartByDist(dist);
			List<Object> regdFarm = baleswarLeasPlotsRepo.getRegdFarm(dist);

			Iterator<Object> itr = aquaPondAreaByDist.iterator();
			while (itr.hasNext()) {
				Object[] obj = (Object[]) itr.next();
				Aquapondinfo_chart aquapondinfo_chart = new Aquapondinfo_chart();
				aquapondinfo_chart.setR_distnm_aqp(String.valueOf(obj[0]));
				aquapondinfo_chart.setR_sum_regfarm(String.valueOf(obj[1]));
				aquapondinfo_chart.setR_sumarea_aqp(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				if (obj[3] != null) {
					aquapondinfo_chart.setR_tot_pond(String.format("%.2f", Float.parseFloat(String.valueOf(obj[3]))));
				} else {
					aquapondinfo_chart.setR_tot_pond("0");
				}
				aquaPondAreaList.add(aquapondinfo_chart);
			}

			Iterator<Object> iterator = govtLandInfoByDist.iterator();
			while (iterator.hasNext()) {
				Object[] obj = (Object[]) iterator.next();
				Govtfeaslandinfo_chart govtfeaslandinfoChart = new Govtfeaslandinfo_chart();
				govtfeaslandinfoChart.setR_distnm(String.valueOf(obj[0]));
				govtfeaslandinfoChart.setR_sumarea(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtfeaslandinfoChart.setTotcount(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				govtlandinfoChart.add(govtfeaslandinfoChart);
			}

			Iterator<Object> iterators = govtLandInfoByDist.iterator();
			while (iterator.hasNext()) {
				Object[] obj = (Object[]) iterator.next();
				Govtfeaslandinfo_chart govtfeaslandinfoChart = new Govtfeaslandinfo_chart();
				govtfeaslandinfoChart.setR_distnm(String.valueOf(obj[0]));
				govtfeaslandinfoChart.setR_sumarea(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtfeaslandinfoChart.setTotcount(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				govtlandinfoChart.add(govtfeaslandinfoChart);
			}
			dashboardFilter.setTehsil(countByTehsilName);
			dashboardFilter.setVill(countByVillageName);
			dashboardFilter.setAqpndcount("" + totalTotalAquapondArea);
			dashboardFilter.setFeslndcount("" + totalFeasGovtLndar);
			dashboardFilter.setGovtlndcount("" + totalGovtLandArea);
			dashboardFilter.setReglandcount("" + totalRegFarmArea);
			dashboardFilter.setDistrict_name(dist);
			dashboardFilter.setAquapondinfo_chart(aquaPondAreaList);
			dashboardFilter.setGovtfeaslandinfo_chart(govtlandinfoChart);
			dashboardFilter.setGovtlandinfo_chart(govtLandInfoLists);
			dashboardFilter.setAquapond_regfarm_info(aquapondRegfarmInfo);

		} 
		else {
			List<Object> aquaPondArea = baleswarLeasPlotsRepo.getAquaPondArea(dist);
			List<Object> govtFeasLandInfoChart = baleswarLeasPlotsRepo.getGovtFeasLandInfoChart(dist);
			List<Object> govtLandInfo = baleswarLeasPlotsRepo.getGovtLandInfo(dist);
			List<Object> regdFarm = baleswarLeasPlotsRepo.getRegdFarm(dist);

			Iterator<Object> itr = aquaPondArea.iterator();
			while (itr.hasNext()) {
				Object[] obj = (Object[]) itr.next();
				Aquapondinfo_chart aquapondinfo_chart = new Aquapondinfo_chart();
				aquapondinfo_chart.setR_distnm_aqp(String.valueOf(obj[0]));
				aquapondinfo_chart.setR_sum_regfarm(String.valueOf(obj[1]));
				aquapondinfo_chart.setR_sumarea_aqp(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				if (obj[3] != null) {
					aquapondinfo_chart.setR_tot_pond(String.format("%.2f", Float.parseFloat(String.valueOf(obj[3]))));
				} else {
					aquapondinfo_chart.setR_tot_pond("0");
				}
				aquaPondAreaList.add(aquapondinfo_chart);
			}

			Iterator<Object> iterator3 = govtFeasLandInfoChart.iterator();
			while (iterator3.hasNext()) {
				Object[] obj = (Object[]) iterator3.next();
				Govtlandinfo_chart govtlandinfo_chart = new Govtlandinfo_chart();
				govtlandinfo_chart.setR_distnm(String.valueOf(obj[0]));
				govtlandinfo_chart.setR_subfesland(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtlandinfo_chart.setR_sumarea(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
				govtlandinfo_chart.setR_tot_fealnd_count(
						String.valueOf(String.format("%.2f", Float.parseFloat(String.valueOf(obj[3])))));

//				govtFeasLandInfoChartList.add(String.valueOf(obj[0]));
//				govtFeasLandInfoChartList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
//				govtFeasLandInfoChartList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));
//				govtFeasLandInfoChartList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[3]))));
				govtLandInfoLists.add(govtlandinfo_chart);
			}

			Iterator<Object> iterator = govtLandInfo.iterator();
			while (iterator.hasNext()) {
				Object[] obj = (Object[]) iterator.next();
				Govtfeaslandinfo_chart govtfeaslandinfoChart = new Govtfeaslandinfo_chart();
				govtfeaslandinfoChart.setR_distnm(String.valueOf(obj[0]));
				govtfeaslandinfoChart.setR_sumarea(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				govtfeaslandinfoChart.setTotcount(String.format("%.2f", Float.parseFloat(String.valueOf(obj[2]))));

//				govtLandInfoList.add(String.valueOf(obj[0]));
//				govtLandInfoList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
//				govtLandInfoList.add(String.valueOf(obj[2]));
				govtlandinfoChart.add(govtfeaslandinfoChart);
			}

			Iterator<Object> iterator4 = regdFarm.iterator();
			while (iterator4.hasNext()) {
				Object[] obj = (Object[]) iterator4.next();
				Aquapond_regfarm_info aquapond_regfarm_info = new Aquapond_regfarm_info();
				aquapond_regfarm_info.setR_distnm(String.valueOf(obj[0]));
				aquapond_regfarm_info.setR_sumareaaqua(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
				aquapond_regfarm_info.setR_sumarearegfarm(String.valueOf(obj[3]));

//				regdFarmList.add(String.valueOf(obj[0]));
//				regdFarmList.add(String.format("%.2f", Float.parseFloat(String.valueOf(obj[1]))));
//				regdFarmList.add(String.valueOf(obj[3]));
				aquapondRegfarmInfo.add(aquapond_regfarm_info);
			}
			dashboardFilter.setTehsil(countByTehsilName);
			dashboardFilter.setVill(countByVillageName);
			dashboardFilter.setAqpndcount("" + totalTotalAquapondArea);
			dashboardFilter.setFeslndcount("" + totalFeasGovtLndar);
			dashboardFilter.setGovtlndcount("" + totalGovtLandArea);
			dashboardFilter.setReglandcount("" + totalRegFarmArea);
			dashboardFilter.setDistrict_name(dist);
			dashboardFilter.setAquapondinfo_chart(aquaPondAreaList);
			dashboardFilter.setGovtfeaslandinfo_chart(govtlandinfoChart);
			dashboardFilter.setGovtlandinfo_chart(govtLandInfoLists);
			dashboardFilter.setAquapond_regfarm_info(aquapondRegfarmInfo);
			
		}
		return dashboardFilter;
	}

	@Override
	public List<VillageDto> findbydisttehsilgp(String dist, String tehsil, String gp) 
	{
		List<String> allVillage = apistudyAreaVillagesRepository.getAllVillage(dist, tehsil,gp);
		List<VillageDto> list = new ArrayList<VillageDto>();
		Iterator<String> iterator = allVillage.iterator();
		while (iterator.hasNext()) {
			String string = (String) iterator.next();
			VillageDto vill = new VillageDto();
			vill.setVillageName(String.valueOf(string));
			list.add(vill);
		}
		return list;
	}

	@Override
	public List<DistrictDTO> getAllDistrict() {
		List<District_Boundary> findAll = distrepo.findAllByCoastDist("Yes");
		List<DistrictDTO> list=new ArrayList<DistrictDTO>();
		for (District_Boundary district : findAll) {
			DistrictDTO dist=new DistrictDTO();
			dist.setDist_code(district.getDistCode());
			dist.setDist_name(district.getDistName());
			list.add(dist);
		}
		return list;
	}

	@Override
	public List<PlotDto> findplotbydisttehsilgp(String dist, String tehsil, String gp, String village) {
		List<CadastralSearchPlot_DTO> allPlot=cadastralSearchRepoCustom.getPlot(dist, tehsil, gp, village);
		List<PlotDto> retrunlist=new ArrayList<PlotDto>();
		List<Integer> list=new ArrayList<Integer>();
		for (int i = 0; i < allPlot.size(); i++) {
             int parseInt = Integer.parseInt(String.valueOf(allPlot.get(i)));
		     list.add(parseInt);
        }
		Collections.sort(list);
		 for (Integer i : list) { 
			 PlotDto plot=new PlotDto();
			 plot.setPlotNo(i);
			 retrunlist.add(plot);
		   }
		return retrunlist;
	}

}
