import { Component, OnInit } from '@angular/core';

import { CodewikiService } from '../codewiki.service';

import { AppComponent } from '../app.component';
import { News } from '../news';

@Component({
  selector: 'app-news',
  templateUrl: './news.component.html',
  styleUrls: ['./news.component.css']
})
export class NewsComponent implements OnInit {

  news:News[];

  constructor(
    private codewikiService:CodewikiService,
    private appComponent:AppComponent
  ) { }

  ngOnInit() {
    this.appComponent.setupPaddingContent();
    this.codewikiService.getNews().subscribe(news => this.news = news);
  }

}
