import { Pipe, PipeTransform, SecurityContext } from '@angular/core';
import { DomSanitizer, SafeHtml } from "@angular/platform-browser";

import { CodewikiService } from "./codewiki.service";

@Pipe({name: 'sqf'})
export class SQFPipe implements PipeTransform {

    functions:string[];

    constructor(private sanitized:DomSanitizer, private codewikiService:CodewikiService) {
        codewikiService.getAllFunctionsNames().subscribe(f => this.functions = f);
    };

    transform(value:string):SafeHtml {
        value = value.replace(/call/g, "<span class='instruction'>call</span>")
            .replace(/\[/g, "<span class='bracket'>[</span>")
            .replace(/\]/g, "<span class='bracket'>]</span>")
            .replace(/,/g, "<span class='comma'>,</span>");
        this.functions.forEach(element => {
            let regex = new RegExp(element, "g");
            value = value.replace(regex, "<span class='rfFunction'>" + element + "</span>");
        });
        return this.sanitized.bypassSecurityTrustHtml(value);
    }
}