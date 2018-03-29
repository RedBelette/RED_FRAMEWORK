package com.redframework.ws.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.redframework.ws.dto.DocumentDetailDto;
import com.redframework.ws.dto.NewsDto;
import com.redframework.ws.dto.ProjectDto;
import com.redframework.ws.persisted.Document;
import com.redframework.ws.persisted.Function;
import com.redframework.ws.persisted.News;
import com.redframework.ws.persisted.Project;


/**
 * All the necessary methods for the core service implementation.
 * @author RedBelette
 * @since 1.0.0.
 */
@Service
@Qualifier
@Primary
public class RedFrameworkApiServiceImpl implements RedFrameworkApiService {
    
    @PersistenceContext
    private EntityManager em;
    
    @Autowired
    private MapperService mapperService;
    
    @Override
    public List<ProjectDto> getProjects() {
        CriteriaQuery<Project> criteriaQuery = em.getCriteriaBuilder().createQuery(Project.class);
        Root<Project> from = criteriaQuery.from(Project.class);
        criteriaQuery.select(from);
        TypedQuery<Project> typedQuery = em.createQuery(criteriaQuery);
        List<Project> projects = typedQuery.getResultList();
        return mapperService.mapApiProjects(projects);
    }
    
    @Override
    public ProjectDto getProject(String id) {
        CriteriaQuery<Project> criteriaQuery = em.getCriteriaBuilder().createQuery(Project.class);
        Root<Project> from = criteriaQuery.from(Project.class);
        criteriaQuery.select(from);
        criteriaQuery.where(em.getCriteriaBuilder().equal(from.get("id"), id));
        TypedQuery<Project> typedQuery = em.createQuery(criteriaQuery);
        Project project = typedQuery.getSingleResult();
        return mapperService.mapApiProject(project);
    }
    
    @Override
    public DocumentDetailDto getDocument(String id) {
        CriteriaQuery<Document> criteriaQuery = em.getCriteriaBuilder().createQuery(Document.class);
        Root<Document> from = criteriaQuery.from(Document.class);
        criteriaQuery.select(from);
        criteriaQuery.where(em.getCriteriaBuilder().equal(from.get("id"), id));
        TypedQuery<Document> typedQuery = em.createQuery(criteriaQuery);
        Document document = typedQuery.getSingleResult();
        return mapperService.mapApiDocumentDetail(document);
    }
    
    @Override
    public List<String> getFunctionNames() {
        CriteriaQuery<Function> criteriaQuery = em.getCriteriaBuilder().createQuery(Function.class);
        Root<Function> from = criteriaQuery.from(Function.class);
        criteriaQuery.select(from);
        criteriaQuery.distinct(true);
        
        TypedQuery<Function> typedQuery = em.createQuery(criteriaQuery);
        List<Function> functions = typedQuery.getResultList();
        return mapperService.mapApiFunctionNames(functions);
    }
    
    @Override
    public List<NewsDto> getNews() {
    	CriteriaQuery<News> criteriaQuery = em.getCriteriaBuilder().createQuery(News.class);
        Root<News> from = criteriaQuery.from(News.class);
        criteriaQuery.select(from);
        TypedQuery<News> typedQuery = em.createQuery(criteriaQuery);
        List<News> news = typedQuery.getResultList();
        return mapperService.mapApiNews(news);
    }

}
