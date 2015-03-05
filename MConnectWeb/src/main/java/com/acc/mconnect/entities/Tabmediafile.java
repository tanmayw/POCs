package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tabmediafile database table.
 * 
 */
@Entity
public class Tabmediafile implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int mediaFileId;

	private int categoryId;

	private String mediaFileDesc;

	private String mediafileimage;

	private String mediaFileName;

	private String mediaFileType;

	@Temporal(TemporalType.DATE)
	private Date mediauploadDate;

	private String mediaURL;

	private String username;

	public Tabmediafile() {
	}

	public int getMediaFileId() {
		return this.mediaFileId;
	}

	public void setMediaFileId(int mediaFileId) {
		this.mediaFileId = mediaFileId;
	}

	public int getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getMediaFileDesc() {
		return this.mediaFileDesc;
	}

	public void setMediaFileDesc(String mediaFileDesc) {
		this.mediaFileDesc = mediaFileDesc;
	}

	public String getMediafileimage() {
		return this.mediafileimage;
	}

	public void setMediafileimage(String mediafileimage) {
		this.mediafileimage = mediafileimage;
	}

	public String getMediaFileName() {
		return this.mediaFileName;
	}

	public void setMediaFileName(String mediaFileName) {
		this.mediaFileName = mediaFileName;
	}

	public String getMediaFileType() {
		return this.mediaFileType;
	}

	public void setMediaFileType(String mediaFileType) {
		this.mediaFileType = mediaFileType;
	}

	public Date getMediauploadDate() {
		return this.mediauploadDate;
	}

	public void setMediauploadDate(Date mediauploadDate) {
		this.mediauploadDate = mediauploadDate;
	}

	public String getMediaURL() {
		return this.mediaURL;
	}

	public void setMediaURL(String mediaURL) {
		this.mediaURL = mediaURL;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}