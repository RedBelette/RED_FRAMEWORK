import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

import { CodewikiService } from '../codewiki.service';

import { AppComponent } from '../app.component';
import { Document } from '../document';

@Component({
  selector: 'app-document-detail',
  templateUrl: './document-detail.component.html',
  styleUrls: ['./document-detail.component.css']
})
export class DocumentDetailComponent implements OnInit {

  document:Document;

  constructor(
    private activatedRoute:ActivatedRoute,
    private location:Location,
    private codewikiService:CodewikiService,
    private appComponent:AppComponent
  ) { }

  ngOnInit() {
    this.appComponent.setupPaddingContent();
    let id:string = this.activatedRoute.snapshot.paramMap.get("id");
    this.codewikiService.getDocument(id).subscribe(document => {
      this.document = document;
    });
  }

  goBack():void {
    this.location.back();
  }
}
