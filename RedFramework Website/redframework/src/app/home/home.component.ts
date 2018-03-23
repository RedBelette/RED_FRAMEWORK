import { Component, OnInit } from '@angular/core';

import { AppComponent } from '../app.component';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  title:string;
  
  constructor(private appComponent: AppComponent) { }

  ngOnInit() {
    this.appComponent.setupNoPaddingContent();
    this.title = this.appComponent.getTitle;
  }

}
