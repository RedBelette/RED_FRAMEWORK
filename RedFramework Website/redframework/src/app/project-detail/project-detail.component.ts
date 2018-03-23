import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Location } from '@angular/common';

import { CodewikiService } from '../codewiki.service';

import { AppComponent } from '../app.component';
import { Project } from '../project';

@Component({
  selector: 'app-project-detail',
  templateUrl: './project-detail.component.html',
  styleUrls: ['./project-detail.component.css']
})
export class ProjectDetailComponent implements OnInit {

  project:Project;

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
    });
  }

  goToDocumentDetail(id:string) {
    this.router.navigate(["document-detail", id]);
  }

  goBack():void {
    this.location.back();
  }
}
