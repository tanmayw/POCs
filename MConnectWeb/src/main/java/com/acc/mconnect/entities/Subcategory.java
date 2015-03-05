package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the subcategory database table.
 * 
 */
@Entity
public class Subcategory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="subcategoryId")
	private int subcategoryId;

	@Temporal(TemporalType.DATE)
	private Date subCategoryDate;

	private String subCategoryImgUrl;

	private String subCategoryTitle;

	//bi-directional many-to-one association to Tabemployeecontribution
	@OneToMany(mappedBy="subcategory")
	private List<Tabemployeecontribution> tabemployeecontributions;

	//bi-directional many-to-one association to Tabeventspicture
	@OneToMany(mappedBy="subcategory")
	private List<Tabeventspicture> tabeventspictures;

	//bi-directional many-to-one association to Tabfromtheshow
	@OneToMany(mappedBy="subcategory")
	private List<Tabfromtheshow> tabfromtheshows;

	//bi-directional many-to-one association to Tabinthenew
	@OneToMany(mappedBy="subcategory")
	private List<Tabinthenew> tabinthenews;

	//bi-directional many-to-one association to Category
	@ManyToOne
	@JoinColumn(name="categoryId")
	private Category category;

	public Subcategory() {
	}

	

	


	public int getSubcategoryId() {
		return subcategoryId;
	}






	public void setSubcategoryId(int subcategoryId) {
		this.subcategoryId = subcategoryId;
	}






	public static long getSerialversionuid() {
		return serialVersionUID;
	}






	public Date getSubCategoryDate() {
		return this.subCategoryDate;
	}

	public void setSubCategoryDate(Date subCategoryDate) {
		this.subCategoryDate = subCategoryDate;
	}

	public String getSubCategoryImgUrl() {
		return this.subCategoryImgUrl;
	}

	public void setSubCategoryImgUrl(String subCategoryImgUrl) {
		this.subCategoryImgUrl = subCategoryImgUrl;
	}

	public String getSubCategoryTitle() {
		return this.subCategoryTitle;
	}

	public void setSubCategoryTitle(String subCategoryTitle) {
		this.subCategoryTitle = subCategoryTitle;
	}

	public List<Tabemployeecontribution> getTabemployeecontributions() {
		return this.tabemployeecontributions;
	}

	public void setTabemployeecontributions(List<Tabemployeecontribution> tabemployeecontributions) {
		this.tabemployeecontributions = tabemployeecontributions;
	}

	public Tabemployeecontribution addTabemployeecontribution(Tabemployeecontribution tabemployeecontribution) {
		getTabemployeecontributions().add(tabemployeecontribution);
		tabemployeecontribution.setSubcategory(this);

		return tabemployeecontribution;
	}

	public Tabemployeecontribution removeTabemployeecontribution(Tabemployeecontribution tabemployeecontribution) {
		getTabemployeecontributions().remove(tabemployeecontribution);
		tabemployeecontribution.setSubcategory(null);

		return tabemployeecontribution;
	}

	public List<Tabeventspicture> getTabeventspictures() {
		return this.tabeventspictures;
	}

	public void setTabeventspictures(List<Tabeventspicture> tabeventspictures) {
		this.tabeventspictures = tabeventspictures;
	}

	public Tabeventspicture addTabeventspicture(Tabeventspicture tabeventspicture) {
		getTabeventspictures().add(tabeventspicture);
		tabeventspicture.setSubcategory(this);

		return tabeventspicture;
	}

	public Tabeventspicture removeTabeventspicture(Tabeventspicture tabeventspicture) {
		getTabeventspictures().remove(tabeventspicture);
		tabeventspicture.setSubcategory(null);

		return tabeventspicture;
	}

	public List<Tabfromtheshow> getTabfromtheshows() {
		return this.tabfromtheshows;
	}

	public void setTabfromtheshows(List<Tabfromtheshow> tabfromtheshows) {
		this.tabfromtheshows = tabfromtheshows;
	}

	public Tabfromtheshow addTabfromtheshow(Tabfromtheshow tabfromtheshow) {
		getTabfromtheshows().add(tabfromtheshow);
		tabfromtheshow.setSubcategory(this);

		return tabfromtheshow;
	}

	public Tabfromtheshow removeTabfromtheshow(Tabfromtheshow tabfromtheshow) {
		getTabfromtheshows().remove(tabfromtheshow);
		tabfromtheshow.setSubcategory(null);

		return tabfromtheshow;
	}

	public List<Tabinthenew> getTabinthenews() {
		return this.tabinthenews;
	}

	public void setTabinthenews(List<Tabinthenew> tabinthenews) {
		this.tabinthenews = tabinthenews;
	}

	public Tabinthenew addTabinthenew(Tabinthenew tabinthenew) {
		getTabinthenews().add(tabinthenew);
		tabinthenew.setSubcategory(this);

		return tabinthenew;
	}

	public Tabinthenew removeTabinthenew(Tabinthenew tabinthenew) {
		getTabinthenews().remove(tabinthenew);
		tabinthenew.setSubcategory(null);

		return tabinthenew;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}