package com.redframework.ws.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * See package.html.
 * @author RedBelette
 * @since 1.0.0.
 */
public class FunctionDto {
    
    private String name;
    private String description;
    private List<ParameterDto> parameters = new ArrayList<>();
    private String returnType;
    private List<String> commonUses = new ArrayList<>();
    private DocumentDto document;
    
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
    
    public List<String> getCommonUses() {
        return commonUses;
    }
    
    public List<ParameterDto> getParameters() {
        return parameters;
    }
    
    public void addCommonUse(String commonUse) {
        this.commonUses.add(commonUse);
    }
    
    public void addParameter(ParameterDto parameter) {
        this.parameters.add(parameter);
    }

    public DocumentDto getDocument() {
        return document;
    }
    
    public void setDocument(DocumentDto document) {
        this.document = document;
    }
}
