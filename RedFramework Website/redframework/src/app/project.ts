import { Document } from './document';

export class Project {
    id:string;
    name:string;
    currentVersion:string;
    description:string;
    documents:Document[];
}