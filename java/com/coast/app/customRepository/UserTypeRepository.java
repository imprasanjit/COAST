package com.coast.app.customRepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coast.app.entity.UserType;

public interface UserTypeRepository extends JpaRepository<UserType, Integer>{

}
