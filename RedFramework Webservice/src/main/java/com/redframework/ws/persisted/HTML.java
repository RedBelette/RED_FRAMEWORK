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
@Table(name="html")
public class HTML {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="html_id")
    private int technicalId;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="document_id")
    private Document document;
    @ManyToMany(cascade=CascadeType.ALL)
    @JoinTable(
        name="html_codes", 
        joinColumns=@JoinColumn(name="html_id"), 
        inverseJoinColumns=@JoinColumn(name="code_id"))
    @JoinColumn(name="html_codes_id")
    private List<Code> codes;
    
    public int getTechnicalId() {
        return technicalId;
    }
    
    public void setTechnicalId(int technicalId) {
        this.technicalId = technicalId;
    }
    
    public Document getDocument() {
        return document;
    }
    
    public void setDocument(Document document) {
        this.document = document;
    }
    
    public List<Code> getCodes() {
        return codes;
    }
    
    public void setCode(List<Code> codes) {
        this.codes = codes;
    }
    
}
