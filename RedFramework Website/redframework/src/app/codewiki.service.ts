import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';

import { HttpClient, HttpHeaders } from '@angular/common/http';

import { Category } from './category';
import { Function } from './function';
import { Project } from './project';
import { Document } from './document';
import { News } from './news';

@Injectable()
export class CodewikiService {

  private apiProjectUrl = "http://vps176578.ovh.net:8080/api/projects";
  private apiProjectDetailUrl = "http://vps176578.ovh.net:8080/api/project-detail";
  private apiDocumentsUrl = "http://vps176578.ovh.net:8080/api/documents";
  private apiDocumentDetailUrl = "http://vps176578.ovh.net:8080/api/document-detail";
  private apiNewsUrl = "http://vps176578.ovh.net:8080/api/news";
  private apifunctionNamesUrl = "http://vps176578.ovh.net:8080/api/functions-names";

  constructor(
    private httpClient:HttpClient
  ) { }

  public getAllFunctionsNames(): Observable<string[]> {
    return this.httpClient.get<string[]>(this.apifunctionNamesUrl);
  }

  public getProjects(): Observable<Project[]> {
    return this.httpClient.get<Project[]>(this.apiProjectUrl);
  }

  public getProject(id:string): Observable<Project> {
    const url = `${this.apiProjectDetailUrl}/${id}`;
    return this.httpClient.get<Project>(url);
  }

  public getDocument(id:string): Observable<Document> {
    const url = `${this.apiDocumentDetailUrl}/${id}`;
    return this.httpClient.get<Document>(url);
  }

  public getNews(): Observable<News[]> {
    return this.httpClient.get<News[]>(this.apiNewsUrl);
  }
}
