package com.programmingfree.springservice;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
@RepositoryRestResource
public interface UserRepository extends CrudRepository<User, Integer>  {
	
	List<User> findByUserName(@Param("user_id") String user_id);	
	List<User> findByUserEmail(@Param("userEmail") String email);   
		
	}

