import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';

import { GettingStartedComponent } from './getting-started/getting-started.component';
import { HomeComponent } from './home/home.component';
import { ProjectsComponent } from './projects/projects.component';
import { ProjectDetailComponent } from './project-detail/project-detail.component';
import { DocumentDetailComponent } from './document-detail/document-detail.component';
import { NewsComponent } from './news/news.component';

const routes: Routes = [
  {path: '', component: HomeComponent },
  {path: 'getting-started', component: GettingStartedComponent },
  {path: 'projects', component: ProjectsComponent },
  {path: 'project-detail/:id', component: ProjectDetailComponent },
  {path: 'document-detail/:id', component: DocumentDetailComponent },
  {path: 'news', component: NewsComponent}
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports:[ RouterModule ],
  declarations: []
})
export class AppRoutingModule { }
