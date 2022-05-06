package com.coast.app.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import com.coast.app.customRepository.UserTypeRepository;
import com.coast.app.dto.DepartmentDto;
import com.coast.app.dto.UserRequestDto;
import com.coast.app.dto.UserTypeDto;
import com.coast.app.entity.Department;
import com.coast.app.entity.UserType;
import com.coast.app.entity.User_Details;
import com.coast.app.repository.DepartmentRepository;
import com.coast.app.repository.UserRepository;
import com.coast.app.repository.UsertypeRepository;
import com.coast.app.security.JavaSecurity;
import com.coast.app.service.UserService;
import com.coast.app.utility.CustomUtility;

import net.bytebuddy.asm.Advice.Exit;

//@Configuration
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private DepartmentRepository deptRepo;

	@Autowired
	private UsertypeRepository userTyperepo;


	@Override
	public String aunthetictaeUser(String email, String password) {
		String status = "";
		User_Details findByEmailId = userRepository.findByEmailId(email);
		if ((email != "") && (findByEmailId != null)) {
			String password2 = findByEmailId.getPassword();
			JavaSecurity secure = new JavaSecurity();
			String decrypt = secure.decrypt(password2);
			// System.out.println(decrypt);
			if (!password.equals(decrypt)) {
				status = "Password is incorrect !";
			}

			else {
				status = "Logged In successfully !";
			}

		}

		else {
			status = " Please enter valid  UserId or Password!";
		}

		return status;
	}

	@Override
	public String addUser(String username, Integer deptId, String email, Integer userType, String designation,
			String mobileNo) {
		String success = null;

		JavaSecurity secure = new JavaSecurity();
		User_Details user = new User_Details();
		user.setUserName(username);
		user.setDeptId(deptId);
		user.setEmailId(email);
		user.setUserTypeId(userType);
		user.setDesignation(designation);
		user.setMobileNo(mobileNo);
		user.setPassword(secure.encrypt(createPassword(username, mobileNo)));
		// System.out.println(createPassword(username, mobileNo));
		user.setStatus(1);
		user.setUserStatus(1);
		User_Details save = userRepository.save(user);
		String decrypt_password = secure.decrypt(save.getPassword());
		if (save.getEmailId() != null) {
			sendEmail(save.getEmailId(), "Password Generated", "your password is : " + decrypt_password);
		}
		if (save != null) {
			success = " User added successfully !";
		} else
			success = "Addition unsuccessfull";

		return success;

	}

	public String createPassword(String userName, String mobileNo) {
		String pwString = "";
		if (!userName.equals("") && mobileNo != null) {
			pwString = userName + "_" + mobileNo.substring(6, 10);
		}
		return pwString;

	}

	/* mail sending service method: */

	public void sendEmail(String toEmails, String emailSubject, String emailBody) {
		try {
			CustomUtility.sendEmail(toEmails, emailSubject, emailBody);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		// return "Email sent successfully";
	}

	@Override
	public List<UserRequestDto> getAllUser() {
		List<User_Details> findAll = userRepository.findAll();
		List<UserRequestDto> list = new ArrayList<>();
		//Department dept :findAll;

		for (User_Details user_Details : findAll) {
			UserRequestDto user = new UserRequestDto();
			user.setDesignation(user_Details.getDesignation());
			user.setEmailId(user_Details.getEmailId());
			user.setUserName(user_Details.getUserName());
			user.setUserType(user_Details.getUserTypeId().toString());
			user.setDept(deptRepo.findById(user_Details.getDeptId()).get().getDept_name());
			user.setUserid(user_Details.getUserId());
			user.setUserStatus(user_Details.getUserStatus());
			user.setMobileno(user_Details.getMobileNo());
			list.add(user);

		}
		return list;
	}

	@Override
	public List<User_Details> listAll() {
		return null;
	}

	@Override
	public List<DepartmentDto> getAllDepartment() {
		List<Department> findAll = deptRepo.findAll();
		List<DepartmentDto> list = new ArrayList<DepartmentDto>();
		for (Department department : findAll) {
			DepartmentDto dp = new DepartmentDto();			
				dp.setDepartment(department.getDept_name());
				dp.setUserid(department.getDept_id());
				// dp.setDepartment_status(department.getDept_status());
				list.add(dp);
			
		}
		return list;
	}

	@Override
	public List<UserTypeDto> getAllUserType() {
		List<UserType> findAll = userTyperepo.findAll();
		List<UserTypeDto> list = new ArrayList<UserTypeDto>();
		for (UserType userType : findAll) {
			UserTypeDto usertypeDto = new UserTypeDto();
			if (userType.getUsertypestatus() == 1) {
				usertypeDto.setUsertypename(userType.getUsertypename());
				usertypeDto.setUsertypeid(userType.getUsertypeid());
				list.add(usertypeDto);
			}
		}
		return list;
	}

	@Override
	public String deactivateUser(Integer userById, Integer userStatus) {
		User_Details user = userRepository.findById(userById).get();
		String success = null;
		/*
		 * if (userStatus == 0) { userStatus = 0; } else userStatus = 1;
		 */
		user.setUserStatus(userStatus);
		User_Details save = userRepository.save(user);
		if (save != null) {
			success = "Status Updated successfully !";

		} else {
			success = "Not Updated";
		}
		return success;
	}

	@Override
	public String deleteUser(Integer userById, Integer userStatus) {
		User_Details user = userRepository.findById(userById).get();
		String success = null;
		/*
		 * if (userStatus == 0) { userStatus = 0; } else userStatus = 1;
		 */
		user.setUserStatus(userStatus);
		User_Details save = userRepository.save(user);
		if (save != null) {
			success = " User deactivated successfully !";
		} else {
			success = "deletion unsuccessfull";
		}
		return success;
	}

	@Override
	public Department addDepartment(DepartmentDto departmentDto) {
		Department dept = new Department();
		dept.setDept_id(departmentDto.getUserid());
		dept.setDept_name(departmentDto.getDepartment());
		dept.setDept_status(1);// default 1 (active) and 0 (inactive)
		Department save = deptRepo.save(dept);
		return save;
	}

	@Override
	public String deleteDepartment(Integer departmentById, Integer department_status) {
		Department department = deptRepo.findById(departmentById).get();
		String success = null;
		/*
		 * if (userStatus == 0) { userStatus = 0; } else userStatus = 1;
		 */
		department.setDept_status(department_status);
		Department save = deptRepo.save(department);
		if (save != null) {
			success = "Deactivated successfully !";
		} else {
			success = "Deactivation unsuccessfull !";
		}
		return success;
	}

	@Override
	public String deleteUserType(Integer userTypebyId, Integer userTypeStatus) {
		UserType usertype = userTyperepo.findById(userTypebyId).get();
		usertype.setUsertypestatus(userTypeStatus);
		UserType save = userTyperepo.save(usertype);
		String success = null;
		if (save != null) {
			success = "Deactivated successfully !";
		} else {
			success = "Deactivation unsuccessfull !";
		}
		return success;

	}

	@Override
	public String changePassword(String oldPassword, String newPassword, Integer id) {
		String status = "";
		User_Details user = userRepository.getById(id);
		String match_password = user.getPassword();
		JavaSecurity secure = new JavaSecurity();
		//String decrypt = secure.decrypt(match_password);	
		if (match_password.equals(oldPassword)) 
		{
			user.setPassword(newPassword);
			User_Details save = userRepository.save(user);
			status = "Password Updated successfully !";			
		} 
		else 
		{
			status = "Old Password Doesn't Match !";
		}
		return status;
	}

	@Override
	public String updateDepartment(Integer departmentById, Integer department_status, String department_name) {
		Department department = deptRepo.findById(departmentById).get();
		String success = null;
		department.setDept_name(department_name);
		department.setDept_status(department_status);
		Department save = deptRepo.save(department);
		if (save != null) {
			success = "Department updated successfully !";
		} else {
			success = "Updation unsuccessfull";
		}
		return success;
	}

	@Override
	public String deptValidate(String deptname) 
	{
		String status="";
		//Stream<Department> filter = deptRepo.findAll().stream().filter(f->f.getDept_name().contains(deptname));
		//System.out.println(filter);
		/*Boolean department = deptRepo.existsByDept_name(deptname);
		if(department.equals(true)) 		{
		status="Department already exist";
		}*/
		List<Department> findAll = deptRepo.findAll();
		//List<DepartmentDto> list = new ArrayList<DepartmentDto>();
		for (Department department : findAll) {			
			if (department.getDept_name().equalsIgnoreCase(deptname)) {
				status="success";
			}
		}
	return status;
	}

}