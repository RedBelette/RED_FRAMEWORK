package com.redframework.ws.persisted;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * See package.html.
 * @author RedBelette
 * @since 1.0.0.
 */
@Entity
@Table(name="common_use")
public class CommonUse {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="common_use_id")
    private int technicalId;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="function_id")
    private Function function;
    @ManyToMany(cascade=CascadeType.ALL)
    @JoinTable(
        name="common_use_codes", 
        joinColumns=@JoinColumn(name="common_use_id"), 
        inverseJoinColumns=@JoinColumn(name="code_id"))
    @JoinColumn(name="common_use_codes_id")
    private List<Code> codes;
    
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
    
    public List<Code> getCodes() {
        return codes;
    }
    
    public void setCodes(List<Code> codes) {
        this.codes = codes;
    }
    
}
