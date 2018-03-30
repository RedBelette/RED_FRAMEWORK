import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Location } from '@angular/common';

import { CodewikiService } from '../codewiki.service';

import { AppComponent } from '../app.component';
import { Project } from '../project';
import { Document } from '../document';

@Component({
  selector: 'app-project-detail',
  templateUrl: './project-detail.component.html',
  styleUrls: ['./project-detail.component.css']
})
export class ProjectDetailComponent implements OnInit {

  project:Project;
  documentsRows:Array<Document[]> = []; // Bootstrap Grid Panel management

  constructor(
    private activatedRoute:ActivatedRoute,
    private router:Router,
    private location:Location,
    private appComponent:AppComponent,
    private codewikiService:CodewikiService
  ) { }

  ngOnInit() {
    this.appComponent.setupPaddingContent();
    let projectId:string = this.activatedRoute.snapshot.paramMap.get("id");
    this.codewikiService.getProject(projectId).subscribe(project => {
      this.project = project;
      // Bootstrap Grid Panel management
      if (this.project.documents != null) {
        let i = 0;
        this.project.documents.forEach(d => {
          if (i % 2 == 0) {
            this.documentsRows.push([]);
          }
          this.documentsRows[this.documentsRows.length - 1].push(d);
          i++;
        });
      }
      
    });
  }

  goToDocumentDetail(id:string) {
    this.router.navigate(["document-detail", id]);
  }

  goBack():void {
    this.location.back();
  }
}
