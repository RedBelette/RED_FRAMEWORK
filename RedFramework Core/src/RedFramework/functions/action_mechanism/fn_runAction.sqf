/*
* Function name / Nom de la fonction: RF_fnc_runAction
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN: 
* Usage: Activate the action from the action register.
* Example: ["myaction"] call RF_fnc_runAction
* 
* FR: 
* Utilisation: Active l'action depuis le registre des actions.
* Exemple: ["monaction"] call RF_fnc_runAction
*/
params ["_key"];

_trigger = [_key] call RF_fnc_getAction;

_actionConditionRegistryMap = missionNamespace getVariable "actionConditionRegistryMap";

_statements = ["Get", _key] call _actionConditionRegistryMap;

_trigger setTriggerStatements _statements;