package com.redframework.ws.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * See package.html.
 * @author RedBelette
 * @since 1.0.0.
 */
public class ProjectDto {
    
    private String id;
    private String name;
    private String currentVersion;
    private String description;
    private List<DocumentDto> documents = new ArrayList<>();
    
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
    
    public List<DocumentDto> getDocuments() {
        return documents;
    }
    
    public void addDocument(DocumentDto document) {
        this.documents.add(document);
    }
}
