package com.redframework.ws.persisted;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * See package.html.
 * @author RedBelette
 * @since 1.0.0.
 */
@Entity
@Table(name="project")
public class Project {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="project_id")
    private int technicalId;
    @Column(nullable=false)
    private String id;
    @Column(nullable=false)
    private String name;
    @Column(nullable=false)
    private String currentVersion;
    @Column(nullable=false)
    private String description;
    @OneToMany(mappedBy="project")
    private List<Document> documents = new ArrayList<>();
    
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
    
    public String getCurrentVersion() {
        return currentVersion;
    }
    
    public void setCurrentVersion(String currentVersion) {
        this.currentVersion = currentVersion;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public List<Document> getDocuments() {
        return Collections.unmodifiableList(documents);
    }
    
    public void addDocument(Document document) {
        this.documents.add(document);
    }
    
}
