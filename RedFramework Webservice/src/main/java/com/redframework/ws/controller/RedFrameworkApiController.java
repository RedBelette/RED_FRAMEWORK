package com.redframework.ws.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.redframework.ws.dto.DocumentDetailDto;
import com.redframework.ws.dto.NewsDto;
import com.redframework.ws.dto.ProjectDto;
import com.redframework.ws.service.RedFrameworkApiService;

/**
 * The entry point of the REST web service.
 * TODO: Security and errors managements
 * @author RedBelette
 * @since 1.0.0.
 */
@RestController("webapi")
public class RedFrameworkApiController {
    
    @Autowired
    private RedFrameworkApiService codewikiService;
    
    @CrossOrigin
    @RequestMapping(value="api/projects", method=RequestMethod.GET) 
    public ResponseEntity<List<ProjectDto>> getProjects()  {
        return ResponseEntity.ok(codewikiService.getProjects());
    }
    
    @CrossOrigin
    @RequestMapping(value="api/project-detail/{id}", method=RequestMethod.GET) 
    public ResponseEntity<ProjectDto> getProjectDetail(@PathVariable("id") String id)  {
        return ResponseEntity.ok(codewikiService.getProject(id));
    }
    
    @CrossOrigin
    @RequestMapping(value="api/document-detail/{id}", method=RequestMethod.GET) 
    public ResponseEntity<DocumentDetailDto> getDocumentDetail(@PathVariable("id") String id)  {
        return ResponseEntity.ok(codewikiService.getDocument(id));
    }
    
    @CrossOrigin
    @RequestMapping(value="api/functions-names", method=RequestMethod.GET) 
    public ResponseEntity<List<String>> getFunctionNames()  {
        return ResponseEntity.ok(codewikiService.getFunctionNames());
    }
    
    @CrossOrigin
    @RequestMapping(value="api/news", method=RequestMethod.GET) 
    public ResponseEntity<List<NewsDto>> getNews()  {
        return ResponseEntity.ok(codewikiService.getNews());
    }
    
}
