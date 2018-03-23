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

  private apiProjectUrl = "api/projects";
  private apiDocumentsUrl = "api/documents";
  private apiNewsUrl = "api/news";
  private apifunctionNamesUrl = "api/functionNames";

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
    const url = `${this.apiProjectUrl}/${id}`;
    return this.httpClient.get<Project>(url);
  }

  public getDocument(id:string): Observable<Document> {
    const url = `${this.apiDocumentsUrl}/${id}`;
    return this.httpClient.get<Document>(url);
  }

  public getNews(): Observable<News[]> {
    return this.httpClient.get<News[]>(this.apiNewsUrl);
  }
}
