package com.acc.mconnect.dao;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.acc.mconnect.entities.Category;
import com.acc.mconnect.entities.Subcategory;
import com.acc.mconnect.entities.Tabemployeecontribution;
import com.acc.mconnect.entities.Tabeventspicture;
import com.acc.mconnect.entities.Tabfromtheshow;
import com.acc.mconnect.entities.Tabinthenew;
import com.acc.mconnect.entities.Tabmediafile;
import com.acc.mconnect.entities.Tabperson;
import com.acc.mconnect.entities.Tabuser;

@Repository
@Transactional
public class MConnectDAO {

	@Autowired
	private SessionFactory sessionFactory;
	

	public List<Category> getAllCategories() {
		List<Category> categories = sessionFactory.getCurrentSession().createQuery("from Category").list();
		return categories;
	}

	public List<com.acc.mconnect.entities.Subcategory> getAllSubCategories() {
		List<Subcategory> subcategories = sessionFactory.getCurrentSession().createQuery(
				"from Subcategory").list();
		return subcategories;
	}

	public List<Tabemployeecontribution> getAllEmployeeContribution() {
		List<Tabemployeecontribution> employeeContribution = sessionFactory.getCurrentSession()
				.createQuery("from Tabemployeecontribution").list();
		return employeeContribution;
	}

	public List<Tabeventspicture> getAllEventPictures() {
		List<Tabeventspicture> eventsPictures = sessionFactory.getCurrentSession().createQuery(
				"from Tabeventspicture").list();
		return eventsPictures;
	}

	public List<Tabfromtheshow> getAllFromTheShows() {
		List<Tabfromtheshow> fromtheShows = sessionFactory.getCurrentSession().createQuery(
				"from Tabfromtheshow").list();
		return fromtheShows;
	}

	public List<Tabinthenew> getAllInTheNews() {
		List<Tabinthenew> inTheNews = sessionFactory.getCurrentSession().createQuery("from Tabinthenew")
				.list();
		return inTheNews;
	}

	public List<Tabmediafile> getAllMediaFiles() {
		List<Tabmediafile> mediaFiles = sessionFactory.getCurrentSession()
				.createQuery("from Tabmediafile").list();
		return mediaFiles;
	}

	public List<Tabperson> getAllPerson() {
		List<Tabperson> persons = sessionFactory.getCurrentSession().createQuery("from Tabperson").list();
		return persons;
	}

	public String getPasswordForAdmin() {
		Query query = sessionFactory.getCurrentSession()
				.createQuery("from Tabuser usr where usr.isTermsAccepted='ADMIN'");
		List<Tabuser> users = query.list();
		Tabuser usr = users.get(0);
		String password = usr.getUserType();
		return password;

	}

	public void deleteTypeContent(String type, String id) {
		Object obj = null;
		if (type.equals("category")) {
			obj = sessionFactory.getCurrentSession().get(Category.class, new Integer(id));
		}

		else if (type.equals("subcategory")) {
			obj = sessionFactory.getCurrentSession().get(com.acc.mconnect.entities.Subcategory.class,
					new Integer(id));
		}

		else if (type.equals("employeecontribution")) {
			obj = sessionFactory.getCurrentSession().get(Tabemployeecontribution.class, new Integer(id));
		}

		else if (type.equals("EventsPictures")) {
			obj = sessionFactory.getCurrentSession().get(Tabeventspicture.class, new Integer(id));
		}

		else if (type.equals("fromtheshows")) {
			obj = sessionFactory.getCurrentSession().get(Tabfromtheshow.class, new Integer(id));
		} else if (type.equals("inthenews")) {
			obj = sessionFactory.getCurrentSession().get(Tabinthenew.class, new Integer(id));
		} else if (type.equals("mediafiles")) {
			obj = sessionFactory.getCurrentSession().get(Tabmediafile.class, new Integer(id));
		}

		else if (type.equals("person")) {
			obj = sessionFactory.getCurrentSession().get(Tabperson.class, new Integer(id));
		}
		sessionFactory.getCurrentSession().delete(obj);

	}

	public String insert(String categories, String title, String fname,
			String lname, String designation, String subCategory,
			String description, String image, String video, String audio,
			String userName, String priority, String uploadType) {

		java.sql.Timestamp todaysDate = new Timestamp(Calendar.getInstance()
				.getTimeInMillis());
		try {
			if (categories.equals("2")) {

				// create a news
				Tabinthenew tabinthenew = new Tabinthenew();
				Subcategory subcategory = new Subcategory();
				subcategory.setSubcategoryId(Integer.parseInt(subCategory));

				tabinthenew.setSubcategory(subcategory);
				tabinthenew.setInTheNewsDate(new Date());
				tabinthenew.setInTheNewsTitle(title);
				tabinthenew.setInthenewsimageurl(image);
				tabinthenew.setInTheNewsContent(description);

				// create a media file

				Tabmediafile tabmediafile = new Tabmediafile();
				tabmediafile.setCategoryId(Integer.parseInt(subCategory));
				tabmediafile.setMediaFileType(uploadType);
				tabmediafile.setMediaFileName(image);
				tabmediafile.setMediaFileDesc(description);
				tabmediafile.setMediafileimage(image);
				tabmediafile.setMediaURL(image);
				tabmediafile.setMediauploadDate(new Date());
				tabmediafile.setUsername(userName.toUpperCase());

				sessionFactory.getCurrentSession().save(tabinthenew);
				sessionFactory.getCurrentSession().save(tabmediafile);

				return "success";
			}

			else if (categories.equals("3")) {
				// create a show
				Tabfromtheshow fromTabfromtheshow = new Tabfromtheshow();
				Subcategory subcategory = new Subcategory();
				subcategory.setSubcategoryId(Integer.parseInt(subCategory));
				fromTabfromtheshow.setSubcategory(subcategory);
				fromTabfromtheshow.setFromTheShowsTitle(title);
				fromTabfromtheshow.setFromTheShowsDate(new Date());
				fromTabfromtheshow.setFromtheshowsimageurl(image);
				fromTabfromtheshow.setFromTheShowsContent(description);

				// create a media file
				Tabmediafile tabmediafile = new Tabmediafile();
				tabmediafile.setCategoryId(Integer.parseInt(subCategory));
				tabmediafile.setMediaFileType(uploadType);
				tabmediafile.setMediaFileName(image);
				tabmediafile.setMediaFileDesc(description);
				tabmediafile.setMediafileimage(image);
				tabmediafile.setMediaURL(image);
				tabmediafile.setMediauploadDate(new Date());
				tabmediafile.setUsername(userName.toUpperCase());

				sessionFactory.getCurrentSession().save(tabmediafile);
				sessionFactory.getCurrentSession().save(fromTabfromtheshow);

				return "success";

			} else if (categories.equals("4")) {
				// create a contribution

				Tabemployeecontribution contribution = new Tabemployeecontribution();
				Subcategory subcategory = new Subcategory();
				subcategory.setSubcategoryId(Integer.parseInt(subCategory));
				contribution.setSubcategory(subcategory);
				contribution.setEmployeeContributionTitle(title);
				contribution.setEmployeeContributionDate(new Date());
				contribution.setEmployeeContributionimageurl(image);
				contribution.setEmployeeContributionContent(description);

				// create a media file
				Tabmediafile tabmediafile = new Tabmediafile();
				tabmediafile.setCategoryId(Integer.parseInt(subCategory));
				tabmediafile.setMediaFileType(uploadType);
				tabmediafile.setMediaFileName(image);
				tabmediafile.setMediaFileDesc(description);
				tabmediafile.setMediafileimage(image);
				tabmediafile.setMediaURL(image);
				tabmediafile.setMediauploadDate(new Date());
				tabmediafile.setUsername(userName.toUpperCase());

				sessionFactory.getCurrentSession().save(tabmediafile);
				sessionFactory.getCurrentSession().save(contribution);

				return "success";

			} else if (categories.equals("5")) {

				// create a eventpictures

				Tabeventspicture tabeventspicture = new Tabeventspicture();
				Subcategory subcategory = new Subcategory();
				subcategory.setSubcategoryId(Integer.parseInt(subCategory));

				tabeventspicture.setSubcategory(subcategory);
				tabeventspicture.setEventTitle(title);
				tabeventspicture.setEventDate(new Date());
				tabeventspicture.setEventimageurl(image);
				tabeventspicture.setEventContent(description);

				// create a media file
				Tabmediafile tabmediafile = new Tabmediafile();
				tabmediafile.setCategoryId(Integer.parseInt(subCategory));
				tabmediafile.setMediaFileType(uploadType);
				tabmediafile.setMediaFileName(image);
				tabmediafile.setMediaFileDesc(description);
				tabmediafile.setMediafileimage(image);
				tabmediafile.setMediaURL(image);
				tabmediafile.setMediauploadDate(new Date());
				tabmediafile.setUsername(userName.toUpperCase());

				sessionFactory.getCurrentSession().save(tabeventspicture);
				sessionFactory.getCurrentSession().save(tabmediafile);

				return "success";

			} else {
				Tabperson tabperson = new Tabperson();
				tabperson.setFirstName(fname);
				tabperson.setLastName(lname);
				tabperson.setImgLoc(image);
				tabperson.setDesignation(designation);
				tabperson.setUsername(userName);
				tabperson.setHobbydesc(description);
				tabperson.setPriority(Integer.parseInt(priority));

				sessionFactory.getCurrentSession().save(tabperson);
				sessionFactory.getCurrentSession().createSQLQuery(
						"update tabperson set priority = priority+1 where priority >="
								+ Integer.parseInt(priority)).executeUpdate();

				return "success";

			}

		} catch (DataAccessException dataAccessException) {
			return "failure";
		}

	}

	public String insertSubCategory(String title, String fileName,
			String uploadType, String uploaduser, String categoryid) {

		try {
			Subcategory subcategory = new Subcategory();
			Category category = new Category();
			category.setCategoryId(Integer.parseInt(categoryid));
			subcategory.setCategory(category);
			subcategory.setSubCategoryTitle(title);
			subcategory.setSubCategoryDate(new Date());
			subcategory.setSubCategoryImgUrl(fileName);
			sessionFactory.getCurrentSession().save(subcategory);
			return "success";
		} catch (HibernateException exception) {
			return "failure";
		}

	}
	
	public Object finTypeContent(String type, String id) {
		Object obj = null;
		if (type.equals("category")) {
			obj = sessionFactory.getCurrentSession().get(Category.class, new Integer(id));
		}

		else if (type.equals("subcategory")) {
			obj = sessionFactory.getCurrentSession().get(Subcategory.class,	new Integer(id));
		}

		else if (type.equals("employeecontribution")) {
			obj = sessionFactory.getCurrentSession().get(Tabemployeecontribution.class, new Integer(id));
		}

		else if (type.equals("EventsPictures")) {
			obj = sessionFactory.getCurrentSession().get(Tabeventspicture.class, new Integer(id));
		}

		else if (type.equals("fromtheshows")) {
			obj = sessionFactory.getCurrentSession().get(Tabfromtheshow.class, new Integer(id));
		} else if (type.equals("inthenews")) {
			obj = sessionFactory.getCurrentSession().get(Tabinthenew.class, new Integer(id));
		} else if (type.equals("mediafiles")) {
			obj = sessionFactory.getCurrentSession().get(Tabmediafile.class, new Integer(id));
		}

		else if (type.equals("person")) {
			obj = sessionFactory.getCurrentSession().get(Tabperson.class, new Integer(id));
		}
		return obj;

	}
	
	public void updateDetails(Object obj)
	{
		if(obj instanceof Category){
			sessionFactory.getCurrentSession().saveOrUpdate(obj);	
		}
		else if (obj instanceof Subcategory)
		{
			sessionFactory.getCurrentSession().saveOrUpdate(obj);
		}
		else if(obj instanceof Tabemployeecontribution)
		{
			sessionFactory.getCurrentSession().saveOrUpdate(obj);
		}
		else if(obj instanceof Tabeventspicture)
		{
			sessionFactory.getCurrentSession().saveOrUpdate(obj);
		}
		else if(obj instanceof Tabfromtheshow)
		{
			sessionFactory.getCurrentSession().saveOrUpdate(obj);
		}
		else if(obj instanceof Tabinthenew)
		{
			sessionFactory.getCurrentSession().saveOrUpdate(obj);
		}
		else if(obj instanceof Tabmediafile)
		{
			sessionFactory.getCurrentSession().saveOrUpdate(obj);
		}
		else
		{
			sessionFactory.getCurrentSession().saveOrUpdate(obj);
		}
	}
	
}
