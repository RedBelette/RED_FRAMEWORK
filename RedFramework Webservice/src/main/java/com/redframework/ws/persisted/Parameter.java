package com.redframework.ws.persisted;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * See package.html.
 * @author RedBelette
 * @since 1.0.0.
 */
@Entity
@Table(name="parameter")
public class Parameter {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="parameter_id")
    private int technicalId;
    @Column(nullable=true)
    private String name;
    @Column(nullable=true)
    private String type;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="function_id")
    private Function function;
    
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
    
    public int getTechnicalId() {
        return technicalId;
    }
    
    public void setTechnicalId(int technicalId) {
        this.technicalId = technicalId;
    }
    
    public Function getFunction() {
        return function;
    }
    
    public void setFunction(Function function) {
        this.function = function;
    }
    
}
