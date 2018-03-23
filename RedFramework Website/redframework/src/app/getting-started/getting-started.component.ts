import { Component, OnInit } from '@angular/core';

import { AppComponent } from '../app.component';

@Component({
  selector: 'app-getting-started',
  templateUrl: './getting-started.component.html',
  styleUrls: ['./getting-started.component.css']
})
export class GettingStartedComponent implements OnInit {

  constructor(private appComponent:AppComponent) { }

  ngOnInit() {
    this.appComponent.setupNoPaddingContent();
  }

}
