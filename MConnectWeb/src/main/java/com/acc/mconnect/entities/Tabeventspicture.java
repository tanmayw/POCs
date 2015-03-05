package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tabeventspictures database table.
 * 
 */
@Entity
@Table(name="tabeventspictures")
public class Tabeventspicture implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int eventId;

	private String eventContent;

	@Temporal(TemporalType.DATE)
	private Date eventDate;

	private String eventimageurl;

	private String eventTitle;

	//bi-directional many-to-one association to Subcategory
	@ManyToOne
	@JoinColumn(name="subCategoryId")
	private Subcategory subcategory;

	public Tabeventspicture() {
	}

	public int getEventId() {
		return this.eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getEventContent() {
		return this.eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public Date getEventDate() {
		return this.eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventimageurl() {
		return this.eventimageurl;
	}

	public void setEventimageurl(String eventimageurl) {
		this.eventimageurl = eventimageurl;
	}

	public String getEventTitle() {
		return this.eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public Subcategory getSubcategory() {
		return this.subcategory;
	}

	public void setSubcategory(Subcategory subcategory) {
		this.subcategory = subcategory;
	}

}