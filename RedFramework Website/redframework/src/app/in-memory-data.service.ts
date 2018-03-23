import { InMemoryDbService } from 'angular-in-memory-web-api';

export class InMemoryDataService implements InMemoryDbService {

    createDb() {
        const projects = [
            { 
                id: "core", 
                name: "RedFramework Core", 
                currentVersion: "1.0.0", 
                description: "This is the core of the RedFramework project. This is an Arma 3 addons used by the missions maker. It contain a lot of useful function can be used only by script.",
                documents: [{
                    id: "action",
                    name: "Action mecanism",
                    description: "Trigger in arma are very useful but contain a lot of code to do something. We need to create new paradigm to replace it and to enhanced the behavior. We need an action mecanism. An action is to execute something when the condition is true. In more we can specify if the action is a one shot or in a loop. Maybe you want that the action is timed also.By creating a registry of action we can start and stop an action."
                }]
            },
            { 
                id: "ui", 
                name: "RedFramework UI", 
                currentVersion: "1.0.0", 
                description: "This project manage the user interface inside a game. The main goal is to improve experience for the player by adding some features like conversation panel and more."
            },
            { 
                id: "3den", 
                name: "RedFramework 3den", 
                currentVersion: "1.0.0", 
                description: "This feature creates an easy to used modules for 3den editor. All the modules are an interface for the core project."
            },
            { 
                id: "website", 
                name: "RedFramework Website", 
                currentVersion: "1.0.0", 
                description: "The website is a Portal of the RedFramework project. The main use is to inform persons about what is this Framework and how can them use it. On this portal will be implemented another project of templating generation."
            },
            { 
                id: "template", 
                name: "RedFramework Template", 
                currentVersion: "1.0.0", 
                description: "This project is a dependence of website project and it's engine to generate Zip file containing the basic for the mission maker."
            }
        ];
        const documents = [
            {
                id: "action",
                name: "Action mecanism",
                project:{
                    id: "core", 
                    name: "RedFramework Core", 
                    currentVersion: "1.0.0", 
                    description: "This is the core of the RedFramework project. This is an Arma 3 addons used by the missions maker. It contain a lot of useful function can be used only by script."
                },
                description: "Trigger in arma are very useful but contain a lot of code to do something. We need to create new paradigm to replace it and to enhanced the behavior. We need an action mecanism. An action is to execute something when the condition is true. In more we can specify if the action is a one shot or in a loop. Maybe you want that the action is timed also.By creating a registry of action we can start and stop an action.",
                html: [
                    "<h3>Basic action mecanism</h3><p>Actions act as triggers. The actions are of 3 types:</p><p>Simple action: <code class=\"sqf\">[_condition, _code] call RF_fnc_action;</code></p><p>Delayed action: <code class=\"sqf\">[_condition, _code, _delay] call RF_fnc_delayedAction;</code></p><p>Repeated action:<code class=\"sqf\">[_code, _time] call RF_fnc_repeatedAction;</code></p><br><p>Actions can be added to a share register. It will control your action, start it, stop it or resume in the case of a repeatedAction.</p><p>Init register: <code class=\"sqf\">call RF_fnc_actionRegistry;</code></p><p>Add action: <code class=\"sqf\">[_key, _action] call RF_fnc_addAction;</code></p><p>Start action: <code class=\"sqf\">[_key] call RF_fnc_runAction;</code></p><p>Stop action: <code class=\"sqf\">[_key] call RF_fnc_stopAction;</code></p>",
                    "<h3>Chapter 1</h3><p>blabla</p><h3>Chapter 2</h3><p>blabla</p>"
                ],
                functions: [
                    {
                        name: "RF_fnc_action",
                        description: "Execute an action when a condition is true",
                        parameters: [
                            {
                                name: "condition",
                                type: "string"
                            },
                            {
                                name: "code",
                                type: "string or code"
                            }
                        ],
                        returnType: "void",
                        commonUses: ["['alive michel', 'michel setDamage 1'] call RF_fnc_action;"]
                    },
                    {
                        name: "RF_fnc_delayedAction",
                        description: "Execute an action when a condition is true",
                        parameters: [
                            {
                                name: "condition",
                                type: "string"
                            },
                            {
                                name: "code",
                                type: "string or code"
                            }
                        ],
                        returnType: "void",
                        commonUses: ["['alive michel', 'michel setDamage 1'] call RF_fnc_action;","['alive michel', 'michel setDamage 1'] call RF_fnc_action;"]
                    }
                ]
            }
        ];
        const news = [
            {
                id: "underconstruction",
                title: "Website underconstruction",
                author: "RedBelette",
                date: "23/03/2018",
                html: "<p>Our website is <u>underconstruction</u> and will be better in the future. I hope that the informations inside is helpful for you.<br>You will find all the documentation on the projects menu from the navigation bar.</p><p>Best regards.<br>RedBelette</p>"
            }
        ]; 
        return {projects, documents, news};
    }

}