package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the tabperson database table.
 * 
 */
@Entity
public class Tabperson implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int personId;

	private String designation;
	@Column(name="fName")
	private String firstName;

	private String hobbydesc;

	private String imgLoc;
	@Column(name="lName")
	private String lastName;

	private int priority;

	private String username;

	//bi-directional many-to-one association to Favouritecategory
	@OneToMany(mappedBy="tabperson")
	private List<Favouritecategory> favouritecategories;

	public Tabperson() {
	}

	public int getPersonId() {
		return this.personId;
	}

	public void setPersonId(int personId) {
		this.personId = personId;
	}

	public String getDesignation() {
		return this.designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	

	public String getHobbydesc() {
		return this.hobbydesc;
	}

	public void setHobbydesc(String hobbydesc) {
		this.hobbydesc = hobbydesc;
	}

	public String getImgLoc() {
		return this.imgLoc;
	}

	public void setImgLoc(String imgLoc) {
		this.imgLoc = imgLoc;
	}

	

	public int getPriority() {
		return this.priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Favouritecategory> getFavouritecategories() {
		return this.favouritecategories;
	}

	public void setFavouritecategories(List<Favouritecategory> favouritecategories) {
		this.favouritecategories = favouritecategories;
	}

	public Favouritecategory addFavouritecategory(Favouritecategory favouritecategory) {
		getFavouritecategories().add(favouritecategory);
		favouritecategory.setTabperson(this);

		return favouritecategory;
	}

	public Favouritecategory removeFavouritecategory(Favouritecategory favouritecategory) {
		getFavouritecategories().remove(favouritecategory);
		favouritecategory.setTabperson(null);

		return favouritecategory;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

}