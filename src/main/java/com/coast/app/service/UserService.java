package com.coast.app.service;

import java.util.List;

import com.coast.app.dto.DepartmentDto;
import com.coast.app.dto.UserRequestDto;
import com.coast.app.dto.UserTypeDto;
import com.coast.app.entity.Department;
import com.coast.app.entity.User_Details;

public interface UserService {
	String aunthetictaeUser(String email, String password);

	// public void addUser(UserRequestDto userRequestDto);

	//public User_Details addUser(UserRequestDto userRequestDto);

	// public List<User_Details> getAllUser();

	public String changePassword(String oldPassword, String newPassword, Integer id);

	public List<UserRequestDto> getAllUser();

	public List<User_Details> listAll();

	public List<DepartmentDto> getAllDepartment();

	List<UserTypeDto> getAllUserType();

	String deactivateUser(Integer userById, Integer userStatus);

	String deleteUser(Integer userById, Integer userStatus);

	String deleteDepartment(Integer userById, Integer userStatus);

	String deleteUserType(Integer userTypebyId, Integer userTypeStatus);

	public Department addDepartment(DepartmentDto departmentDto);

	String updateDepartment(Integer departmentById, Integer department_status, String department_name);

	String addUser(String username, Integer deptId, String email, Integer userType, String designation,
			String mobileNo);

	String deptValidate(String dept);

}
