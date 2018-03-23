import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Location } from '@angular/common';

import { AppComponent } from '../app.component';
import { Project } from '../project';

import { CodewikiService } from '../codewiki.service';

@Component({
  selector: 'app-projects',
  templateUrl: './projects.component.html',
  styleUrls: ['./projects.component.css']
})
export class ProjectsComponent implements OnInit {

  projects:Project[];

  constructor(
    private router:Router, 
    private location:Location,
    private appComponent:AppComponent, 
    private codewikiService:CodewikiService) { }

  ngOnInit() {
    this.appComponent.setupPaddingContent();
    this.codewikiService.getProjects().subscribe(projects => {
      this.projects = projects;
    });
  }

  public goToProjectDetail(projectId:string) {
    this.router.navigate(["project-detail", projectId]);
  }

  goBack():void {
    this.location.back();
  }
}
