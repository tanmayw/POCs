package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tabfromtheshows database table.
 * 
 */
@Entity
@Table(name="tabfromtheshows")
public class Tabfromtheshow implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int fromTheShowsId;

	private String fromTheShowsContent;

	@Temporal(TemporalType.DATE)
	private Date fromTheShowsDate;

	private String fromtheshowsimageurl;

	private String fromTheShowsTitle;

	//bi-directional many-to-one association to Subcategory
	@ManyToOne
	@JoinColumn(name="subCategoryId")
	private Subcategory subcategory;

	public Tabfromtheshow() {
	}

	public int getFromTheShowsId() {
		return this.fromTheShowsId;
	}

	public void setFromTheShowsId(int fromTheShowsId) {
		this.fromTheShowsId = fromTheShowsId;
	}

	public String getFromTheShowsContent() {
		return this.fromTheShowsContent;
	}

	public void setFromTheShowsContent(String fromTheShowsContent) {
		this.fromTheShowsContent = fromTheShowsContent;
	}

	public Date getFromTheShowsDate() {
		return this.fromTheShowsDate;
	}

	public void setFromTheShowsDate(Date fromTheShowsDate) {
		this.fromTheShowsDate = fromTheShowsDate;
	}

	public String getFromtheshowsimageurl() {
		return this.fromtheshowsimageurl;
	}

	public void setFromtheshowsimageurl(String fromtheshowsimageurl) {
		this.fromtheshowsimageurl = fromtheshowsimageurl;
	}

	public String getFromTheShowsTitle() {
		return this.fromTheShowsTitle;
	}

	public void setFromTheShowsTitle(String fromTheShowsTitle) {
		this.fromTheShowsTitle = fromTheShowsTitle;
	}

	public Subcategory getSubcategory() {
		return this.subcategory;
	}

	public void setSubcategory(Subcategory subcategory) {
		this.subcategory = subcategory;
	}

}