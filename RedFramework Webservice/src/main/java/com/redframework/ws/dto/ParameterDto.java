package com.redframework.ws.dto;

/**
 * See package.html.
 * @author RedBelette
 * @since 1.0.0.
 */
public class ParameterDto {
    
    private String name;
    private String type;
    private FunctionDto function;
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    public FunctionDto getFunction() {
        return function;
    }
    
    public void setFunction(FunctionDto function) {
        this.function = function;
    }
    
}
