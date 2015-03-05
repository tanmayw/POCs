package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tabinthenews database table.
 * 
 */
@Entity
@Table(name="tabinthenews")
public class Tabinthenew implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int inTheNewsId;

	private String inTheNewsContent;

	@Temporal(TemporalType.DATE)
	private Date inTheNewsDate;

	private String inthenewsimageurl;

	private String inTheNewsTitle;

	//bi-directional many-to-one association to Subcategory
	@ManyToOne
	@JoinColumn(name="subCategoryId")
	private Subcategory subcategory;

	public Tabinthenew() {
	}

	public int getInTheNewsId() {
		return this.inTheNewsId;
	}

	public void setInTheNewsId(int inTheNewsId) {
		this.inTheNewsId = inTheNewsId;
	}

	public String getInTheNewsContent() {
		return this.inTheNewsContent;
	}

	public void setInTheNewsContent(String inTheNewsContent) {
		this.inTheNewsContent = inTheNewsContent;
	}

	public Date getInTheNewsDate() {
		return this.inTheNewsDate;
	}

	public void setInTheNewsDate(Date inTheNewsDate) {
		this.inTheNewsDate = inTheNewsDate;
	}

	public String getInthenewsimageurl() {
		return this.inthenewsimageurl;
	}

	public void setInthenewsimageurl(String inthenewsimageurl) {
		this.inthenewsimageurl = inthenewsimageurl;
	}

	public String getInTheNewsTitle() {
		return this.inTheNewsTitle;
	}

	public void setInTheNewsTitle(String inTheNewsTitle) {
		this.inTheNewsTitle = inTheNewsTitle;
	}

	public Subcategory getSubcategory() {
		return this.subcategory;
	}

	public void setSubcategory(Subcategory subcategory) {
		this.subcategory = subcategory;
	}

}