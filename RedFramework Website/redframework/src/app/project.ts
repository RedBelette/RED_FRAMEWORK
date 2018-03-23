import { Document } from './document';

export class Project {
    id:string;
    name:string;
    version:string;
    description:string;
    documents:Document[];
}