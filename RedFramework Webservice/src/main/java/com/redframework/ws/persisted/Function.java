package com.redframework.ws.persisted;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * See package.html.
 * @author RedBelette
 * @since 1.0.0.
 */
@Entity
@Table(name="function")
public class Function {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="function_id")
    private int technicalId;
    @Column(nullable=false)
    private String name;
    @Column(nullable=false)
    private String description;
    @OneToMany(mappedBy="function")
    private List<Parameter> parameters = new ArrayList<>();
    @Column(nullable=false)
    private String returnType;
    @OneToMany(mappedBy="function")
    private List<CommonUse> commonUses = new ArrayList<>();
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="document_id")
    private Document document;
    
    public int getTechnicalId() {
        return technicalId;
    }
    
    public void setTechnicalId(int technicalId) {
        this.technicalId = technicalId;
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
    
    public String getReturnType() {
        return returnType;
    }
    
    public void setReturnType(String returnType) {
        this.returnType = returnType;
    }
    
    public List<CommonUse> getCommonUses() {
        return commonUses;
    }
    
    public List<Parameter> getParameters() {
        return parameters;
    }
    
    public void addCommonUse(CommonUse commonUse) {
        this.commonUses.add(commonUse);
    }
    
    public void addParameter(Parameter parameter) {
        this.parameters.add(parameter);
    }
    
    public Document getDocument() {
        return document;
    }
    
    public void setDocument(Document document) {
        this.document = document;
    }
}
