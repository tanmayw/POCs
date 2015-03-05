package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the test2 database table.
 * 
 */
@Entity
public class Test2 implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int test4;

	private String test5;

	//bi-directional many-to-one association to Test1
	@ManyToOne
	@JoinColumn(name="test1")
	private Test1 test1Bean;

	public Test2() {
	}

	public int getTest4() {
		return this.test4;
	}

	public void setTest4(int test4) {
		this.test4 = test4;
	}

	public String getTest5() {
		return this.test5;
	}

	public void setTest5(String test5) {
		this.test5 = test5;
	}

	public Test1 getTest1Bean() {
		return this.test1Bean;
	}

	public void setTest1Bean(Test1 test1Bean) {
		this.test1Bean = test1Bean;
	}

}