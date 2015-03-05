package com.programmingfree.springservice;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="task_list")
public class Task {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="task_id")
	private int id;
	
	@Column(name="task_name")
	private String taskName;
	
	@Column(name="task_description")
	private String taskDescription;
	
	@Column(name="task_priority")
	private String taskPriority;
	
	@Column(name="task_status")
	private String taskStatus;
	
	@Column(name="task_start_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date task_start_time;
	
	@Column(name="task_end_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date task_end_time;
	
	@Column(name="task_archived")
	private int taskArchived = 0;
	
	 @ManyToOne
	    @JoinColumn(name="user_id")
	    private User userId;
	
	
	public int getTaskId() {
		return id;
	}

	public void setTaskId(int taskId) {
		this.id = taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getTaskDescription() {
		return taskDescription;
	}

	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}

	public String getTaskPriority() {
		return taskPriority;
	}

	public void setTaskPriority(String taskPriority) {
		this.taskPriority = taskPriority;
	}

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}

	
	public Date getTask_start_time() {
		return task_start_time;
	}

	public void setTask_start_time(Date task_start_time) {
		this.task_start_time = task_start_time;
	}

	public Date getTask_end_time() {
		return task_end_time;
	}

	public void setTask_end_time(Date task_end_time) {
		this.task_end_time = task_end_time;
	}

	
	public int getTaskArchived() {
		return taskArchived;
	}

	public void setTaskArchived(int taskArchived) {
		this.taskArchived = taskArchived;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}


	
	


	

}

