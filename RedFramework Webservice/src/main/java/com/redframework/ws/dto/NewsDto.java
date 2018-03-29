package com.redframework.ws.dto;

/**
 * @author RedBelette
 * @since 1.0.0
 */
public class NewsDto {

	public String id;
	public String title;
	public String author;
	public String date;
	public String html;
	
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
