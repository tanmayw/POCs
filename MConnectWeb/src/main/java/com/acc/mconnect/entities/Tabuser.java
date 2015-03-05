package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;



/**
 * The persistent class for the tabuser database table.
 * 
 */
@Entity
public class Tabuser implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int userId;

	private String isTermsAccepted;

	private String token;

	private String userName;

	private String userType;

	public Tabuser() {
	}

	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getIsTermsAccepted() {
		return this.isTermsAccepted;
	}

	public void setIsTermsAccepted(String isTermsAccepted) {
		this.isTermsAccepted = isTermsAccepted;
	}

	public String getToken() {
		return this.token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}