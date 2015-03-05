package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the favouritecategory database table.
 * 
 */
@Entity
public class Favouritecategory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int favouriteCategoryId;

	@Temporal(TemporalType.DATE)
	private Date lastDate;

	//bi-directional many-to-one association to Tabperson
	@ManyToOne
	@JoinColumn(name="personId")
	private Tabperson tabperson;

	//bi-directional many-to-one association to Category
	@ManyToOne
	@JoinColumn(name="categoryId")
	private Category category;

	public Favouritecategory() {
	}

	public int getFavouriteCategoryId() {
		return this.favouriteCategoryId;
	}

	public void setFavouriteCategoryId(int favouriteCategoryId) {
		this.favouriteCategoryId = favouriteCategoryId;
	}

	public Date getLastDate() {
		return this.lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	public Tabperson getTabperson() {
		return this.tabperson;
	}

	public void setTabperson(Tabperson tabperson) {
		this.tabperson = tabperson;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}