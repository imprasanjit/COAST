package com.coast.app.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.coast.app.dto.CadastralSearchPlot_DTO;
import com.coast.app.service.CadastralSearchService;
import com.coast.app.service.FlcFishharbourJettiesPortService;
import com.coast.app.service.TehsilService;
import com.google.gson.Gson;

/**
 * @author Prasanjit
 *
 */
@Controller
//@RequestMapping("/coast")
@Scope("session") 
public class HomeController {
	@Autowired
	private FlcFishharbourJettiesPortService flcFishharbourJettiesPortRepoService;
	/*
	 * @Autowired private UserService userservice;
	 */
	@Autowired
	private CadastralSearchService cadastralSearchService;
	@Autowired
	private TehsilService tehsilService;

	@RequestMapping("/")
	public ModelAndView home(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home");
		return modelAndView;
	}

	@RequestMapping(value = "/Frequently_Asked_Question")
	public ModelAndView FrequentlyAskedQuestion(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("Frequently_Asked_Question");
		return modelAndView;
	}
	
	@RequestMapping(value = "/index")
	public ModelAndView index(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/czmpmap")
	public ModelAndView czmpmap(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("czmpmap");
		return modelAndView;
	}

	@RequestMapping(value = "/dashboard1")
	public ModelAndView dashBoard1() {
		ModelAndView mav = new ModelAndView("dashboard");		
		return mav;
	}
	@ResponseBody
	@RequestMapping(value = "/dashboard2/{dist}",method = RequestMethod.POST)
	public String dashBoard2(@PathVariable String dist,HttpSession session) {
		//ModelAndView mav = new ModelAndView("dashboard");		
		/*var district="all"; Map<String, List<Object>> countAll = flcFishharbourJettiesPortRepoService.getCountAll(district); var
		muldist="Nodata"; session.setAttribute("muldist", muldist);
		session.setAttribute("dist", district); mav.addObject("countAll", countAll);	*/		
		Gson gson = new Gson();
		//var district="all";		
		var muldist="Nodata"; 
		session.setAttribute("muldist", muldist);
		session.setAttribute("dist", dist); 
		//mav.addObject("countAll", countAll);
		Map<String, List<Object>> countAll = flcFishharbourJettiesPortRepoService.getCountAll(dist);
		String jsongp = gson.toJson(countAll);
		return jsongp;
		//return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/dashboard", method = RequestMethod.POST)
	public String dashBoards(@RequestBody List<String> dist, HttpSession session, ModelMap model) 
	{	
		Gson gson = new Gson();
		Map<String, List<Object>> countAll = flcFishharbourJettiesPortRepoService.getCountAlldist(dist);
		String muldist="";
		String district="";
		  for(int i=0;i<dist.size();i++) { 
			  district=district+","+dist.get(i);
			  muldist=district;			  
			  }			
		session.setAttribute("dist", district);
		session.setAttribute("muldist", muldist);	
		String jsontehsil = gson.toJson(countAll);
		return jsontehsil;
	}

	@RequestMapping(value = "/clickViewDetails", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView clickViewDetails(@RequestParam("name") String name,HttpSession session, HttpServletRequest request)
	{
		
		ModelAndView mav = new ModelAndView();
		session.setAttribute("clkname", name);
		mav.setViewName("/clickview_details");
		return mav;		
	}
	
	@ResponseBody
	@RequestMapping(value = "/interactive", method = RequestMethod.POST)
	public String interactive(@RequestBody List<String> dist) 
	{
		Gson gson = new Gson();
		Map<String, List<Object>> countAll = flcFishharbourJettiesPortRepoService.getCountAlldist(dist);
		String jsontehsil = gson.toJson(countAll);
		return jsontehsil;
	}
	
	@RequestMapping(value = "/interactive/{dist}")
	public ModelAndView interactive(@PathVariable String dist,HttpSession session) {
		ModelAndView mav = new ModelAndView("interactive");
		Map<String, List<Object>> countAll = flcFishharbourJettiesPortRepoService.getCountAll(dist);
		mav.addObject("countAll", countAll);
		return mav;
	}

	@RequestMapping(value = "/mapview")
	public ModelAndView mapview(HttpSession session) {
		ModelAndView mav = new ModelAndView("mapview");
		return mav;
	}

	@RequestMapping(value = "/QuerybuilderFeaslnd")
	public ModelAndView QuerybuilderFeaslnd(HttpSession session) {
		ModelAndView mav = new ModelAndView("QuerybuilderFeaslnd");
		return mav;

	}

	@RequestMapping(value = "/QuerybuilderAquapond")
	public ModelAndView QuerybuilderAquapond(HttpSession session) {
		ModelAndView mav = new ModelAndView("QuerybuilderAquapond");
		return mav;

	}

	@RequestMapping(value = "/QuerybuilderRegfarm")
	public ModelAndView QuerybuilderRegfarm(HttpSession session) {
		ModelAndView mav = new ModelAndView("QuerybuilderRegfarm");
		return mav;

	}

	@RequestMapping(value = "/CadastralSearch")
	public ModelAndView CadastralSearch(HttpSession session) {
		ModelAndView mav = new ModelAndView("CadastralSearch");
		return mav;

	}

	@RequestMapping(value = "/LandReport")
	public ModelAndView LandReport() {
		ModelAndView mav = new ModelAndView("LandReport");
		return mav;

	}

	@ResponseBody
	@RequestMapping(value = "/getTehsil/{dist}", method = RequestMethod.GET)
	public String getTehsil(@PathVariable String dist,HttpSession session) {
		Gson gson = new Gson();
		if (dist.equalsIgnoreCase("Khurdha")) {
			dist="Khurda";
		}		
		List<String> findbydist = tehsilService.findbydist(dist);
		String jsontehsil = gson.toJson(findbydist);
		return jsontehsil;

	}

	@ResponseBody
	@RequestMapping(value = "/getGp", method = RequestMethod.GET)
	public String getGp(@RequestParam("dist") String dist, @RequestParam("tehsil") String tehsil,HttpSession session) {
		Gson gson = new Gson();
		if (dist.equalsIgnoreCase("Khurdha")) {
			dist="Khurda";
			List<String> findbydisttehsil = tehsilService.findbydisttehsil(dist, tehsil);
			String jsongp = gson.toJson(findbydisttehsil);
			return jsongp;
		}
		
		else {
			List<String> findbydisttehsil = tehsilService.findbydisttehsil(dist, tehsil);
			String jsongp = gson.toJson(findbydisttehsil);
			return jsongp;			
		}		
	}

	@ResponseBody
	@RequestMapping(value = "/getVillage", method = RequestMethod.GET)
	public String getVillage(@RequestParam("dist") String dist, @RequestParam("tehsil") String tehsil,
			@RequestParam("gp") String gp, HttpSession session) {
		Gson gson = new Gson();
		if (dist.equalsIgnoreCase("Khurdha")) {
			dist="Khurda";
		}		
		List<String> findbydisttehsilgp = tehsilService.findbydisttehsilgp(dist, tehsil, gp);
		String jsonvillage = gson.toJson(findbydisttehsilgp);
		return jsonvillage;

	}
	@ResponseBody
	@RequestMapping(value = "/getVillagebyDistTehsil", method = RequestMethod.GET)
	public String getVillage(@RequestParam("dist") String dist, @RequestParam("tehsil") String tehsil, HttpSession session) {
		Gson gson = new Gson();
		if (dist.equalsIgnoreCase("Khurdha")) {
			dist="Khurda";
		}
		List<String> findbydisttehsilgp = tehsilService.findbydistAndtehsil(dist, tehsil);
		String jsonvillage = gson.toJson(findbydisttehsilgp);
		return jsonvillage;

	}

	@ResponseBody
	@RequestMapping(value = "/getPlotno", method = RequestMethod.GET)
	public String getPlotno(@RequestParam("dist") String dist, @RequestParam("tehsil") String tehsil,
			@RequestParam("gp") String gp, @RequestParam("village") String village, HttpSession session) {
		/*
		 * Gson gson = new Gson(); List<String> findbydisttehsilgpvillage =
		 * tehsilService.findbydisttehsilgpvillage(dist, tehsil, gp, village); String
		 * jsonvillage = gson.toJson(findbydisttehsilgpvillage); return jsonvillage;
		 */
		if (dist.equalsIgnoreCase("Khurdha")) {
			dist="Khurda";
		}
		if (dist.equalsIgnoreCase("jajapur")) {
			dist="jajpur";
		}
		List<CadastralSearchPlot_DTO> details = cadastralSearchService.getCadastralPlot(dist, tehsil, gp, village);
		Gson gson = new Gson();
		String jsonvillage = gson.toJson(details);
		return jsonvillage;

	}
}
