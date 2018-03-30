import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { InMemoryDataService } from './in-memory-data.service';

import { AppComponent } from './app.component';

import { CodewikiService } from './codewiki.service';
import { AppRoutingModule } from './app-routing.module';
import { HomeComponent } from './home/home.component';
import { GettingStartedComponent } from './getting-started/getting-started.component';
import { ProjectsComponent } from './projects/projects.component';
import { ProjectDetailComponent } from './project-detail/project-detail.component';

import { SQFPipe } from './sqf.pipe';
import { DocumentDetailComponent } from './document-detail/document-detail.component';
import { NewsComponent } from './news/news.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    GettingStartedComponent,
    ProjectsComponent,
    SQFPipe,
    ProjectDetailComponent,
    DocumentDetailComponent,
    NewsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule, 
    HttpClientModule
  ],
  providers: [
    CodewikiService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
