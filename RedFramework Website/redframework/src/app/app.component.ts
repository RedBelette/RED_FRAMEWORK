import { Component } from '@angular/core';
import { Location } from '@angular/common';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  private title:string = "Red Framework";
  private copyright:string = "Red Framework &copy; RedBelette 2018"
  private paddingClass:string;

  constructor(private location:Location, private router: ActivatedRoute) {}

  setupPaddingContent() {
    this.paddingClass = "padding-32";
  }

  setupNoPaddingContent() {
    this.paddingClass = "";
  }

  get getTitle():string {
    return this.title;
  }
}
