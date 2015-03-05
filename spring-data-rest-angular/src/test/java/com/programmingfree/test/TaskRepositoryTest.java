package com.programmingfree.test;

import java.util.List;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.data.repository.query.Param;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.programmingfree.springservice.Application;
import com.programmingfree.springservice.Task;
import com.programmingfree.springservice.TaskRepository;
import com.programmingfree.springservice.User;
import com.programmingfree.springservice.UserRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
public class TaskRepositoryTest {
	 @Autowired
	  private TaskRepository taskRepository;
	 
	 @Autowired
	 private UserRepository userRepository;
	
	 User user ;
	 boolean isSetup= false;
	 
	 @Before
		public void setUp() throws Exception {

		 if(!isSetup)
		 {
			user = new User();
			user.setUserName("test_user");		
			userRepository.save(user);
			isSetup = true;
		 }
		}

			 
	 
	@Test
	public void testUserandTask() {
	  
		Task t1 = new Task();
		t1.setUserId(userRepository.findByUserName(user.getUserName()).get(0));
		t1.setTaskDescription("testdesc");
		t1.setTaskName("testname");
		Task task= taskRepository.save(t1);
		Assert.assertNotNull(task);
		
	}
	
	 
	@Test
	public void testSaveMultipleTask() {
	  
		for(int i=0;i<5;i++)
		{
		
		Task t1 = new Task();
		t1.setUserId(userRepository.findByUserName(user.getUserName()).get(0));
		t1.setTaskDescription("testdesc");
		t1.setTaskName("testname");
		Task task= taskRepository.save(t1);
		
		}
		
		List<Task> tasks= taskRepository.findByUserId(user);
		Assert.assertTrue(tasks.size()>0);
		
	}
	

}
