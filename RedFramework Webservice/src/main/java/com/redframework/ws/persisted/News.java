package com.redframework.ws.persisted;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="news")
public class News {
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="news_id")
	private int technicalId;
	@Column(nullable=false)
	private String id;
	@Column(nullable=false)
	private String title;
	@Column(nullable=false)
	private String author;
	@Column(nullable=false)
	private String date;
	@Lob
	@Column(nullable=false)
	private String html;
	
	public int getTechnicalId() {
		return technicalId;
	}
	
	public void setTechnicalId(int technicalId) {
		this.technicalId = technicalId;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getHtml() {
		return html;
	}
	
	public void setHtml(String html) {
		this.html = html;
	}
}
