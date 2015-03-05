package com.acc.mconnect.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.acc.mconnect.dao.MConnectDAO;
import com.acc.mconnect.entities.Category;
import com.acc.mconnect.entities.Subcategory;
import com.acc.mconnect.entities.Tabemployeecontribution;
import com.acc.mconnect.entities.Tabeventspicture;
import com.acc.mconnect.entities.Tabfromtheshow;
import com.acc.mconnect.entities.Tabinthenew;
import com.acc.mconnect.entities.Tabmediafile;
import com.acc.mconnect.entities.Tabperson;
import com.acc.mconnect.forms.InputForm;
import com.acc.mconnect.forms.LoginForm;
import com.acc.mconnect.forms.Population;
import com.acc.mconnect.forms.SubCategoryForm;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class MConnectController {

	private String fileLoc;

	@Autowired
	MConnectDAO mconnectDAO;

	// MConnectDAO mconnectDAO = mConnectService.getMConnectDAO();
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String showLoginForm(Map model) {
		String message = "Loading Login Form";
		System.out.println(message);
		LoginForm loginForm = new LoginForm();
		model.put("loginForm", loginForm);
		return "login";
	}

	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public String login(@Valid LoginForm loginForm, BindingResult result,
			Map model, HttpServletRequest request) {
		String message = "Inside login form post method!";

		String password = mconnectDAO.getPasswordForAdmin();
		if (!loginForm.getEnterpriseid().toUpperCase().equals("ADMIN")) {
			ObjectError error = new ObjectError("enterpriseid",
					"Incorrect User Name");
			result.addError(error);
		}
		if (!loginForm.getPassword().equals(password)) {
			ObjectError error = new ObjectError("password",
					"Incorrect Password");
			result.addError(error);
		}

		if (result.hasErrors()) {
			// return new ModelAndView("login","command",new LoginForm());
			return "login";
		}

		request.getSession().setAttribute("enterpriseid",
				loginForm.getEnterpriseid());
		// return shoWContents();
		model.put("loginForm", loginForm);
		return "redirect:content.html";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		String message = "In the logout";
		System.out.println(message);
		request.getSession().invalidate();
		return "redirect:index.html";

	}

	@RequestMapping("/loadPopulation")
	public @ResponseBody
	String getPopulationisInJSON() {
		List<Population> population = new ArrayList<Population>();
		Population p1 = new Population();
		p1.setYear("2001");
		p1.setPopulation("30000");

		Population p2 = new Population();
		p2.setYear("2002");
		p2.setPopulation("40000");

		Population p3 = new Population();
		p3.setYear("2003");
		p3.setPopulation("50000");

		Population p4 = new Population();
		p4.setYear("2004");
		p4.setPopulation("60000");
		population.add(p1);
		population.add(p2);
		population.add(p3);
		population.add(p4);

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(population);
		return json;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String updateRecord(@RequestParam("type") String type,
			@RequestParam("id") String id, Model model) {

		model.addAttribute("type", type);

		Object obj = mconnectDAO.finTypeContent(type, id);
		if (type.equals("category")) {
			Category category = (Category) obj;
			model.addAttribute("category", category);
			model.addAttribute("subcategory", new Subcategory());
			model.addAttribute("employeeContribution",	new Tabemployeecontribution());
			model.addAttribute("tabeventspicture", new Tabeventspicture());
			model.addAttribute("tabfromtheshow", new Tabfromtheshow());
			model.addAttribute("tabinthenew", new Tabinthenew());
			model.addAttribute("tabmediafile", new Tabmediafile());
			model.addAttribute("tabperson", new Tabperson());
		} else if (type.equals("subcategory")) {
			Subcategory subcategory = (Subcategory) obj;
			model.addAttribute("subcategory", subcategory);
			model.addAttribute("category", new Category());
			model.addAttribute("employeeContribution",
					new Tabemployeecontribution());
			model.addAttribute("tabeventspicture", new Tabeventspicture());
			model.addAttribute("tabfromtheshow", new Tabfromtheshow());
			model.addAttribute("tabinthenew", new Tabinthenew());
			model.addAttribute("tabmediafile", new Tabmediafile());
			model.addAttribute("tabperson", new Tabperson());

		} else if (type.equals("employeecontribution")) {
			Tabemployeecontribution employeeContribution = (Tabemployeecontribution) obj;
			model.addAttribute("employeeContribution", employeeContribution);
			model.addAttribute("category", new Category());
			model.addAttribute("subcategory", new Subcategory());
			model.addAttribute("tabeventspicture", new Tabeventspicture());
			model.addAttribute("tabfromtheshow", new Tabfromtheshow());
			model.addAttribute("tabinthenew", new Tabinthenew());
			model.addAttribute("tabmediafile", new Tabmediafile());
			model.addAttribute("tabperson", new Tabperson());

		} else if (type.equals("EventsPictures")) {
			Tabeventspicture tabeventspicture = (Tabeventspicture) obj;
			model.addAttribute("tabeventspicture", tabeventspicture);
			model.addAttribute("category", new Category());
			model.addAttribute("subcategory", new Subcategory());
			model.addAttribute("employeeContribution",new Tabemployeecontribution());
			model.addAttribute("tabfromtheshow", new Tabfromtheshow());
			model.addAttribute("tabinthenew", new Tabinthenew());
			model.addAttribute("tabmediafile", new Tabmediafile());
			model.addAttribute("tabperson", new Tabperson());

		} else if (type.equals("fromtheshows")) {
			Tabfromtheshow tabfromtheshow = (Tabfromtheshow) obj;
			model.addAttribute("tabfromtheshow", tabfromtheshow);
			model.addAttribute("category", new Category());
			model.addAttribute("subcategory", new Subcategory());
			model.addAttribute("employeeContribution",new Tabemployeecontribution());
			model.addAttribute("tabeventspicture", new Tabeventspicture());
			model.addAttribute("tabinthenew", new Tabinthenew());
			model.addAttribute("tabmediafile", new Tabmediafile());
			model.addAttribute("tabperson", new Tabperson());

		} else if (type.equals("inthenews")) {
			Tabinthenew tabinthenew = (Tabinthenew) obj;
			model.addAttribute("tabinthenew", tabinthenew);
			model.addAttribute("category", new Category());
			model.addAttribute("subcategory", new Subcategory());
			model.addAttribute("employeeContribution",new Tabemployeecontribution());
			model.addAttribute("tabeventspicture", new Tabeventspicture());
			model.addAttribute("tabfromtheshow", new Tabfromtheshow());
			model.addAttribute("tabmediafile", new Tabmediafile());
			model.addAttribute("tabperson", new Tabperson());

		} else if (type.equals("mediafiles")) {
			Tabmediafile tabmediafile = (Tabmediafile) obj;
			model.addAttribute("tabmediafile", tabmediafile);
			model.addAttribute("tabinthenew", new Tabinthenew());
			model.addAttribute("category", new Category());
			model.addAttribute("subcategory", new Subcategory());
			model.addAttribute("employeeContribution",new Tabemployeecontribution());
			model.addAttribute("tabeventspicture", new Tabeventspicture());
			model.addAttribute("tabfromtheshow", new Tabfromtheshow());
			model.addAttribute("tabperson", new Tabperson());

		}else
		{
			Tabperson tabperson = (Tabperson) obj;
			model.addAttribute("tabperson", tabperson);
			model.addAttribute("tabmediafile", new Tabmediafile());
			model.addAttribute("tabinthenew", new Tabinthenew());
			model.addAttribute("category", new Category());
			model.addAttribute("subcategory", new Subcategory());
			model.addAttribute("employeeContribution",new Tabemployeecontribution());
			model.addAttribute("tabeventspicture", new Tabeventspicture());
			model.addAttribute("tabfromtheshow", new Tabfromtheshow());
		}
		return "edit";
	}

	@RequestMapping(value = "/updateCategoryDetails", method = RequestMethod.POST)
	public String updateDetails(@ModelAttribute("category") Category category) {
		mconnectDAO.updateDetails(category);
		return "redirect:category.html";
	}

	@RequestMapping(value = "/updateSubCategoryDetails", method = RequestMethod.POST)
	public String updateDetails(
			@ModelAttribute("subcategory") Subcategory subcategory) {
		mconnectDAO.updateDetails(subcategory);
		return "redirect:subcategory.html";
	}

	@RequestMapping(value = "/updateEmpContributionDetails", method = RequestMethod.POST)
	public String updateDetails(
			@ModelAttribute("employeeContribution") Tabemployeecontribution tabemployeecontribution) {
		mconnectDAO.updateDetails(tabemployeecontribution);
		return "redirect:contibutions.html";
	}

	@RequestMapping(value = "/updateTabeventspicture", method = RequestMethod.POST)
	public String updateDetails(
			@ModelAttribute("tabeventspicture") Tabeventspicture tabeventspicture) {
		mconnectDAO.updateDetails(tabeventspicture);
		return "redirect:eventspictures.html";
	}

	@RequestMapping(value = "/updateTabfromtheshows", method = RequestMethod.POST)
	public String updateDetails(
			@ModelAttribute("tabfromtheshow") Tabfromtheshow tabfromtheshow) {
		mconnectDAO.updateDetails(tabfromtheshow);
		return "redirect:fromtheshows.html";
	}

	@RequestMapping(value = "/updateTabinthenew", method = RequestMethod.POST)
	public String updateDetails(
			@ModelAttribute("tabinthenew") Tabinthenew tabinthenew) {
		mconnectDAO.updateDetails(tabinthenew);
		return "redirect:inthenews.html";
	}

	@RequestMapping(value = "/updateTabmediafile", method = RequestMethod.POST)
	public String updateDetails(
			@ModelAttribute("tabmediafile") Tabmediafile tabmediafile) {
		mconnectDAO.updateDetails(tabmediafile);
		return "redirect:mediafiles.html";
	}
	@RequestMapping(value = "/updateTabperson", method = RequestMethod.POST)
	public String updateDetails(
			@ModelAttribute("tabperson") Tabperson tabperson) {
		mconnectDAO.updateDetails(tabperson);
		return "redirect:persons.html";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteRecord(@RequestParam("type") String type,
			@RequestParam("id") String id, Model model) {

		System.out.println(type);
		System.out.println(id);

		mconnectDAO.deleteTypeContent(type, id);

		if (type.equals("person")) {
			return "redirect:persons.html";
		} else if (type.equals("category")) {
			return "redirect:category.html";
		} else if (type.equals("subcategory")) {
			return "redirect:subcategory.html";
		} else if (type.equals("employeecontribution")) {
			return "redirect:contibutions.html";
		} else if (type.equals("fromtheshows")) {
			return "redirect:fromtheshows.html";
		} else if (type.equals("inthenews")) {
			return "redirect:inthenews.html";
		} else if (type.equals("EventsPictures")) {
			return "redirect:eventspictures.html";
		} else if (type.equals("mediafiles")) {
			return "redirect:mediafiles.html";
		}
		return "redirect:content.html";
	}

	@RequestMapping("/category")
	public String showCategories(Model model) {
		List<Category> categoryList = mconnectDAO.getAllCategories();
		model.addAttribute("categoryList", categoryList);
		return "categories";

	}

	@RequestMapping("/subcategory")
	public String showSubCategories(Model model) {
		List<Subcategory> subCategoryList = mconnectDAO.getAllSubCategories();
		model.addAttribute("subCategoryList", subCategoryList);
		return "subcategories";

	}

	@RequestMapping("/contibutions")
	public String showContributions(Model model) {
		List<Tabemployeecontribution> contributionList = mconnectDAO
				.getAllEmployeeContribution();
		model.addAttribute("contributionList", contributionList);
		return "contributions";

	}

	@RequestMapping("/eventspictures")
	public String showEventsPictures(Model model) {
		List<Tabeventspicture> eventsPicturesList = mconnectDAO
				.getAllEventPictures();
		model.addAttribute("eventsPicturesList", eventsPicturesList);
		return "eventspictures";

	}

	@RequestMapping("/fromtheshows")
	public String showFromTheShows(Model model) {
		List<Tabfromtheshow> fromtheShowsList = mconnectDAO
				.getAllFromTheShows();
		model.addAttribute("fromtheShowsList", fromtheShowsList);
		return "fromtheshows";

	}

	@RequestMapping("/inthenews")
	public String showInTheNews(Model model) {
		List<Tabinthenew> inTheNewsList = mconnectDAO.getAllInTheNews();
		model.addAttribute("inTheNewsList", inTheNewsList);
		return "inthenews";

	}

	@RequestMapping("/mediafiles")
	public String showMediaFiles(Model model) {
		List<Tabmediafile> mediaFilesList = mconnectDAO.getAllMediaFiles();
		model.addAttribute("mediaFilesList", mediaFilesList);
		return "mediafiles";

	}

	@RequestMapping("/persons")
	public String showPersons(Model model) {
		List<Tabperson> personsList = mconnectDAO.getAllPerson();
		model.addAttribute("personsList", personsList);
		return "persons";
	}

	@RequestMapping("/content")
	public ModelAndView shoWContents() {

		ModelAndView mav = new ModelAndView("list");
		List<Category> categoryList = mconnectDAO.getAllCategories();
		List<Subcategory> subCategoryList = mconnectDAO.getAllSubCategories();
		List<Tabemployeecontribution> contributionList = mconnectDAO
				.getAllEmployeeContribution();
		List<Tabfromtheshow> fromtheShowsList = mconnectDAO
				.getAllFromTheShows();
		List<Tabinthenew> inTheNewsList = mconnectDAO.getAllInTheNews();
		List<Tabeventspicture> eventsPicturesList = mconnectDAO
				.getAllEventPictures();
		List<Tabmediafile> mediaFilesList = mconnectDAO.getAllMediaFiles();
		List<Tabperson> personsList = mconnectDAO.getAllPerson();

		mav.addObject("categoryList", categoryList);
		mav.addObject("subCategoryList", subCategoryList);
		mav.addObject("contributionList", contributionList);
		mav.addObject("fromtheShowsList", fromtheShowsList);
		mav.addObject("inTheNewsList", inTheNewsList);
		mav.addObject("eventsPicturesList", eventsPicturesList);
		mav.addObject("mediaFilesList", mediaFilesList);
		mav.addObject("personsList", personsList);
		return mav;

	}

	public ModelAndView deleteRecord() {
		String message = "Inside input form!";
		System.out.println(message);
		ModelAndView mav = new ModelAndView("input", "command", new InputForm());
		Map<String, String> categories = new HashMap<String, String>();
		List<Category> categoryList = mconnectDAO.getAllCategories();
		Iterator<Category> itr = categoryList.iterator();
		while (itr.hasNext()) {
			String text = itr.next().getCategoryName();
			categories.put(text, text);
		}
		mav.addObject("categoryMap", categories);
		return mav;

	}

	@RequestMapping("/input")
	public ModelAndView input() {
		String message = "Inside input form!";
		System.out.println(message);
		ModelAndView mav = new ModelAndView("input", "command", new InputForm());
		Map<Integer, String> categories = new HashMap<Integer, String>();
		Map<Integer, String> subCategories = new HashMap<Integer, String>();
		Map<Integer, String> persons = new HashMap<Integer, String>();
		Map<String, String> uplodedBy = new HashMap<String, String>();

		List<Category> categoryList = mconnectDAO.getAllCategories();
		List<Subcategory> subcategories = mconnectDAO.getAllSubCategories();
		List<Tabperson> personList = mconnectDAO.getAllPerson();
		Iterator<Category> itr = categoryList.iterator();
		Iterator<Subcategory> itrSub = subcategories.iterator();
		Iterator<Tabperson> itrPerson = personList.iterator();
		while (itr.hasNext()) {
			Category category = itr.next();
			Integer catId = category.getCategoryId();
			String catName = category.getCategoryName();
			categories.put(catId, catName);
		}

		while (itrSub.hasNext()) {
			Subcategory subcategory = itrSub.next();
			Integer subId = subcategory.getSubcategoryId();
			String subValue = subcategory.getSubCategoryTitle();
			subCategories.put(subId, subValue);
		}

		while (itrPerson.hasNext()) {
			Tabperson person = itrPerson.next();
			String userName = person.getUsername();
			Integer priority = person.getPriority();
			String priorityVal = new Integer(person.getPriority()).toString();
			persons.put(priority, priorityVal);
			uplodedBy.put(userName, userName);
		}
		mav.addObject("categoryMap", categories);
		mav.addObject("subCategoryMap", subCategories);
		mav.addObject("persons", persons);
		mav.addObject("uplodedBy", uplodedBy);
		return mav;

	}

	@RequestMapping("/inputSubCategory")
	public String inputSubCategory(Map model, HttpServletRequest request) {
		SubCategoryForm subCategoryForm = new SubCategoryForm();

		Map<Integer, String> persons = new HashMap<Integer, String>();
		Map<String, String> uplodedBy = new HashMap<String, String>();
		List<Tabperson> personList = mconnectDAO.getAllPerson();
		Iterator<Tabperson> itrPerson = personList.iterator();

		while (itrPerson.hasNext()) {
			Tabperson person = itrPerson.next();
			String userName = person.getUsername();
			uplodedBy.put(userName, userName);

		}
		model.put("subCategoryForm", subCategoryForm);
		model.put("uplodedBy", uplodedBy);
		return "subcategory-input";

	}

	@RequestMapping(value = "/saveDetails", method = RequestMethod.POST)
	public @ResponseBody
	String saveDetails(@ModelAttribute("inputForm") InputForm inputForm,
			HttpServletRequest request) {

		String userName;
		String message = "Inside input form post method!";
		System.out.println(inputForm.getCategories());

		System.out.println(inputForm.getTitle());

		if (inputForm.getUploaduser().equals("NONE")) {
			userName = (String) request.getSession().getAttribute(
					"enterpriseid");
		} else {
			userName = inputForm.getUploaduser();
		}
		String status = mconnectDAO.insert(inputForm.getCategories(),
				inputForm.getTitle(), inputForm.getFname(),
				inputForm.getLname(), inputForm.getDesignation(),
				inputForm.getSubCategory(), inputForm.getDescription(),
				fileLoc, inputForm.getVideo(), inputForm.getAudio(), userName,
				inputForm.getPriority(), inputForm.getUploadType());

		if (status.equals("success")) {
			status = "Details Saved Successfully";
		}
		return status;

	}

	@RequestMapping(value = "/saveSubCategoryDetails", method = RequestMethod.POST)
	public @ResponseBody
	String saveSubCategoryDetails(
			@ModelAttribute("subCategoryForm") SubCategoryForm subCategoryForm) {

		String status = mconnectDAO.insertSubCategory(
				subCategoryForm.getTitle(), subCategoryForm.getFileName(),
				subCategoryForm.getUploadType(),
				subCategoryForm.getUploaduser(),
				subCategoryForm.getCategoryid());
		if (status.equals("success")) {
			status = "Details Saved Successfully";
		}
		return status;

	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody
	String upload(MultipartHttpServletRequest request,
			HttpServletResponse response) {

		FileOutputStream fop = null;
		System.out.println("test");
		Iterator<String> itr = request.getFileNames();
		MultipartFile mpf = request.getFile(itr.next());

		String status;

		// copy file to location
		fileLoc = System.getProperty("user.dir") + "\\"
				+ mpf.getOriginalFilename();
		File file = new File(fileLoc);
		try {
			fop = new FileOutputStream(file);
			byte[] contentInBytes = mpf.getBytes();

			fop.write(contentInBytes);
			fop.flush();
			fop.close();
			status = mpf.getOriginalFilename() + " uploaded";

		} catch (IOException e) {
			status = "Error in uploading file";
		} finally {
			try {
				if (fop != null) {
					fop.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return status;

	}

}
