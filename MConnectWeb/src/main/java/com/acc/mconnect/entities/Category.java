package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the category database table.
 * 
 */
@Entity
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int categoryId;

	private String categoryDesc;

	private String categoryimagename;

	private String categoryName;

	//bi-directional many-to-one association to Favouritecategory
	@OneToMany(mappedBy="category")
	private List<Favouritecategory> favouritecategories;

	//bi-directional many-to-one association to Subcategory
	@OneToMany(mappedBy="category")
	private List<Subcategory> subcategories;

	public Category() {
	}

	public int getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryDesc() {
		return this.categoryDesc;
	}

	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}

	public String getCategoryimagename() {
		return this.categoryimagename;
	}

	public void setCategoryimagename(String categoryimagename) {
		this.categoryimagename = categoryimagename;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<Favouritecategory> getFavouritecategories() {
		return this.favouritecategories;
	}

	public void setFavouritecategories(List<Favouritecategory> favouritecategories) {
		this.favouritecategories = favouritecategories;
	}

	public Favouritecategory addFavouritecategory(Favouritecategory favouritecategory) {
		getFavouritecategories().add(favouritecategory);
		favouritecategory.setCategory(this);

		return favouritecategory;
	}

	public Favouritecategory removeFavouritecategory(Favouritecategory favouritecategory) {
		getFavouritecategories().remove(favouritecategory);
		favouritecategory.setCategory(null);

		return favouritecategory;
	}

	public List<Subcategory> getSubcategories() {
		return this.subcategories;
	}

	public void setSubcategories(List<Subcategory> subcategories) {
		this.subcategories = subcategories;
	}

	public Subcategory addSubcategory(Subcategory subcategory) {
		getSubcategories().add(subcategory);
		subcategory.setCategory(this);

		return subcategory;
	}

	public Subcategory removeSubcategory(Subcategory subcategory) {
		getSubcategories().remove(subcategory);
		subcategory.setCategory(null);

		return subcategory;
	}

}