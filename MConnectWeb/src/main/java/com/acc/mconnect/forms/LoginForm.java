package com.acc.mconnect.forms;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class LoginForm {
	 @NotEmpty(message = "{loginForm.enterpriseid}")  
	
	private String enterpriseid;
	 @NotEmpty(message = "{loginForm.password}")    
	private String password;

	public String getEnterpriseid() {
		return enterpriseid;
	}

	public void setEnterpriseid(String enterpriseid) {
		this.enterpriseid = enterpriseid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
