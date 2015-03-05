package com.acc.mconnect.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the test1 database table.
 * 
 */
@Entity
public class Test1 implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int test1;

	private String test3;

	//bi-directional many-to-one association to Test2
	@OneToMany(mappedBy="test1Bean")
	private List<Test2> test2s;

	public Test1() {
	}

	public int getTest1() {
		return this.test1;
	}

	public void setTest1(int test1) {
		this.test1 = test1;
	}

	public String getTest3() {
		return this.test3;
	}

	public void setTest3(String test3) {
		this.test3 = test3;
	}

	public List<Test2> getTest2s() {
		return this.test2s;
	}

	public void setTest2s(List<Test2> test2s) {
		this.test2s = test2s;
	}

	public Test2 addTest2(Test2 test2) {
		getTest2s().add(test2);
		test2.setTest1Bean(this);

		return test2;
	}

	public Test2 removeTest2(Test2 test2) {
		getTest2s().remove(test2);
		test2.setTest1Bean(null);

		return test2;
	}

}