package com.redframework.ws.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * See package.html.
 * @author RedBelette
 * @since 1.0.0.
 */
public class DocumentDetailDto {
    
    private String id;
    private String name;
    private String description;
    private ProjectDto project;
    private List<String> htmls = new ArrayList<>();
    private List<FunctionDto> functions = new ArrayList<>();
    
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
    
    public ProjectDto getProject() {
        return project;
    }
    
    public void setProject(ProjectDto project) {
        this.project = project;
    }
    
    public List<String> getHtmls() {
        return htmls;
    }
    
    public void addHtml(String html) {
        this.htmls.add(html);
    }
    
    public List<FunctionDto> getFunctions() {
        return functions;
    }
    
    public void addFunction(FunctionDto function) {
        this.functions.add(function);
    }
    
}
