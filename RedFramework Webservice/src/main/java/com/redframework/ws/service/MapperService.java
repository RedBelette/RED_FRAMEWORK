package com.redframework.ws.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.redframework.ws.dto.DocumentDetailDto;
import com.redframework.ws.dto.DocumentDto;
import com.redframework.ws.dto.FunctionDto;
import com.redframework.ws.dto.NewsDto;
import com.redframework.ws.dto.ParameterDto;
import com.redframework.ws.dto.ProjectDto;
import com.redframework.ws.persisted.Document;
import com.redframework.ws.persisted.Function;
import com.redframework.ws.persisted.News;
import com.redframework.ws.persisted.Project;

/**
 * Map the persistent objects to DTO and inverse.
 * @author RedBelette
 * @since 1.0.0.
 */
@Service
public class MapperService {

    public List<ProjectDto> mapApiProjects(List<Project> projects) {
        List<ProjectDto> projectsDto = new ArrayList<>();
        projects.forEach(p -> projectsDto.add(mapApiProject(p)));
        return projectsDto;
    }
    
    public ProjectDto mapApiProject(Project project) {
        ProjectDto projectDto = new ProjectDto();
        projectDto.setId(project.getId());
        projectDto.setName(project.getName());
        projectDto.setDescription(project.getDescription());
        projectDto.setCurrentVersion(project.getCurrentVersion());
        project.getDocuments().forEach(d -> {
            DocumentDto documentDto = new DocumentDto();
            documentDto.setId(d.getId());
            documentDto.setName(d.getName());
            documentDto.setDescription(d.getDescription());
            // Reference to the parent forbidden: documentDto.setProject(projectDto);
            // HTML and Functions references not needed by the front-end
            projectDto.addDocument(documentDto);
        });
        return projectDto;
    }
    
    public DocumentDetailDto mapApiDocumentDetail(Document document) {
        DocumentDetailDto documentDetailDto = new DocumentDetailDto();
        documentDetailDto.setId(document.getId());
        documentDetailDto.setName(document.getName());
        documentDetailDto.setDescription(document.getDescription());
        ProjectDto projectDto = new ProjectDto();
        projectDto.setId(document.getProject().getId());
        projectDto.setName(document.getProject().getName());
        projectDto.setCurrentVersion(document.getProject().getCurrentVersion());
        projectDto.setDescription(document.getProject().getDescription());
        documentDetailDto.setProject(projectDto);
        document.getFunctions().forEach(f -> {
            FunctionDto functionDto = new FunctionDto();
            functionDto.setName(f.getName());
            functionDto.setDescription(f.getDescription());
            functionDto.setReturnType(f.getReturnType());
            f.getCommonUses().forEach(c -> {
                c.getCodes().forEach(code -> {
                    functionDto.addCommonUse(code.getValue());
                });
            });
            f.getParameters().forEach(p -> {
                ParameterDto parameterDto = new ParameterDto();
                parameterDto.setName(p.getName());
                parameterDto.setType(p.getType());
                functionDto.addParameter(parameterDto);
            });
            documentDetailDto.addFunction(functionDto);
        });
        document.getHtmls().forEach(h -> {
            h.getCodes().forEach(c -> {
                documentDetailDto.addHtml(c.getValue());
            });
        });
        return documentDetailDto;
    }
    
    public List<String> mapApiFunctionNames(List<Function> functions) {
        List<String> functionStrings = new  ArrayList<>();
        functions.forEach(f -> {
            functionStrings.add(f.getName());
        });
        return functionStrings;
    }
    
    public List<NewsDto> mapApiNews(List<News> news) {
    	List<NewsDto> newsDto = new ArrayList<>();
    	news.forEach(n -> {
    		NewsDto d = new NewsDto();
    		d.setAuthor(n.getAuthor());
    		d.setDate(n.getDate());
    		d.setHtml(n.getHtml());
    		d.setId(n.getId());
    		d.setTitle(n.getTitle());
    		newsDto.add(d);
    	});
    	return newsDto;
    }
    
    
}
