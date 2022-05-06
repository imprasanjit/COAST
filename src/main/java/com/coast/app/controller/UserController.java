package com.coast.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.sql.init.dependency.DependsOnDatabaseInitialization;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.coast.app.customRepository.UserTypeRepository;
import com.coast.app.dto.DepartmentDto;
import com.coast.app.dto.UserRequestDto;
import com.coast.app.dto.UserTypeDto;
import com.coast.app.entity.Department;
import com.coast.app.entity.UserType;
import com.coast.app.entity.User_Details;
import com.coast.app.repository.DepartmentRepository;
import com.coast.app.repository.UserRepository;
import com.coast.app.service.UserService;

/**
 * @author Prasanjit
 *
 */
@Controller
@Scope("session") 
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private DepartmentRepository deptRepo;

	// @Autowired
	// private UserTypeRepository userTypeRepo;

	@Autowired
	private UserTypeRepository usertyperepo;

	@Autowired
	private UserRepository userRepository;
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam("txtEmailId") String email, @RequestParam("txtPassword") String password , HttpServletRequest request) {
		String aunthetictaeUser = userService.aunthetictaeUser(email, password);
		
		User_Details user=userRepository.findByEmailId(email);
		HttpSession session = request.getSession();	
		if (aunthetictaeUser=="Logged In successfully !") {
			String usertype=user.getUserTypeId().toString();
			Integer userid=user.getUserId();
			String uname=user.getUserName();			
			session.setAttribute("userType", usertype);
			session.setAttribute("uname", uname);			
			session.setAttribute("emailId",email);
			session.setAttribute("userID",userid);
		}		

		return aunthetictaeUser;
	}
	@RequestMapping(value = "/emailValidate")
	@ResponseBody
	public String emailValidate(@RequestParam("email") String email, HttpSession session) {
		 String status="";
		 Boolean user = userRepository.existsByEmailId(email);
		if(user.equals(true)) 
		{
			status="email already exist";
		}
		return status;		
	}
	@RequestMapping(value = "/deptValidate",method = RequestMethod.POST)
	@ResponseBody
	public String deptValidate(@RequestParam("dept") String deptname, HttpSession session) 
	{
		String deptValidate = userService.deptValidate(deptname);		
		return deptValidate;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;		
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	@ResponseBody
	public String changePassword(@RequestParam String oldPassword, @RequestParam String newPassword,@RequestParam Integer userid,HttpSession session) {
		//session.getAttribute("userID");
		//System.out.println(session.getAttribute("userID"));
		//Integer userid=Integer.parseInt((String) session.getAttribute("userID"));
		String savepassword;
		savepassword=userService.changePassword(oldPassword, newPassword, userid);
		return savepassword;
	}

	@RequestMapping(value = "/UserMgmt")
	public ModelAndView Usermanagement(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("UserMgmt");
		return modelAndView;
	}

	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	@ResponseBody
	public String addUser(@RequestParam String username, @RequestParam Integer deptId, @RequestParam String email,
			@RequestParam Integer userType, @RequestParam String designation, @RequestParam String mobileNo, HttpSession session) {
		String adduser = userService.addUser(username, deptId, email, userType, designation, mobileNo);
		return adduser;
	}

	@RequestMapping(value = "/getAllUserData", method = RequestMethod.GET)
	@ResponseBody
	public List<UserRequestDto> getAllUserData(HttpSession session) {
		List<UserRequestDto> allUser = userService.getAllUser();
		return allUser;
	}

	@RequestMapping(value = "/addDepartment", method = RequestMethod.POST)
	public ModelAndView addDepartment(@RequestParam String deptName, HttpSession session) {		
		Department dptDepartment = new Department();
		dptDepartment.setDept_name(deptName);
		dptDepartment.setDept_status(1);// default 1 (active) and 0 (inactive)
		Department save = deptRepo.save(dptDepartment);
		ModelAndView mView = new ModelAndView();
		mView.setViewName("redirect:/UserMgmt");
		return mView;

	}

	@RequestMapping(value = "/getAllDepartment", method = RequestMethod.GET)
	@ResponseBody
	public List<DepartmentDto> getAllDepartment(HttpSession session) {
		List<DepartmentDto> allDepartment = userService.getAllDepartment();
		return allDepartment;

	}

	@RequestMapping(value = "/addUserType", method = RequestMethod.POST)

	public UserType addUserType(@RequestParam("usertypename") String usertypename, HttpSession session) {
		UserType utype = new UserType();
		utype.setUsertypename(usertypename);
		utype.setUsertypestatus(1);
		UserType save = usertyperepo.save(utype);
		return save;

	}

	@RequestMapping(value = "/getAllUserType", method = RequestMethod.GET)
	@ResponseBody
	public List<UserTypeDto> getAllUserType(HttpSession session) {
		List<UserTypeDto> allUserType = userService.getAllUserType();
		return allUserType;

	}

	@RequestMapping(value = "/userStatusUpdate", method = RequestMethod.GET)
	@ResponseBody
	public String userStatusUpdate(@RequestParam Integer userById, @RequestParam Integer userStatus, HttpSession session) {
		String userStatusUpdate = userService.deactivateUser(userById, userStatus);
		return userStatusUpdate;
	}

	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	@ResponseBody

	public String deleteUser(@RequestParam Integer userById, @RequestParam Integer userStatus, HttpSession session) {
		String deactivateUser = userService.deactivateUser(userById, userStatus);
		return deactivateUser;
	}

	@RequestMapping(value = "/deleteUserType", method = RequestMethod.GET)
	@ResponseBody
	public String deleteUserType(@RequestParam Integer userTypebyId, @RequestParam Integer userTypeStatus, HttpSession session) {
		String deactivateUserType = userService.deleteUserType(userTypebyId, userTypeStatus);
		return deactivateUserType;

	}

	@RequestMapping(value = "/editDepartmentById", method = RequestMethod.GET)
	@ResponseBody
	public DepartmentDto editDepartmentById(@RequestParam Integer ID, HttpSession session) {

		Department department = deptRepo.findById(ID).get();
		DepartmentDto departmentDto = new DepartmentDto();
		if (department != null) {
			departmentDto.setDepartment(department.getDept_name());
			departmentDto.setUserid(department.getDept_id());
			// System.out.println(department.getDept_id());

		}
		return departmentDto;

	}

	@RequestMapping(value = "/updateDepartment", method = RequestMethod.POST)
	@ResponseBody
	public String updateDepartment(@RequestParam Integer departmentById, @RequestParam String department_name, HttpSession session) {
		String success = null;

		Department department = deptRepo.findById(departmentById).get();
		if (department != null) {
			department.setDept_name(department_name);
			deptRepo.save(department);
			success = "Updated successfully!";
		} else
			success = " Not Updated!";
		return success;

	}

	@RequestMapping(value = "/deleteDepartment", method = RequestMethod.GET)
	@ResponseBody
	public String deleteDepartment(@RequestParam Integer departmentById, @RequestParam Integer department_status, HttpSession session) {
		String deactivateDepartment = userService.deleteDepartment(departmentById, department_status);
		return deactivateDepartment;
	}

	@RequestMapping(value = "/editUserTypeById", method = RequestMethod.GET)
	@ResponseBody
	public UserTypeDto editUserTypeById(@RequestParam Integer ID, HttpSession session) {
		UserType userType = usertyperepo.findById(ID).get();
		UserTypeDto userTypeDto = new UserTypeDto();
		if (userType != null) {
			userTypeDto.setUsertypeid(userType.getUsertypeid());
			userTypeDto.setUsertypename(userType.getUsertypename());
		}
		return userTypeDto;

	}

	@RequestMapping(value = "/editUserById", method = RequestMethod.GET)
	@ResponseBody
	public UserRequestDto editUserById(@RequestParam Integer ID, HttpSession session) {
		User_Details user_Details = userRepository.findById(ID).get();
		//Department dept = deptRepo.findByDepartmentId(deptId);
		UserRequestDto userRequestDto = new UserRequestDto();
		if (user_Details != null) {
			userRequestDto.setUserid(user_Details.getUserId());
			userRequestDto.setUserName(user_Details.getUserName());
			userRequestDto.setEmailId(user_Details.getEmailId());
			userRequestDto.setDesignation(user_Details.getDesignation());
			userRequestDto.setMobileno(user_Details.getMobileNo());
			userRequestDto.setDept(user_Details.getDeptId().toString());
			userRequestDto.setUserType(user_Details.getUserTypeId().toString());
		}
		return userRequestDto;

	}

	@RequestMapping(value = "/updateUser", method = RequestMethod.POST )
	@ResponseBody
	public String updateUser(@RequestParam Integer userid,@RequestParam String username, @RequestParam Integer deptId, @RequestParam String email,
			@RequestParam Integer userType, @RequestParam String designation, @RequestParam String mobile, HttpSession session) {
		String success = null;
		User_Details user  = userRepository.findById(userid).get();
		if (user != null) {
			user.setUserName(username);
			user.setDeptId(deptId);
			user.setDesignation(designation);
			user.setEmailId(email);
			user.setUserTypeId(userType);
			user.setMobileNo(mobile);
			userRepository.save(user);
			success = "Updated successfully!";
		} else
			success = " Not Updated!";
		return success;

	}

	@RequestMapping(value = "/updateUsertype", method = RequestMethod.POST)
	@ResponseBody
	public String updateUsertype(@RequestParam Integer userTypeid, @RequestParam String userTypename, HttpSession session) {
		String success = null;
		UserType userType = usertyperepo.findById(userTypeid).get();
		if (userType != null) {
			userType.setUsertypename(userTypename);
			usertyperepo.save(userType);
			success = "Updated successfully!";

		} else
			success = "Not Updated!";
		return success;

	}
}
