package com.acc.mconnect.test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.acc.mconnect.dao.MConnectDAO;
import com.acc.mconnect.entities.Category;
import com.acc.mconnect.entities.Subcategory;
import com.acc.mconnect.entities.Tabperson;
@ContextConfiguration("classpath:test-spring-servlet.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class MConnectDAOTest {
	@Autowired	
	MConnectDAO mConnectDAO;
 
	@Before
	public void setUp() throws Exception {
		//session = sessionFactory.getCurrentSession();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void  testGetAllCategories() {		
		List<Category> categories =mConnectDAO.getAllCategories();
		assertNotNull(categories);
	}

	@Test
	public void testGetAllSubCategories() {
		List<Subcategory> subcategories = mConnectDAO.getAllSubCategories();
		assertNotNull(subcategories);
	}

	@Test
	public void testGetAllEmployeeContribution() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAllEventPictures() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAllFromTheShows() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAllInTheNews() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAllMediaFiles() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAllPerson() {
		List<Tabperson> persons = mConnectDAO.getAllPerson();
		assertNotNull(persons);
	}

	@Test
	public void testGetPasswordForAdmin() {
		String password = mConnectDAO.getPasswordForAdmin();
	}

	@Test
	public void testDeleteTypeContent() {
	//	mConnectDAO.deleteTypeContent("category", "4");
	}

	@Test
	public void testInsert() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsertSubCategory() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testFindTypedContent()
	{
		Category category = (Category) mConnectDAO.finTypeContent("category", "4");
		assertTrue(category.getCategoryName().equals("Employee Contributions"));
	}

}
