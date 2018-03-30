import { Project } from './project';

export class Document {
    id:string;
    name:string;
    project:Project;
    description:string;
    htmls:string[];
    functions:Function[];
}