package com.redframework.ws.service;

import java.util.List;

import com.redframework.ws.dto.DocumentDetailDto;
import com.redframework.ws.dto.NewsDto;
import com.redframework.ws.dto.ProjectDto;

/**
 * All the necessary methods interface for the core service.
 * @author RedBelette
 * @since 1.0.0.
 */
public interface RedFrameworkApiService {
    
    List<ProjectDto> getProjects();
    
    ProjectDto getProject(String id);
    
    DocumentDetailDto getDocument(String id);
    
    List<String> getFunctionNames();
    
    List<NewsDto> getNews();
    
}
