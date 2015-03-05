package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tabemployeecontribution database table.
 * 
 */
@Entity
public class Tabemployeecontribution implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int employeeContributionId;

	private String employeeContributionContent;

	@Temporal(TemporalType.DATE)
	private Date employeeContributionDate;

	private String employeeContributionimageurl;

	private String employeeContributionTitle;

	//bi-directional many-to-one association to Subcategory
	@ManyToOne
	@JoinColumn(name="subCategoryId")
	private Subcategory subcategory;

	public Tabemployeecontribution() {
	}

	public int getEmployeeContributionId() {
		return this.employeeContributionId;
	}

	public void setEmployeeContributionId(int employeeContributionId) {
		this.employeeContributionId = employeeContributionId;
	}

	public String getEmployeeContributionContent() {
		return this.employeeContributionContent;
	}

	public void setEmployeeContributionContent(String employeeContributionContent) {
		this.employeeContributionContent = employeeContributionContent;
	}

	public Date getEmployeeContributionDate() {
		return this.employeeContributionDate;
	}

	public void setEmployeeContributionDate(Date employeeContributionDate) {
		this.employeeContributionDate = employeeContributionDate;
	}

	public String getEmployeeContributionimageurl() {
		return this.employeeContributionimageurl;
	}

	public void setEmployeeContributionimageurl(String employeeContributionimageurl) {
		this.employeeContributionimageurl = employeeContributionimageurl;
	}

	public String getEmployeeContributionTitle() {
		return this.employeeContributionTitle;
	}

	public void setEmployeeContributionTitle(String employeeContributionTitle) {
		this.employeeContributionTitle = employeeContributionTitle;
	}

	public Subcategory getSubcategory() {
		return this.subcategory;
	}

	public void setSubcategory(Subcategory subcategory) {
		this.subcategory = subcategory;
	}

}