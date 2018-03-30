package com.redframework.ws.persisted;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * See package.html.
 * @author RedBelette
 * @since 1.0.0.
 */
@Entity
@Table(name="document")
public class Document {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="document_id")
    private int technicalId;
    @Column(nullable=false)
    private String id;
    @Column(nullable=false)
    private String name;
    @Lob
    @Column(nullable=false)
    private String description;
    @ManyToOne(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
    @JoinColumn(name="project_id")
    private Project project;
    @OneToMany(mappedBy="document")
    private List<HTML> htmls = new ArrayList<>();
    @OneToMany(mappedBy="document")
    private List<Function> functions = new ArrayList<>();
    
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
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public Project getProject() {
        return project;
    }
    
    public void setProject(Project project) {
        this.project = project;
    }
    
    public List<HTML> getHtmls() {
        return htmls;
    }
    
    public void addHtml(HTML html) {
        this.htmls.add(html);
    }
    
    public List<Function> getFunctions() {
        return functions;
    }
    
    public void addFunction(Function function) {
        this.functions.add(function);
    }
    
}
