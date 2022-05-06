package com.coast.app.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.coast.app.entity.User_Details;

public interface UserRepository extends JpaRepository<User_Details, Integer>
{
	User_Details findByEmailId(@Param("userName") String userName);

	Boolean existsByEmailId(String email);
	//@Query(value ="SELECT * FROM public.user_details where emailid=:userName",nativeQuery = true)
	//User_Details findByEmailId(String userName);

}
